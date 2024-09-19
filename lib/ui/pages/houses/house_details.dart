import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        WWHouse? house = state.main.selectedHouse;
        if (house == null) return Center(child: Text("Something Went Wrong Please Try Again", style: theme.bodyMedium));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(house.name, style: theme.titleLarge, textAlign: TextAlign.center)),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("House Colours:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.houseColours, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Founder:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.founder, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Animal:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.animal, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Element:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.element, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Ghost:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.ghost, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 8),
                    Text("Common Room:", style: theme.titleMedium, textAlign: TextAlign.center),
                    Text(house.commonRoom, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 16),
                    Text("Heads:", style: theme.titleMedium, textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    if (house.heads.isEmpty) Text("Unknown", style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: house.heads.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        WWHouseHead head = house.heads[index];
                        return Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 8),
                            Offstage(
                              offstage: head.firstName.isEmpty,
                              child: Text(head.firstName, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                            ),
                            if (head.firstName.isNotEmpty && head.lastName.isNotEmpty) const SizedBox(width: 8),
                            Offstage(
                              offstage: head.lastName.isEmpty,
                              child: Text(head.lastName, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text("Traits:", style: theme.titleMedium, textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    if (house.traits.isEmpty) Text("Unknown", style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: house.traits.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        WWTrait trait = house.traits[index];
                        return Row(
                          children: [
                            const Icon(Icons.manage_search),
                            const SizedBox(width: 8),
                            Offstage(
                              offstage: trait.name.isEmpty,
                              child: Text(trait.name, style: theme.bodySmall?.copyWith(fontWeight: FontWeight.normal)),
                            ),
                          ],
                        );
                      },
                    ),
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
