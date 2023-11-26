import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class ParentModeScreen extends StatefulWidget {
  @override
  _ParentModeScreenState createState() => _ParentModeScreenState();
}

class _ParentModeScreenState extends State<ParentModeScreen> {
  late RTCPeerConnection _peerConnection;
  late MediaStream _remoteStream;
  late RTCVideoRenderer _remoteRenderer; // Add this line

  @override
  void initState() {
    super.initState();
    _initWebRTC();
    _remoteRenderer = RTCVideoRenderer(); // Initialize RTCVideoRenderer
    _remoteRenderer.initialize(); // Initialize the renderer
  }

  Future<void> _initWebRTC() async {
    _peerConnection = await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    });

    _peerConnection.onTrack = (event) {
      setState(() {
        _remoteStream = event.streams[0];
        _remoteRenderer.srcObject = _remoteStream; // Set the stream to the renderer
      });
    };
  }

  @override
  void dispose() {
    _remoteStream.dispose();
    _peerConnection.dispose();
    _remoteRenderer.dispose(); // Dispose the renderer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parent Mode')),
      body: RTCVideoView(_remoteRenderer), // Use RTCVideoRenderer
    );
  }
}
