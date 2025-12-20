import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    this.textEditingController,
    this.textInputType,
    this.validator,
    this.isObscureText = false,
    this.onSaved,
  });
  final String hint;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  final bool? isObscureText;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool? currentStat;
  @override
  void initState() {
    currentStat = widget.isObscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      obscureText: currentStat!,
      textDirection: TextDirection.ltr,
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: widget.isObscureText == true
            ? IconButton(
                icon: currentStat!
                    ? Icon(Icons.visibility_off, color: const Color(0xffC9cecf))
                    : Icon(Icons.visibility, color: const Color(0xffC9cecf)),
                onPressed: () {
                  setState(() {
                    currentStat = !currentStat!;
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        hintText: widget.hint,
        hintStyle: TextStyles.bold14.copyWith(
          color: const Color(0xff949D9E),
          fontSize: 15,
        ),
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: const Color(0xffE6E9EA)),
    );
  }
}
