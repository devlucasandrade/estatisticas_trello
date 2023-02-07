import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final GlobalKey<RefreshIndicatorState>? keyRefresh;
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget({
    Key? key,
    this.keyRefresh,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widget.keyRefresh,
      onRefresh: widget.onRefresh,
      child: widget.child,
    );
  }
}
