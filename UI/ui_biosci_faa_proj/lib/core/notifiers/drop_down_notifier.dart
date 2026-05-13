import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/core/shared_models/drop_downs_memory.dart';
import 'package:ui_biosci_faa_proj/features/home/data/home_page_provider.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pbgrpc.dart';

final dropdownMemoryProvider = NotifierProvider<DropDownNotifier, DropDownsMemory>(() {
  return DropDownNotifier();
});

class DropDownNotifier extends Notifier<DropDownsMemory>{
  bool _hasFetched = false;

  @override
  DropDownsMemory build(){
    return DropDownsMemory();
  }

  Future<void> fetchOnce() async{
    if(_hasFetched)
      return;

    try{
      final testService = ref.read(testServiceProvider);
      final response = await testService.getAllDropDowns(DropDownRequest());

      print(response.dropDowns['BlankType']);

      state = DropDownsMemory(
        blankTypes: response.dropDowns['BlankType']?.items as List<DropDownListItem> ?? [],
        methods: response.dropDowns['Method']?.items as List<DropDownListItem> ?? [],
        filters: response.dropDowns['Filter']?.items as List<DropDownListItem> ?? [],
        units: response.dropDowns['Unit']?.items as List<DropDownListItem> ?? [],
        directions: response.dropDowns['ReactionDirection']?.items as List<DropDownListItem> ?? [],
        stirrerSpeeds: response.dropDowns['StirrerSpeed']?.items as List<DropDownListItem> ?? [],
      );
      _hasFetched = true;
    }catch(e){
      print('Failed to load dropdowns into memory: $e');
    }
  }
}