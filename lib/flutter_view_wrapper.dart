import 'package:flutter/material.dart';

class FlutterViewWrapper extends StatelessWidget {
  ///
  /// Wrap pages in a safe area, layout builder and single child scroll view.
  ///
  /// Using a constrained box with the parents height and infinity width.
  ///
  const FlutterViewWrapper({
    Key? key,
    this.padding,
    this.physics = const RangeMaintainingScrollPhysics(),
    this.onRefresh,
    this.onWillPop,
    required this.child,
  }) : super(key: key);

  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Future<void> Function()? onRefresh;
  final Future<bool> Function()? onWillPop;
  final Widget child;

  static Future<void> _defaultOnRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return RefreshIndicator(
              onRefresh: onRefresh ?? _defaultOnRefresh,
              notificationPredicate:
                  onRefresh != null ? (_) => true : (_) => false,
              child: SingleChildScrollView(
                physics: physics,
                child: ConstrainedBox(
                  constraints: constraints.copyWith(
                    minHeight: constraints.maxHeight,
                    maxHeight: double.infinity,
                  ),
                  child: Container(
                    padding: padding,
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      onWillPop: () async {
        if (onWillPop != null) {
          return onWillPop!();
        }
        Scaffold.of(context).closeDrawer();
        ScaffoldMessenger.of(context).clearMaterialBanners();
        ScaffoldMessenger.of(context).clearSnackBars();
        return true;
      },
    );
  }
}
