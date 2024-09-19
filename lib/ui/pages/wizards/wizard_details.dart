import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/pages/wizards/wizard_name_widget.dart';

class WizardDetails extends StatelessWidget {
  const WizardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        WWWizard? wizard = state.main.selectedWizard;
        if (wizard == null) return Center(child: Text("Something Went Wrong Please Try Again", style: theme.bodyMedium));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WizardName(wizard: wizard, disableOnTap: true),
            const SizedBox(height: 16),
            Text("Crafted Elixirs".toUpperCase(), style: theme.bodySmall),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: wizard.elixirs.length,
              separatorBuilder: (context, state) => const SizedBox(height: 8),
              itemBuilder: (BuildContext context, int index) {
                WWWizardElixir elixir = wizard.elixirs[index];
                return InkWell(
                  onTap: () => sl.wizardWorld.selectElixir(elixir.id),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.science_outlined),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: Text(elixir.name, style: theme.titleSmall, overflow: TextOverflow.ellipsis),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
