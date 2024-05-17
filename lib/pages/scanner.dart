import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _flashOn = false;
  bool _frontCam = false;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  void _checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        // Permission granted, proceed with initializing camera
        setState(() {});
      } else {
        // Handle the case where permission is not granted
        print('Camera permission denied');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: _qrKey,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 5,
            ),
            onQRViewCreated: _onQRViewCreated,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Text(
                "Patrol Track",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () async {
                    setState(() {
                      _flashOn = !_flashOn;
                    });
                    await _controller?.toggleFlash();
                  },
                  icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () async {
                    await _controller?.flipCamera();
                    setState(() {
                      _frontCam = !_frontCam;
                    });
                  },
                  icon: Icon(_frontCam ? Icons.camera_front : Icons.camera_rear),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    controller.scannedDataStream.listen((val) async {
      print('Scanned QR: ${val.code}'); // Debug log
      if (mounted) {
        try {
          await _controller?.pauseCamera();
          await Future.delayed(Duration(milliseconds: 300)); // Delay for smooth navigation
          Navigator.pop(context, val.code);
        } catch (e) {
          print('Error: $e'); // Handle error
        }
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}