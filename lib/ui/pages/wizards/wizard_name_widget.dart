import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';

class WizardName extends StatelessWidget {
  final WWWizard wizard;
  final bool disableOnTap;
  const WizardName({super.key, required this.wizard, this.disableOnTap = false});

  Offstage _buildText(TextTheme theme, String text, bool offstage) {
    return Offstage(offstage: offstage, child: Text(text, style: disableOnTap ? theme.titleLarge : theme.bodyMedium));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: disableOnTap ? null : () => sl.wizardWorld.selectWizard(wizard),
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: disableOnTap ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 8),
            _buildText(theme, wizard.firstName, wizard.firstName.isEmpty),
            if (wizard.firstName.isNotEmpty && wizard.lastName.isNotEmpty) const SizedBox(width: 8),
            _buildText(theme, wizard.lastName, wizard.lastName.isEmpty),
          ],
        ),
      ),
    );
  }
}
