import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Function(BuildContext context) navigationMethod) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigationMethod(context)));

void navigatePop(BuildContext context, {Object? data}) => Navigator.of(context).pop(data);
