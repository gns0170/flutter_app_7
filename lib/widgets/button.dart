import 'package:flutter/material.dart';
import '../values/colors.dart' as custom_color;

class DarkButton extends StatefulWidget {
  const DarkButton(
      {Key? key,
      required this.text,
      this.icon,
      this.height,
      this.width,
      this.onPressed,
      this.fontStyle})
      : super(key: key);
  final String text;
  final dynamic icon;

  final dynamic onPressed;
  final dynamic width;
  final dynamic height;

  final dynamic fontStyle;
  @override
  _DarkButton createState() => _DarkButton();
}

class _DarkButton extends State<DarkButton> {
  dynamic width;
  dynamic height;

  void size() {
    if (widget.width is int) {
      width = widget.width.toDouble();
    } else {
      width = widget.width is double
          ? widget.width
          : (MediaQuery.of(context).size.width - 40);
    }
    if (widget.height is int) {
      height = widget.height.toDouble();
    } else {
      height = widget.height is double ? widget.height : 60.00;
    }
  }

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
    size();
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 8),
        )
      ]),
      height: height,
      width: width,
      child: Material(
        color: custom_color.primaryColor2,
        child: InkWell(
          onTap: widget.onPressed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconSwitch(),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: widget.fontStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
