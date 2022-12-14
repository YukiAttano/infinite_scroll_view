import 'package:flutter/material.dart';

class InfiniteScrollView extends CustomScrollView {
  final Widget Function(BuildContext context, int index) negativeBuilder;
  final Widget Function(BuildContext context, int index) positiveBuilder;

  final int? negativeMax;
  final int? positiveMax;

  static const Key _negativeKey = Key("Negative");
  static const Key _positiveKey = Key("Positive");

  InfiniteScrollView({
    Key? key,
    required this.negativeBuilder,
    required this.positiveBuilder,
    this.negativeMax,
    this.positiveMax,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.scrollBehavior,
    super.shrinkWrap,
    super.anchor,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
  }) : super(
    key: key,
    center: _positiveKey,
    slivers: [
      SliverList(
        key: _negativeKey,
        delegate: SliverChildBuilderDelegate(
          childCount: negativeMax,
              (context, index) => negativeBuilder(context, -(index + 1)),
        ),
      ),
      SliverList(
        key: _positiveKey,
        delegate: SliverChildBuilderDelegate(
          childCount: positiveMax,
          positiveBuilder,
        ),
      ),
    ],
  );
}
