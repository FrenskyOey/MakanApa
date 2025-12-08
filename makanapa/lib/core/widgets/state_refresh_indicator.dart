import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makanapa/core/extension/src/color_extension.dart';

class StateRefreshIndicator extends ConsumerStatefulWidget {
  final Widget child;
  final bool isLoading;
  final VoidCallback onRefresh;

  const StateRefreshIndicator({
    super.key,
    required this.child,
    required this.isLoading,
    required this.onRefresh,
  });

  @override
  ConsumerState<StateRefreshIndicator> createState() =>
      _BooleanRefreshIndicatorState();
}

class _BooleanRefreshIndicatorState
    extends ConsumerState<StateRefreshIndicator> {
  Completer<void>? _refreshCompleter;

  @override
  void didUpdateWidget(covariant StateRefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading && !widget.isLoading) {
      if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
        _refreshCompleter!.complete();
        _refreshCompleter = null;
      }
    }
  }

  Future<void> _handleRefresh() async {
    widget.onRefresh();
    Future.delayed(const Duration(milliseconds: 100));
    if (_refreshCompleter == null || _refreshCompleter!.isCompleted) {
      _refreshCompleter = Completer<void>();
    }
    return _refreshCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      backgroundColor: context.primary,
      color: Colors.white,
      child: widget.child,
    );
  }
}
