import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

extension HoverExtension on Widget {
  static final appContainer = html.window.document.getElementById(
    'app-container',
  );

  // The code block is optional.
  // If want to use, add as such: widget.showCursorOnHover
  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      // More information can be found: https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
      // The different cursors: help, wait, crosshair, not-allowed, zoom-in, grab
      // Comment and uncomment to see the different types of cursor
      onHover: (_) => appContainer.style.cursor = 'pointer',
      // onHover: (_) => appContainer.style.cursor = 'help',
      // onHover: (_) => appContainer.style.cursor = 'wait',
      // onHover: (_) => appContainer.style.cursor = 'crosshair',
      // onHover: (_) => appContainer.style.cursor = 'not-allowed',
      onExit: (_) => appContainer.style.cursor = 'default',
    );
  }
}
