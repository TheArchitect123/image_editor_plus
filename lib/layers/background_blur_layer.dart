import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_editor_plus_fork/data/layer.dart';

/// Image layer to blur background using BackdropFilter
class BackgroundBlurLayer extends StatefulWidget {
  final BackgroundBlurLayerData layerData;
  final VoidCallback? onUpdate;
  final bool editable;

  const BackgroundBlurLayer({
    super.key,
    required this.layerData,
    this.onUpdate,
    this.editable = false,
  });

  @override
  State<BackgroundBlurLayer> createState() => _BackgroundBlurLayerState();
}

class _BackgroundBlurLayerState extends State<BackgroundBlurLayer> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.layerData.radius,
          sigmaY: widget.layerData.radius,
        ),
        child: Container(
          color: widget.layerData.color
              .withAlpha((widget.layerData.opacity * 100).toInt()),
        ),
      ),
    );
  }
}
