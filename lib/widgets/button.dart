import 'package:flutter/material.dart';
import '../values/colors.dart' as custom_color;

class DarkButton extends StatefulWidget {
  const DarkButton({Key? key, required this.text, this.icon}) : super(key: key);
  final String text;
  final dynamic icon;
  @override
  _DarkButton createState() => _DarkButton();
}

class _DarkButton extends State<DarkButton> {
  Widget iconSwitch() {
    if (widget.icon is IconData) {
      return Row(
        children: [
          Icon(widget.icon, color: Colors.white, size: 35.0),
          const SizedBox(
            width: 10,
          ),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: custom_color.primaryColor,
        ),
        height: 60,
        width: MediaQuery.of(context).size.width - 40,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconSwitch(),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
