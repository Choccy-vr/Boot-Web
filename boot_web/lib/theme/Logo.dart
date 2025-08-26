import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/theme/terminal_theme.dart'; // Import your theme

class LogoScreenshotPage extends StatelessWidget {
  const LogoScreenshotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: TerminalColors.black, // Use your terminal black
      body: Center(
        child: Container(
          width: 512,
          height: 512,
          decoration: BoxDecoration(
            color: colorScheme.primary.withAlpha(
              26,
            ), // Your theme's primary with opacity
            borderRadius: BorderRadius.circular(64),
            border: Border.all(
              color: colorScheme.primary.withAlpha(
                77,
              ), // Your theme's primary outline
              width: 8,
            ),
          ),
          child: Center(
            child: Icon(
              Symbols.terminal,
              color: colorScheme.primary, // Your theme's primary color
              size: 256,
            ),
          ),
        ),
      ),
    );
  }
}
