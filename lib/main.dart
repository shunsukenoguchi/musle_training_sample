import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_training/ui/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
