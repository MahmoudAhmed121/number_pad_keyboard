/// A Flutter package that provides a customizable number pad keyboard widget for entering PIN codes or numeric input.
library number_pad_keyboard;

import 'package:flutter/material.dart';

/// Widget for a number pad keyboard that allows entering numeric input.
class NumberPadKeyboard extends StatelessWidget {
  /// Creates a number pad keyboard widget.
  ///
  /// The [addDigit], [backspace], and [onEnter] parameters must not be null.
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

  /// Callback function to add a digit when a number button is pressed.
  final void Function(int) addDigit;

  /// Callback function when the backspace button is pressed.
  final VoidCallback backspace;

  /// Color of the delete (backspace) button icon.
  final Color? deleteColor;

  /// Color of the enter button.
  final Color? enterButtonColor;

  /// Text displayed on the enter button.
  final String enterButtonText;

  /// Text style of the enter button text.
  final TextStyle? enterButtonTextStyle;

  /// Custom widget for the delete (backspace) button icon.
  final Widget? deleteIcon;

  /// Size of the delete (backspace) button icon.
  final double? deleteIconSize;

  /// Text style for the numbers displayed on the keyboard.
  final TextStyle? numberStyle;

  /// Background color of the keyboard.
  final Color? backgroundColor;

  /// Callback function when the enter button is pressed.
  final void Function()? onEnter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color.fromARGB(255, 238, 237, 237),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          _buildRow([
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
          ]),
          const SizedBox(height: 5),
          _buildRow([
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
          ]),
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
                icon: deleteIcon ??
                    Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: deleteColor,
                      size: deleteIconSize ?? 24.0,
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

/// Widget for each individual number button in the number pad.
class BuildNumberPad extends StatelessWidget {
  /// Creates a number pad button with the specified number [n].
  ///
  /// The [n] and [onPressed] parameters must not be null.
  const BuildNumberPad({
    super.key,
    required this.n,
    required this.onPressed,
    this.numberStyle,
  });

  /// The number displayed on the button.
  final int n;

  /// Callback function when the button is pressed.
  final void Function()? onPressed;

  /// Text style for the number displayed on the button.
  final TextStyle? numberStyle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Text(
        n.toString(),
        style: numberStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
      ),
    );
  }
}
