import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/homescreen_controller.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final int index;

  const FilterButton({
    required this.label,
    this.isSelected = false,
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<HomescreenController>();
    final proRead = context.read<HomescreenController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          proRead.onFilterTap(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: proWatch.filterCurrentIndex == index
                ? ColorConstants.primaryColor
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            label,
            style: TextStyle(
                color: proWatch.filterCurrentIndex == index
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
