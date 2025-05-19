import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/widgets/svg_widget.dart';

class NavIconButton extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const NavIconButton({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 48, // Adjust as needed
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgWidget(
              imagePath: imagePath,
              // Optional: change color if needed
              // color: isSelected ? Colors.blue : Colors.grey,
              color: ColorManager.white,
            ),
            const SizedBox(height: 4),
            // Dot indicator below the icon when selected
            Visibility(
              visible: isSelected,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
