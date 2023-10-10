import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final double rate;
  const Rate({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: rate >= 2 ? Colors.amber : Colors.white.withOpacity(0.5),
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: rate >= 4 ? Colors.amber : Colors.white.withOpacity(0.5),
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: rate >= 6 ? Colors.amber : Colors.white.withOpacity(0.5),
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: rate >= 8 ? Colors.amber : Colors.white.withOpacity(0.5),
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: rate >= 9.1 ? Colors.amber : Colors.white.withOpacity(0.5),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '$rate/10',
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
        ),
      ],
    );
  }
}
