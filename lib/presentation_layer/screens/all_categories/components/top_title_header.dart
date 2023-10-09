import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TopTextHeader extends StatelessWidget {
  const TopTextHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 50, left: 50),
      child: AutoSizeText(
        'What would you like to watch?',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 33,
            color: Colors.white.withOpacity(0.85)),
      ),
    );
  }
}
