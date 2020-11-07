import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {

  final bool enable;
  final Function onPress;
  final String text;

  ButtonPrimary({@required this.enable, @required this.onPress, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: enable ? Colors.teal : Colors.grey[400],
          borderRadius: BorderRadius.circular(8)
      ),
      child: MaterialButton(
        onPressed:  enable ? onPress : null,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

}