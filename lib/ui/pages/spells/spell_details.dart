import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/helpers.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';

class SpellDetails extends StatelessWidget {
  const SpellDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        WWSpell? spell = state.main.selectedSpell;
        if (spell == null) return Center(child: Text("Something Went Wrong Please Try Again", style: theme.bodyMedium));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(spell.name, style: theme.titleLarge, textAlign: TextAlign.center)),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Incantation:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(spell.incantation, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Effect:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(spell.effect, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Type:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(spell.type.name.capitalizeFirst(), style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Light:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(spell.light.name.capitalizeFirst(), style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Creator:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(spell.creator, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Can Be Verbal:", style: theme.titleMedium, textAlign: TextAlign.center),
                    if (spell.canBeVerbal != null) Icon(spell.canBeVerbal! ? Icons.check : Icons.close, color: spell.canBeVerbal! ? Colors.green : Colors.red),
                    if (spell.canBeVerbal == null) Text("Unknown", style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
