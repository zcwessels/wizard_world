import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/ui/ui_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InstanceInjection.init();
  runApp(const UIMain());
}
