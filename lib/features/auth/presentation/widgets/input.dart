import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Input extends StatefulWidget {
  const Input(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hint});

  final TextEditingController controller;
  final bool obscureText;
  final String hint;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool hidden;

  @override
  void initState() {
    super.initState();
    hidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: hidden,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).primaryColor),
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).primaryColor),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/eye-slash.svg',
                      width: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => setState(() {
                          hidden = !hidden;
                        }))
                : null
                ),
      ),
    );
  }
}
