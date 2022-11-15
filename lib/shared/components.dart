// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';


Widget defaultItemBuilder({
  required Widget child,
  required String description,
  required String title,
}) =>
    Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(title),
        ),
        Text(
          description,
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.indigo),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 150,
          width: 300,
          child: child,
        ),
        Divider(
          thickness: 1,
          color: Colors.indigo,
        ),
      ],
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onTab,
  required Function onChanged,
  Function? validate,
  bool isPassword = false,
  required String label,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      validator: (value) {
        return validate!(value);
      },
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit();
      },
      onChanged: (s) => onChanged,
      onTap: () => onTab(),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultTextButton({
  double width = double.infinity,
  Color backgroundColor = Colors.indigo,
  Color textColor = Colors.white,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      color: backgroundColor,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );

Widget defaultIconButton({
  double height = 50,
  double width = double.infinity,
  Color backgroundColor = Colors.indigo,
  Color iconColor = Colors.white,
  required VoidCallback function,
  required IconData icon,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
          onPressed: function,
          child: Icon(
            icon,
            color: iconColor,
          )),
    );
