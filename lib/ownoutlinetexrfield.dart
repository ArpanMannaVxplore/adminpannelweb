import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnOutlineTextField extends StatefulWidget {
  const OwnOutlineTextField(
      {Key? key,
        this.isReadOnly = false,
        this.onTap,
        required this.placeHolder,
        this.capitalization = TextCapitalization.sentences,
        this.keyboard,
        this.onChange,
        this.action,
        this.initial,
        this.preferPlaceholderStyle,
        this.preferStyle,
        this.prefix})
      : super(key: key);
  final String placeHolder;
  final TextCapitalization capitalization;
  final TextInputType? keyboard;
  final Widget? prefix;
  final String? initial;
  final TextInputAction? action;
  final TextStyle? preferPlaceholderStyle;
  final TextStyle? preferStyle;
  final bool isReadOnly;
  final void Function()? onTap;
  final void Function(String)? onChange;

  @override
  State<OwnOutlineTextField> createState() => _OwnOutlineTextFieldState();
}

class _OwnOutlineTextFieldState extends State<OwnOutlineTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initial);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onChange?.call(widget.initial ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff99c2ff).withOpacity(0.2),
            blurRadius: 0.15,
            spreadRadius: 0.15,
            offset: const Offset(
              0.07,
              3,
            ),
          )
        ],
      ),
      child: CupertinoTextField(
        maxLines: 1,placeholderStyle: TextStyle(color: Colors.grey),
        placeholder: widget.placeHolder,
        controller: _controller,
        textCapitalization: widget.capitalization,
        prefix: widget.prefix,
        keyboardType: widget.keyboard,
        onChanged: (newText) {
          widget.onChange?.call(newText);
        },
        onSubmitted: widget.onChange,
        padding: EdgeInsets.all(15),
        textInputAction: widget.action,
        readOnly: widget.isReadOnly,
        onTap: widget.onTap,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: allShadow(),
            border: Border.all(color: Colors.white)),
      ),
    );
  }
}
