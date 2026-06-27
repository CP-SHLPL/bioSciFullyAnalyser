import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewNotifier extends Notifier<Widget?> {
  @override
  Widget? build() => null;

  void setDetailView(Widget? view) {
    state = view;
  }
}

final detailViewProvider = NotifierProvider<DetailViewNotifier, Widget?>(() {
  return DetailViewNotifier();
});
