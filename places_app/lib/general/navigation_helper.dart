import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Function(BuildContext) navigationMethod) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigationMethod(context)));

void navigatePop(BuildContext context) => Navigator.of(context).pop();
