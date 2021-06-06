import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? icon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged onChanged;
  final bool autoFocus;
  final TextInputAction inputAction;

  const AppTextField({
    required Key key,
    this.icon,
    required this.hint,
    this.errorText = '',
    this.isObscure = false,
    required this.inputType,
    required this.textController,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.focusNode,
    this.onFieldSubmitted,
    required this.onChanged,
    this.autoFocus = false,
    required this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 25,
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autoFocus,
      textInputAction: inputAction,
      obscureText: this.isObscure,
      keyboardType: this.inputType,
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
          hintText: this.hint,
          errorText: errorText,
          counterText: '',
          icon: this.icon
      ),
    );
  }

}
