import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? previosController;
  final FocusNode focusNode;
  final int index;
  final void Function() onSubmit;

  const OtpTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.index,
    required this.onSubmit,
    this.previosController,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  bool hasValue = false;
  void onChanged(String value) {
    if (value.isEmpty) {
      hasValue = false;
      if (widget.index == 0) {
        widget.focusNode.unfocus();
      } else {
        widget.focusNode.previousFocus();
      }
    } else {
      hasValue = true;
      if (widget.index == 5) {
        widget.focusNode.unfocus();
        widget.onSubmit();
      } else {
        widget.focusNode.nextFocus();
      }
    }
    setState(() {});
  }

  KeyEventResult onKeyEventCallback(FocusNode node, event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (widget.controller.text.isEmpty && widget.index != 0) {
        setState(() {
          hasValue = false;
        });
        widget.focusNode.previousFocus();
        widget.previosController?.clear();

        return KeyEventResult.handled;
      } else {
        widget.controller.clear();
        // widget.focusNode.previousFocus();
      }
    }

    return KeyEventResult.ignored;
  }

  void _controllerListener() {
    if (widget.controller.text.isEmpty) {
      setState(() {
        hasValue = false;
      });
      widget.focusNode.requestFocus();
    }
  }

  @override
  void initState() {
    widget.focusNode.onKeyEvent = onKeyEventCallback;
    widget.controller.addListener(_controllerListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: hasValue
            ? context
                  .colorScheme
                  .primaryColor // لما يكتب رقم → المربع أسود
            : context.colorScheme.lightBlueColor, // الطبيعي
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: hasValue
              ? context
                    .colorScheme
                    .primaryColor // لما يكتب رقم → المربع أسود
              : context.colorScheme.lightBlueColor,
          width: 2,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white, // رقم أبيض
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(counterText: "", border: InputBorder.none),
      ),
    );
  }
}
