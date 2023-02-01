import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormInput extends StatelessWidget {
  final String hintText;
  final TextEditingController inputController;
  final bool? isText;
  final String? Function(String?)? validator;
  const FormInput({
    super.key,
    required this.hintText,
    required this.inputController,
    this.isText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        width: size.width,
        child: TextFormField(
          validator: (length) {
            if (length == null || length.isEmpty) {
              return 'Preencha este campo!';
            }
            return null;
          },
          keyboardType:
              isText == true ? TextInputType.text : TextInputType.number,
          controller: inputController,
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red)),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: BorderSide(color: Colors.red)),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
              )),
        ),
      ),
    );
  }
}
