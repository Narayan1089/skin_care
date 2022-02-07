// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onClick;

  const AppButton({
    Key? key,
    required this.btnText,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width - 260,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade400,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          btnText,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ListContent extends StatelessWidget {
  final String? text;
  final VoidCallback? onClick;
  final String? imagePath;

  const ListContent({this.text, this.onClick, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onClick,
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          imagePath!,
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
        title: Text(
          text!,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
