import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/pages/screen.dart';
import 'package:wizard_world/ui/pages/wizards/wizard_name_widget.dart';
import 'package:wizard_world/ui/widgets/ww_search_field.dart';

class WizardsMain extends StatelessWidget {
  const WizardsMain({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        return Screen(
          title: "Wizards",
          child: (context, state) => Column(
            children: [
              const WWSearchField(),
              const SizedBox(height: 16),
              if (state.main.wizards?.isEmpty ?? true) Text("No Wizards Found", style: theme.bodyMedium),
              if (state.main.filteredWizards?.isEmpty ?? false) Text("No Matching Wizards Found", style: theme.bodyMedium),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.main.filteredWizards?.length ?? state.main.wizards?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) => WizardName(wizard: state.main.wizards![index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
