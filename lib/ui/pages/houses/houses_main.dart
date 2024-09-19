import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/pages/screen.dart';
import 'package:wizard_world/ui/widgets/ww_search_field.dart';

class HousesMain extends StatelessWidget {
  const HousesMain({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        return Screen(
            title: "Houses",
            child: (context, state) {
              return Column(
                children: [
                  const WWSearchField(),
                  const SizedBox(height: 16),
                  if (state.main.houses?.isEmpty ?? true) Text("No Houses Found", style: theme.bodyMedium),
                  if (state.main.filteredHouses?.isEmpty ?? false) Text("No Matching Houses Found", style: theme.bodyMedium),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.main.filteredHouses?.length ?? state.main.houses?.length ?? 0,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                      itemBuilder: (BuildContext context, int index) {
                        WWHouse house = state.main.houses![index];
                        return InkWell(
                          onTap: () => sl.wizardWorld.selectHouse(house),
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.house),
                                const SizedBox(width: 8),
                                Text(house.name, style: theme.bodyMedium),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
