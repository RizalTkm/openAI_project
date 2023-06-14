import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bottomSheetButton extends StatelessWidget {
  const bottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) {
                final list = ["menu1", "menu2", "menu3", "menu4", " menu 5"];
                final resultList = list
                    .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          child: Text(e.toString()),
                          value: e,
                        ))
                    .toList();

                return Expanded(
                  child: DropdownButton<String>(
                      items: resultList,
                      value: 'menu1',
                      hint: const Text('please select'),
                      onChanged: (val) {}),
                );
              });
        },
        icon: const Icon(Icons.menu_rounded));
  }
}
