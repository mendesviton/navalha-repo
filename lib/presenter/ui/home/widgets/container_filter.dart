// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers.dart';

class ContainerFilterIcon extends HookConsumerWidget {
  const ContainerFilterIcon({
    Key? key,
    required this.filterName,
    required this.cima,
  }) : super(key: key);
  final String filterName;
  final bool cima;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Container(
      decoration: BoxDecoration(
        color: darkMode.darkMode
            ? const Color.fromARGB(255, 34, 34, 34)
            : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
        border: darkMode.darkMode ? null : Border.all(color: Colors.black),
      ),
      height: 35,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 7,
            ),
            Text(
              filterName,
              style: TextStyle(
                color: darkMode.darkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              !cima ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
              color: darkMode.darkMode ? Colors.white : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
