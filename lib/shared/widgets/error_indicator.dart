import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(
    this.Message, {
    super.key,
  });
  // ignore: non_constant_identifier_names
  final String Message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Message),
    );
  }
}
