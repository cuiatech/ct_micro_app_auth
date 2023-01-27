import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: child,
    );
  }
}
