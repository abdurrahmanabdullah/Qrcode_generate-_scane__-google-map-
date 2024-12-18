import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data' as typed_data;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode/app/modules/home/views/generate_code.dart';

import '../controllers/home_controller.dart';

class ScanCode extends GetView<HomeController> {
  const ScanCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan QR Code'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const GenerateCode());
                },
                icon: const Icon(Icons.qr_code))
          ],
          centerTitle: true,
        ),
        body: MobileScanner(
          controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates, returnImage: true),
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image as Uint8List?;
            for (final barcode in barcodes) {
              print('Barcode found! ${barcode.rawValue}');
            }
            if (image != null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text(barcodes.first.rawValue ?? ""),
                        content: Image(
                            image: MemoryImage(image as typed_data.Uint8List)));
                  });
            }
            //print(capture);
          },
        ));
  }
}