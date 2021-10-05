import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final Widget? prefixIcon;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onSubmited;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool needTheSpace;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? fillColor;
  final bool? isHint;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {Key? key, this.prefixIcon,
        this.validator,
        required this.hint,
        this.suffixIcon,
        required this.obscureText,
        this.inputFormatters,
        this.onChanged,
        this.onSubmited,
        this.borderColor,
        this.cursorColor,
        this.fillColor,
        this.textColor,
        this.isHint,
        required this.needTheSpace,
        this.keyboardType,
        this.focusNode}) : super(key: key);
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  ConstStyle constStyle = ConstStyle();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.needTheSpace ? 10 : 0,
        ),
        TextFormField(
          validator: widget.validator,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: widget.onSubmited,
          onChanged: widget.onChanged,
          cursorColor: widget.cursorColor??Colors.white.withAlpha(70),
          style: TextStyle(color: widget.textColor??widget.textColor??Colors.white),
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
              filled: widget.fillColor!= null?true:false,
              fillColor: widget.fillColor,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor??Colors.white.withAlpha(70))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor??Colors.white.withAlpha(70))),
              isDense: true,
              labelText: widget.isHint == true?null:widget.hint,
              hintText: widget.isHint == true?widget.hint:null,
              hintStyle: TextStyle(color: widget.textColor??Colors.white.withAlpha(70)),
              labelStyle: TextStyle(color: widget.textColor??Colors.white.withAlpha(70)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor??Colors.white.withAlpha(70))),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon),
        )
      ],
    );
  }
}