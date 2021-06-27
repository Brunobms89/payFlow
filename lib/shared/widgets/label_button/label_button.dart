import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle styles;
  final String label;
  const LabelButton({Key key, this.label, this.onPressed, this.styles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: styles ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}
