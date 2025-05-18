//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
//
// class MLKitBarcodeScanner extends StatefulWidget {
//   // final List<CameraDescription> cameras;
//   const MLKitBarcodeScanner({required this.cameras, super.key});
//
//   @override
//   State<MLKitBarcodeScanner> createState() => _MLKitBarcodeScannerState();
// }
//
// class _MLKitBarcodeScannerState extends State<MLKitBarcodeScanner> {
//   late CameraController _cameraController;
//   late BarcodeScanner _barcodeScanner;
//   bool _isDetecting = false;
//   List<Barcode> _detectedBarcodes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _barcodeScanner = BarcodeScanner();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     final camera = widget.cameras.firstWhere(
//       (c) => c.lensDirection == CameraLensDirection.back,
//     );
//
//     _cameraController =
//         CameraController(camera, ResolutionPreset.medium, enableAudio: false);
//
//     await _cameraController.initialize();
//     _cameraController.startImageStream(_processCameraImage);
//
//     setState(() {});
//   }
//
//   Future<void> _processCameraImage(CameraImage image) async {
//     if (_isDetecting) return;
//     _isDetecting = true;
//
//     try {
//       final WriteBuffer allBytes = WriteBuffer();
//       for (Plane plane in image.planes) {
//         allBytes.putUint8List(plane.bytes);
//       }
//       final bytes = allBytes.done().buffer.asUint8List();
//
//       final Size imageSize =
//           Size(image.width.toDouble(), image.height.toDouble());
//       InputImageFormat getInputImageFormat(int rawFormat) {
//         switch (rawFormat) {
//           case 35: // ImageFormat.yuv_420_888 (common on Android)
//             return InputImageFormat.nv21;
//           // Add other mappings if necessary
//           default:
//             return InputImageFormat.nv21; // or InputImageFormat.yuv420
//         }
//       }
//
//       final inputImage = InputImage.fromBytes(
//         bytes: bytes,
//         metadata: InputImageMetadata(
//           size: imageSize,
//           rotation: InputImageRotation.rotation0deg,
//           format: getInputImageFormat(image.format.raw),
//           bytesPerRow: image.planes.first.bytesPerRow,
//         ),
//       );
//
//       final barcodes = await _barcodeScanner.processImage(inputImage);
//       if (barcodes.isNotEmpty) {
//         final value = barcodes.first.rawValue;
//         if (value != null && context.mounted) {
//           await _cameraController.stopImageStream();
//           Navigator.pop(context, value); // Return the result to previous screen
//         }
//       }
//
//       setState(() {
//         _detectedBarcodes = barcodes;
//       });
//     } catch (e) {
//       debugPrint("Barcode scan error: $e");
//     } finally {
//       _isDetecting = false;
//     }
//   }
//
//   @override
//   void dispose() {
//     _cameraController.dispose();
//     _barcodeScanner.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_cameraController.value.isInitialized) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     final previewSize = _cameraController.value.previewSize!;
//     return Scaffold(
//       appBar: AppBar(title: const Text("Barcode Scanner")),
//       body: Stack(
//         children: [
//           CameraPreview(_cameraController),
//           BarcodeOverlay(
//             barcodes: _detectedBarcodes,
//             imageSize: Size(
//               previewSize.height,
//               previewSize.width,
//             ), // Note the swap due to rotation
//           ),
//         ],
//       ),
//     );
//   }
// }
