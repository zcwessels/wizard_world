import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/constants.dart';

class WWButton extends StatefulWidget {
  final String title;
  final bool isLoading;
  final Function()? onTap;
  const WWButton({super.key, required this.title, this.onTap, this.isLoading = false});

  @override
  State<WWButton> createState() => _WWButtonState();
}

class _WWButtonState extends State<WWButton> {
  bool _doneLoading = false;

  @override
  void initState() {
    super.initState();
    _doneLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: (!widget.isLoading) ? widget.onTap ?? () {} : null,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: AnimatedContainer(
          width: widget.isLoading ? 24 : 100,
          height: 24,
          onEnd: () => setState(() => _doneLoading = true),
          duration: const Duration(milliseconds: 400),
          child: Builder(
            builder: (context) {
              if (widget.isLoading) return const SizedBox(width: 10, height: 10, child: CircularProgressIndicator(color: Colors.white));
              if (_doneLoading) {
                return Center(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
