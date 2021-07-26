import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_test/src/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: RiverpodJokesApp(),
    ),
  );
}
