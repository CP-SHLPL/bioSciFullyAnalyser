import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/test_card_notifier.dart';
import 'package:ui_biosci_faa_proj/features/test/views/edit_test.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';

class TestListDetailWidget extends ConsumerWidget {
  final bool isVisible;
  final bool withSpecialSolutions;
  final bool onlySpecialSolutions;
  final bool allTests;
  final int rowSize;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double aspectRatio;
  final void Function(int)? onTap;
  final List<int>? selectedTestIDs;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool isMasterList;


  const TestListDetailWidget({
    super.key,
    required this.rowSize,
    this.crossAxisSpacing = 20,
    this.mainAxisSpacing = 10,
    this.aspectRatio = 3,
    this.isVisible = false,
    this.withSpecialSolutions = false,
    this.onlySpecialSolutions = false,
    this.allTests = false,
    this.onTap,
    this.selectedTestIDs = const [],
    this.shrinkWrap = false,
    this.physics,
    this.isMasterList = false
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TestCardData> testCardData = [];
    if(isMasterList){
      testCardData.addAll(ref.watch(visibleTestProvider).where((test) => test.testID < 5));
    }
    else if (isVisible) {
      testCardData.addAll(ref.watch(visibleTestProvider));
    } else if (withSpecialSolutions) {
      testCardData.addAll(ref.watch(withSpecialSolutionTestProvider));
    } else if (onlySpecialSolutions) {
      testCardData.addAll(ref.watch(onlySpecialSolutionTestProvider));
    } else {
      testCardData.addAll(ref.watch(allTestProvider));
    }

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GridView.builder(
        shrinkWrap: shrinkWrap,
        physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowSize,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: aspectRatio,
        ),
        itemCount: testCardData.length,
        itemBuilder: (context, index) {
          return generateCard(testCardData[index], context);
        },
      ),
    );
  }

  Widget generateCard(TestCardData data, BuildContext context) {
    final bool isSelected = selectedTestIDs!.contains(data.testID);
    return ElevatedButton(
      style: isSelected
          ? ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            )
          : null,
      onPressed: () {
        if (onTap != null) {
          onTap!(data.testID);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    24,
                  ), // Adjust radius as needed
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final screenWidth = MediaQuery.of(context).size.width;
                    final dialogWidth =
                        screenWidth * 0.8; // 80% of screen width
                    final maxWidth = 1300.0;
                    return SizedBox(
                      width: dialogWidth > maxWidth ? maxWidth : dialogWidth,
                      child: EditParameter(data.testID),
                    );
                  },
                ),
              );
            },
          );
        }
      },
      child: Text(data.testCode),
    );
  }
}
