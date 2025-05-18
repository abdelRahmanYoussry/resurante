// import 'package:flutter/material.dart';
//
// class BarcodeOverlay extends StatelessWidget {
//   final List<Barcode> barcodes;
//   final Size imageSize;
//
//   const BarcodeOverlay(
//       {required this.barcodes, required this.imageSize, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _BarcodePainter(barcodes: barcodes, imageSize: imageSize),
//       size: Size.infinite,
//     );
//   }
// }
//
// class _BarcodePainter extends CustomPainter {
//   final List<Barcode> barcodes;
//   final Size imageSize;
//
//   _BarcodePainter({required this.barcodes, required this.imageSize});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.greenAccent
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;
//
//     for (final barcode in barcodes) {
//       final rect = barcode.boundingBox;
//       if (rect != null) {
//         final scaleX = size.width / imageSize.width;
//         final scaleY = size.height / imageSize.height;
//
//         final scaledRect = Rect.fromLTRB(
//           rect.left * scaleX,
//           rect.top * scaleY,
//           rect.right * scaleX,
//           rect.bottom * scaleY,
//         );
//         canvas.drawRect(scaledRect, paint);
//
//         final textPainter = TextPainter(
//           text: TextSpan(
//             text: barcode.rawValue ?? '',
//             style: const TextStyle(color: Colors.greenAccent, fontSize: 14),
//           ),
//           textDirection: TextDirection.ltr,
//         )..layout();
//         textPainter.paint(canvas, scaledRect.topLeft);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant _BarcodePainter oldDelegate) {
//     return oldDelegate.barcodes != barcodes;
//   }
// }
