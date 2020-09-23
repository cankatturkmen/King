import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {
  final String buttonText;
  final Color butonColor;
  final Color textColor;
  final double radius;
  final double height;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const MenuButtons({
    Key key,
    @required this.buttonText,
    this.butonColor,
    this.textColor,
    this.radius: 16,
    this.height: 45,
    this.onPressed,
    this.buttonIcon,
  })  : assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: height,
        child: RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buttonIcon != null ? buttonIcon : Container(),
              Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
              buttonIcon != null
                  ? Opacity(
                      opacity: 0,
                      child: buttonIcon,
                    )
                  : Container()
            ],
          ),
          color: butonColor,
        ),
      ),
    );
    
  }
  
}


