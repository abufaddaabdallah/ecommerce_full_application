import 'package:flutter/material.dart';

Row headRow({required String text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.chevron_right,
          size: 24,
        ),
      ),
    ],
  );
}
