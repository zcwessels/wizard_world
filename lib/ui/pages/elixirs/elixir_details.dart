import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';

class ElixirDetails extends StatelessWidget {
  const ElixirDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        WWElixir? elixir = state.main.selectedElixir;
        if (elixir == null) {
          return Center(child: Text("Something Went Wrong Please Try Again", style: theme.bodyMedium));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                elixir.name,
                style: theme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Effect:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.effect,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    Text("Side Effects:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.sideEffects,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    Text("Characteristics:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.characteristics,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    Text("Manufacturer:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.manufacturer,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    Text("Created on:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.time,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    Text("Difficulty:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(
                      elixir.difficulty.name,
                      style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    Text("Ingredients:", style: theme.titleMedium, textAlign: TextAlign.center),
                    if (elixir.ingredients.isEmpty) Text("Unknown", style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: elixir.ingredients.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        WWIngredient ingredient = elixir.ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.grass),
                              const SizedBox(width: 4),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.73,
                                child: Text(
                                  ingredient.name,
                                  style: theme.titleSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text("Inventors:", style: theme.titleMedium, textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    if (elixir.inventors.isEmpty) Text("Unknown", style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: elixir.inventors.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        WWElixirInventor inventor = elixir.inventors[index];
                        return Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 8),
                            Offstage(
                              offstage: inventor.firstName.isEmpty,
                              child: Text(
                                inventor.firstName,
                                style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                            if (inventor.firstName.isNotEmpty && inventor.lastName.isNotEmpty) const SizedBox(width: 8),
                            Offstage(
                              offstage: inventor.lastName.isEmpty,
                              child: Text(
                                inventor.lastName,
                                style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
