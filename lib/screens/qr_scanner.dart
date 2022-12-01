import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../config/palette.dart';
import '../providers/locationsData.dart';
import '../providers/sockets.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? code;
  String message = "Escanea un Código QR";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
            key: qrKey,
            onQRViewCreated: (QRViewController controller) {
              setState(() {
                this.controller = controller;
              });
              controller.scannedDataStream.listen((barcode) {
                setState(() {
                  this.code = barcode;
                });

                String code = barcode.code.toString();
                print(code);
                switch (code.substring(0, 3)) {
                  case 'LOC':
                    {
                      controller.pauseCamera();
                      context
                          .read<ProviderLocations>()
                          .loadLocation(code.substring(4))
                          .then((value) => {
                                print("name--Z" +
                                    context
                                        .read<ProviderLocations>()
                                        .currentLocation
                                        .name),
                                // context.read<ProviderLocations>().sayInfo(),
                                Navigator.pushNamed(context, '/ar')
                                    .then((value) => controller.resumeCamera())
                              });

                      break;
                    }
                  case 'ENT':
                    {
                      controller.pauseCamera();

                      context
                          .read<ProviderSocket>()
                          .sendEntry(code.substring(3));
                      Navigator.pushNamed(context, '/entry')
                          .then((value) => controller.resumeCamera());

                      break;
                    }
                  default:
                    {
                      print("XDDDDDD");
                      setState(() {
                        this.message = "CÓDIGO INVALIDO";
                      });
                    }
                }

                print("QR FOUND");

                //     print(barcode.code);
              });
            },
            overlay: QrScannerOverlayShape(
              borderColor: Palette.tecBlue,
              borderRadius: 10.0,
              borderLength: 30.0,
              borderWidth: 10.0,
            )),
        Positioned(
            top: 10.0,
            right: 20.0,
            child: Text(
              DateTime.now().hour.toString().padLeft(2, '0') +
                  ":" +
                  DateTime.now().minute.toString().padLeft(2, '0'),
              style: const TextStyle(
                  fontSize: 95.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Positioned(
          bottom: 50.0,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(10.0),
            color: Palette.tecBlue.withOpacity(0.5),
            child: Center(
                child: Text(
              message,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
