import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function() onBtTap;
  final String btText;
  final Color? btColor;

  const CustomRoundedButton({
    super.key,
    required this.onBtTap,
    required this.btText,
    this.btColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btColor ?? Colors.blue,
        shape: const StadiumBorder(),
      ),
      onPressed: () {
        onBtTap();
      },
      child: Text(btText),
    );
  }
}
