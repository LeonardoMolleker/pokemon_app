import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';

class CustomExpansionPanel extends StatelessWidget {
  final List<String> data;
  final String title;
  final double childAspectRatio;
  final int crossAxisCount;

  const CustomExpansionPanel({
    Key? key,
    required this.data,
    required this.title,
    this.childAspectRatio = UiConstant.childAspectRatio,
    this.crossAxisCount = UiConstant.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
      ),
      children: [
        GridView.count(
          childAspectRatio: childAspectRatio,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          children: List.generate(
            data.length,
            (index) {
              return Text(
                data[index],
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ],
    );
  }
}
