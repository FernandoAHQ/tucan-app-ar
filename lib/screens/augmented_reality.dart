import 'package:ar_demo/config/palette.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import '../providers/locationsData.dart';

class AugmentedScreen extends StatefulWidget {
  const AugmentedScreen({Key? key}) : super(key: key);

  @override
  State<AugmentedScreen> createState() => _AugmentedScreenState();
}

class _AugmentedScreenState extends State<AugmentedScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

//String localObjectReference;
  ARNode? localObjectNode;

//String webObjectReference;
  ARNode? webObjectNode;

  var newNode = ARNode(
    type: NodeType.webGLB,
    uri:
        "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
    scale: Vector3(0.2, 0.2, 0.2),
    position: Vector3(-0.5, -0.2, 0.0),
  );

  void addNode(ARNode node) async {
    await arObjectManager.addNode(node);
  }

  _onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    // 1
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    // 2
    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: false,
          customPlaneTexturePath: "triangle.png",
          showWorldOrigin: true,
          handleTaps: false,
        );
    // 3
    this.arObjectManager.onInitialize();

    addNode(newNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProviderLocations>().sayInfo();
    return Scaffold(
      body: Stack(children: [
        ARView(onARViewCreated: _onARViewCreated),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.pink,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/location");
              },
              color: Palette.tecBlue,
              child: const Text(
                "Más Información",
                style: TextStyle(fontSize: 26.0, color: Palette.tecGreyLight),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
