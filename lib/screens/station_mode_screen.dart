import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class StationModeScreen extends StatefulWidget {
  @override
  _StationModeScreenState createState() => _StationModeScreenState();
}

class _StationModeScreenState extends State<StationModeScreen> {
  late RTCPeerConnection _peerConnection;
  late MediaStream _localStream;
  late RTCVideoRenderer _localRenderer; // Add this line

  @override
  void initState() {
    super.initState();
    _initWebRTC();
    _localRenderer = RTCVideoRenderer(); // Initialize RTCVideoRenderer
    _localRenderer.initialize(); // Initialize the renderer
  }

  Future<void> _initWebRTC() async {
    _peerConnection = await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    });

    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    _localStream.getTracks().forEach((track) {
      _peerConnection.addTrack(track, _localStream);
    });

    _localRenderer.srcObject = _localStream; // Set the stream to the renderer
  }

  @override
  void dispose() {
    _localStream.dispose();
    _peerConnection.dispose();
    _localRenderer.dispose(); // Dispose the renderer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Station Mode')),
      body: RTCVideoView(_localRenderer), // Use RTCVideoRenderer
    );
  }
}
