import 'package:flutter/material.dart';

SnackBar snackBar(String message){
  return SnackBar(
    content: Text(message),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  );
}