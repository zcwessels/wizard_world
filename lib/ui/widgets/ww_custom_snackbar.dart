import 'package:flutter/material.dart';

class WWCustomSnackBar {
  final String message;
  final Color fieldColor;
  final int duration;
  final Widget? icon;
  OverlayEntry? _overlayEntry;

  WWCustomSnackBar({
    required this.message,
    required this.fieldColor,
    this.duration = 3,
    this.icon,
  });

  void show(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(Duration(seconds: duration), () {
      _overlayEntry?.remove();
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                if (icon != null) icon!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
