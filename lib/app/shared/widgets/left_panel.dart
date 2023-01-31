// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          child,
          const FooterWidget(),
        ],
      ),
    );
  }
}
