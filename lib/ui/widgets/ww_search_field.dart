import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/instance_injection.dart';

class WWSearchField extends StatelessWidget {
  const WWSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) => sl.wizardWorld.search(value),
      decoration: const InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
