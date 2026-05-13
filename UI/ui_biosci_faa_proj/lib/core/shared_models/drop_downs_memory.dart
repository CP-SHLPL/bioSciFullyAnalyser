import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';

class DropDownsMemory {
  final List<DropDownListItem> blankTypes;
  final List<DropDownListItem> methods;
  final List<DropDownListItem> filters;
  final List<DropDownListItem> units;
  final List<DropDownListItem> directions;
  final List<DropDownListItem> stirrerSpeeds;

  DropDownsMemory({
    this.blankTypes = const [],
    this.methods = const [],
    this.filters = const [],
    this.units = const [],
    this.directions = const [],
    this.stirrerSpeeds = const [],
  });
}