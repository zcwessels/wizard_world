import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/features/core/helpers.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/widgets/ww_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WWAppBar(title: 'The Encyclopedia of Unexplainable Things'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileWidget(tile: WWTiles.wizards),
                  TileWidget(tile: WWTiles.elixirs),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileWidget(tile: WWTiles.houses),
                  TileWidget(tile: WWTiles.spells),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final WWTiles tile;
  const TileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => sl.wizardWorld.selectTile(tile),
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FrameWidget(asset: tile.asset),
          Text(tile.name.capitalizeFirst(), style: theme.bodyMedium),
        ],
      ),
    );
  }
}

class FrameWidget extends StatelessWidget {
  final String asset;
  final double size;

  const FrameWidget({super.key, required this.asset, this.size = 160});

  @override
  Widget build(BuildContext context) {
    double smallSize = size * 0.7;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(asset, width: smallSize, height: smallSize),
          Image.asset('assets/images/frame.png', width: size, height: size),
        ],
      ),
    );
  }
}
