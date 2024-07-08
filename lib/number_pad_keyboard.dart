library number_pad_keyboard;

import 'package:flutter/material.dart';

class NumberPadKeyboard extends StatelessWidget {
  const NumberPadKeyboard({
    super.key,
    required this.addDigit,
    required this.backspace,
    this.deleteColor = Colors.black,
    this.enterButtonColor,
    this.enterButtonText = 'ENTER',
    this.enterButtonTextStyle,
    this.deleteIcon,
    this.deleteIconSize,
    this.numberStyle,
    this.backgroundColor,
    required this.onEnter,
  });

  final void Function(int) addDigit;
  final VoidCallback backspace;
  final Color? deleteColor;
  final Color? enterButtonColor;
  final String enterButtonText;
  final TextStyle? enterButtonTextStyle;
  final Widget? deleteIcon;
  final double? deleteIconSize;
  final TextStyle? numberStyle;
  final Color? backgroundColor;
  final void Function()? onEnter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color.fromARGB(255, 238, 237, 237),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          _buildRow(
            [
              Expanded(
                child: _buildNumberPad(
                  1,
                  () => addDigit(1),
                  numberStyle: numberStyle,
                ),
              ),
              Expanded(
                child: _buildNumberPad(
                  2,
                  () => addDigit(2),
                  numberStyle: numberStyle,
                ),
              ),
              Expanded(
                child: _buildNumberPad(
                  3,
                  () => addDigit(3),
                  numberStyle: numberStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          _buildRow(
            [
              Expanded(
                child: _buildNumberPad(
                  4,
                  () => addDigit(4),
                  numberStyle: numberStyle,
                ),
              ),
              Expanded(
                child: _buildNumberPad(
                  5,
                  () => addDigit(5),
                  numberStyle: numberStyle,
                ),
              ),
              Expanded(
                child: _buildNumberPad(
                  6,
                  () => addDigit(6),
                  numberStyle: numberStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          _buildRow([
            Expanded(
              child: _buildNumberPad(
                7,
                () => addDigit(7),
                numberStyle: numberStyle,
              ),
            ),
            Expanded(
              child: _buildNumberPad(
                8,
                () => addDigit(8),
                numberStyle: numberStyle,
              ),
            ),
            Expanded(
              child: _buildNumberPad(
                9,
                () => addDigit(9),
                numberStyle: numberStyle,
              ),
            ),
          ]),
          const SizedBox(height: 5),
          _buildRow([
            Expanded(
              child: IconButton(
                onPressed: backspace,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                icon: deleteIcon ??
                    Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: deleteColor,
                      size: deleteIconSize,
                    ),
              ),
            ),
            Expanded(
              child: _buildNumberPad(
                0,
                () => addDigit(0),
                numberStyle: numberStyle,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: onEnter,
                style: TextButton.styleFrom(
                  backgroundColor: enterButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                ),
                child: Text(
                  enterButtonText,
                  style: enterButtonTextStyle ??
                      const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget _buildNumberPad(int n, void Function()? onPressed,
      {TextStyle? numberStyle}) {
    return BuildNumberPad(
      n: n,
      onPressed: onPressed,
      numberStyle: numberStyle,
    );
  }
}

class BuildNumberPad extends StatelessWidget {
  const BuildNumberPad({
    super.key,
    required this.n,
    required this.onPressed,
    this.numberStyle,
  });

  final int n;
  final void Function()? onPressed;
  final TextStyle? numberStyle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      icon: SizedBox(
        child: Text(
          n.toString(),
          style: numberStyle ??
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
