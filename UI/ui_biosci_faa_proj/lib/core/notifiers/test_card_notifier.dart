import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/features/home/data/home_page_provider.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';

final allTestProvider = NotifierProvider<TestCardListNotifier, List<TestCardData>>((){
  return TestCardListNotifier();
});

final visibleTestProvider = Provider<List<TestCardData>>((ref) {
  final allTests = ref.watch(allTestProvider);

  return allTests.where((test) => test.isVisible && !test.isSpecialSolution).toList();
});

final withSpecialSolutionTestProvider = Provider<List<TestCardData>>((ref) {
  final allTests = ref.watch(allTestProvider);

  return allTests.where((test) => test.isVisible).toList();
});

final onlySpecialSolutionTestProvider = Provider<List<TestCardData>>((ref) {
  final allTests = ref.watch(allTestProvider);

  return allTests.where((test) => test.isSpecialSolution).toList();
});
class TestCardListNotifier extends Notifier<List<TestCardData>>{

  bool _hasFetched = false;

  @override
  List<TestCardData> build() => [];

  Future<void> fetchOnce() async{
    if(_hasFetched)
      return;
    try{
      final testService = ref.read(testServiceProvider);
      final alltests = await testService.getTestList(TestListRequest()..includeVisibleOnly = true..includeSpecialSolutions=true);

      state = alltests.tests;
      print(alltests.tests);
    }catch(e){
      print('Fetching Tests had errors: $e');
    }
  }

  void addTestLocally(TestCardData newTest){
    state = [...state, newTest];
  }
}