import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/test_card_notifier.dart';
import 'package:ui_biosci_faa_proj/features/test_list/views/test_list_detail.dart';

class TestListMaster extends ConsumerWidget {
  const TestListMaster({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TestListDetailWidget(
      rowSize: 2,
      isMasterList: true,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}