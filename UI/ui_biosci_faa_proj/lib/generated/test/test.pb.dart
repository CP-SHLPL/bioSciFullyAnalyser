// This is a generated file - do not edit.
//
// Generated from test.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DropDownRequest extends $pb.GeneratedMessage {
  factory DropDownRequest() => create();

  DropDownRequest._();

  factory DropDownRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropDownRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropDownRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownRequest copyWith(void Function(DropDownRequest) updates) =>
      super.copyWith((message) => updates(message as DropDownRequest))
          as DropDownRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropDownRequest create() => DropDownRequest._();
  @$core.override
  DropDownRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropDownRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropDownRequest>(create);
  static DropDownRequest? _defaultInstance;
}

class DropDownListResponse extends $pb.GeneratedMessage {
  factory DropDownListResponse({
    $core.Iterable<$core.MapEntry<$core.String, DropDownValues>>? dropDowns,
  }) {
    final result = create();
    if (dropDowns != null) result.dropDowns.addEntries(dropDowns);
    return result;
  }

  DropDownListResponse._();

  factory DropDownListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropDownListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropDownListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..m<$core.String, DropDownValues>(1, _omitFieldNames ? '' : 'dropDowns',
        protoName: 'dropDowns',
        entryClassName: 'DropDownListResponse.DropDownsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: DropDownValues.create,
        valueDefaultOrMaker: DropDownValues.getDefault,
        packageName: const $pb.PackageName('test'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownListResponse copyWith(void Function(DropDownListResponse) updates) =>
      super.copyWith((message) => updates(message as DropDownListResponse))
          as DropDownListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropDownListResponse create() => DropDownListResponse._();
  @$core.override
  DropDownListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropDownListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropDownListResponse>(create);
  static DropDownListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, DropDownValues> get dropDowns => $_getMap(0);
}

class DropDownValues extends $pb.GeneratedMessage {
  factory DropDownValues({
    $core.Iterable<DropDownListItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  DropDownValues._();

  factory DropDownValues.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropDownValues.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropDownValues',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..pPM<DropDownListItem>(1, _omitFieldNames ? '' : 'Items',
        protoName: 'Items', subBuilder: DropDownListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownValues clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownValues copyWith(void Function(DropDownValues) updates) =>
      super.copyWith((message) => updates(message as DropDownValues))
          as DropDownValues;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropDownValues create() => DropDownValues._();
  @$core.override
  DropDownValues createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropDownValues getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropDownValues>(create);
  static DropDownValues? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DropDownListItem> get items => $_getList(0);
}

class DropDownListItem extends $pb.GeneratedMessage {
  factory DropDownListItem({
    $core.int? value,
    $core.String? text,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (text != null) result.text = text;
    return result;
  }

  DropDownListItem._();

  factory DropDownListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropDownListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropDownListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'value')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropDownListItem copyWith(void Function(DropDownListItem) updates) =>
      super.copyWith((message) => updates(message as DropDownListItem))
          as DropDownListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropDownListItem create() => DropDownListItem._();
  @$core.override
  DropDownListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropDownListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropDownListItem>(create);
  static DropDownListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);
}

class TestRequest extends $pb.GeneratedMessage {
  factory TestRequest({
    $core.int? testID,
  }) {
    final result = create();
    if (testID != null) result.testID = testID;
    return result;
  }

  TestRequest._();

  factory TestRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'TestID', protoName: 'TestID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestRequest copyWith(void Function(TestRequest) updates) =>
      super.copyWith((message) => updates(message as TestRequest))
          as TestRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestRequest create() => TestRequest._();
  @$core.override
  TestRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestRequest>(create);
  static TestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get testID => $_getIZ(0);
  @$pb.TagNumber(1)
  set testID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTestID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestID() => $_clearField(1);
}

class TestResponse extends $pb.GeneratedMessage {
  factory TestResponse({
    $core.bool? requestSuccess,
    TestData? test,
  }) {
    final result = create();
    if (requestSuccess != null) result.requestSuccess = requestSuccess;
    if (test != null) result.test = test;
    return result;
  }

  TestResponse._();

  factory TestResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'requestSuccess',
        protoName: 'requestSuccess')
    ..aOM<TestData>(2, _omitFieldNames ? '' : 'test',
        subBuilder: TestData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestResponse copyWith(void Function(TestResponse) updates) =>
      super.copyWith((message) => updates(message as TestResponse))
          as TestResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestResponse create() => TestResponse._();
  @$core.override
  TestResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestResponse>(create);
  static TestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get requestSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set requestSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  TestData get test => $_getN(1);
  @$pb.TagNumber(2)
  set test(TestData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearTest() => $_clearField(2);
  @$pb.TagNumber(2)
  TestData ensureTest() => $_ensure(1);
}

class TestData extends $pb.GeneratedMessage {
  factory TestData({
    $core.int? testID,
    $core.String? testName,
    $core.int? testMethod,
    $core.int? testUnit,
    $core.int? reagents,
    $core.int? decimals,
    $core.int? blankType,
    $core.String? createdBy,
    $core.String? createdAt,
    $core.String? modifiedBy,
    $core.String? modifiedAt,
    $core.int? primaryFilter,
    $core.int? secondaryFilter,
    $core.int? incubationTime,
    $core.int? readingTime,
    $core.double? corelationA,
    $core.double? corelationB,
    $core.int? r1Volume,
    $core.int? r2Volume,
    $core.double? sampleVolume,
    $core.int? autoDilutionRatio,
    $core.int? stirrerSpeedSample,
    $core.int? stirrerSpeedR2,
    $core.double? lastReagentBlank,
    $core.double? reagentBlankHigh,
    $core.double? reagentBlankLow,
    $core.String? testCode,
    $core.double? linearity,
    $core.double? substrateDepletion,
    $core.int? direction,
  }) {
    final result = create();
    if (testID != null) result.testID = testID;
    if (testName != null) result.testName = testName;
    if (testMethod != null) result.testMethod = testMethod;
    if (testUnit != null) result.testUnit = testUnit;
    if (reagents != null) result.reagents = reagents;
    if (decimals != null) result.decimals = decimals;
    if (blankType != null) result.blankType = blankType;
    if (createdBy != null) result.createdBy = createdBy;
    if (createdAt != null) result.createdAt = createdAt;
    if (modifiedBy != null) result.modifiedBy = modifiedBy;
    if (modifiedAt != null) result.modifiedAt = modifiedAt;
    if (primaryFilter != null) result.primaryFilter = primaryFilter;
    if (secondaryFilter != null) result.secondaryFilter = secondaryFilter;
    if (incubationTime != null) result.incubationTime = incubationTime;
    if (readingTime != null) result.readingTime = readingTime;
    if (corelationA != null) result.corelationA = corelationA;
    if (corelationB != null) result.corelationB = corelationB;
    if (r1Volume != null) result.r1Volume = r1Volume;
    if (r2Volume != null) result.r2Volume = r2Volume;
    if (sampleVolume != null) result.sampleVolume = sampleVolume;
    if (autoDilutionRatio != null) result.autoDilutionRatio = autoDilutionRatio;
    if (stirrerSpeedSample != null)
      result.stirrerSpeedSample = stirrerSpeedSample;
    if (stirrerSpeedR2 != null) result.stirrerSpeedR2 = stirrerSpeedR2;
    if (lastReagentBlank != null) result.lastReagentBlank = lastReagentBlank;
    if (reagentBlankHigh != null) result.reagentBlankHigh = reagentBlankHigh;
    if (reagentBlankLow != null) result.reagentBlankLow = reagentBlankLow;
    if (testCode != null) result.testCode = testCode;
    if (linearity != null) result.linearity = linearity;
    if (substrateDepletion != null)
      result.substrateDepletion = substrateDepletion;
    if (direction != null) result.direction = direction;
    return result;
  }

  TestData._();

  factory TestData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(2, _omitFieldNames ? '' : 'testID', protoName: 'testID')
    ..aOS(3, _omitFieldNames ? '' : 'testName', protoName: 'testName')
    ..aI(4, _omitFieldNames ? '' : 'testMethod', protoName: 'testMethod')
    ..aI(5, _omitFieldNames ? '' : 'testUnit', protoName: 'testUnit')
    ..aI(6, _omitFieldNames ? '' : 'reagents')
    ..aI(7, _omitFieldNames ? '' : 'decimals')
    ..aI(8, _omitFieldNames ? '' : 'blankType', protoName: 'blankType')
    ..aOS(9, _omitFieldNames ? '' : 'CreatedBy', protoName: 'CreatedBy')
    ..aOS(10, _omitFieldNames ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(11, _omitFieldNames ? '' : 'ModifiedBy', protoName: 'ModifiedBy')
    ..aOS(12, _omitFieldNames ? '' : 'ModifiedAt', protoName: 'ModifiedAt')
    ..aI(13, _omitFieldNames ? '' : 'primaryFilter', protoName: 'primaryFilter')
    ..aI(14, _omitFieldNames ? '' : 'secondaryFilter',
        protoName: 'secondaryFilter')
    ..aI(15, _omitFieldNames ? '' : 'incubationTime',
        protoName: 'incubationTime')
    ..aI(16, _omitFieldNames ? '' : 'readingTime', protoName: 'readingTime')
    ..aD(17, _omitFieldNames ? '' : 'corelationA', protoName: 'corelationA')
    ..aD(18, _omitFieldNames ? '' : 'corelationB', protoName: 'corelationB')
    ..aI(19, _omitFieldNames ? '' : 'r1Volume', protoName: 'r1Volume')
    ..aI(20, _omitFieldNames ? '' : 'r2Volume', protoName: 'r2Volume')
    ..aD(21, _omitFieldNames ? '' : 'sampleVolume', protoName: 'sampleVolume')
    ..aI(22, _omitFieldNames ? '' : 'autoDilutionRatio',
        protoName: 'autoDilutionRatio')
    ..aI(23, _omitFieldNames ? '' : 'stirrerSpeedSample',
        protoName: 'stirrerSpeedSample')
    ..aI(24, _omitFieldNames ? '' : 'stirrerSpeedR2',
        protoName: 'stirrerSpeedR2')
    ..aD(25, _omitFieldNames ? '' : 'lastReagentBlank',
        protoName: 'lastReagentBlank')
    ..aD(26, _omitFieldNames ? '' : 'reagentBlankHigh',
        protoName: 'reagentBlankHigh')
    ..aD(27, _omitFieldNames ? '' : 'reagentBlankLow',
        protoName: 'reagentBlankLow')
    ..aOS(28, _omitFieldNames ? '' : 'testCode', protoName: 'testCode')
    ..aD(29, _omitFieldNames ? '' : 'linearity')
    ..aD(30, _omitFieldNames ? '' : 'substrateDepletion',
        protoName: 'substrateDepletion')
    ..aI(31, _omitFieldNames ? '' : 'direction')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestData copyWith(void Function(TestData) updates) =>
      super.copyWith((message) => updates(message as TestData)) as TestData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestData create() => TestData._();
  @$core.override
  TestData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestData>(create);
  static TestData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get testID => $_getIZ(0);
  @$pb.TagNumber(2)
  set testID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(2)
  $core.bool hasTestID() => $_has(0);
  @$pb.TagNumber(2)
  void clearTestID() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get testName => $_getSZ(1);
  @$pb.TagNumber(3)
  set testName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasTestName() => $_has(1);
  @$pb.TagNumber(3)
  void clearTestName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get testMethod => $_getIZ(2);
  @$pb.TagNumber(4)
  set testMethod($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(4)
  $core.bool hasTestMethod() => $_has(2);
  @$pb.TagNumber(4)
  void clearTestMethod() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get testUnit => $_getIZ(3);
  @$pb.TagNumber(5)
  set testUnit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(5)
  $core.bool hasTestUnit() => $_has(3);
  @$pb.TagNumber(5)
  void clearTestUnit() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get reagents => $_getIZ(4);
  @$pb.TagNumber(6)
  set reagents($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(6)
  $core.bool hasReagents() => $_has(4);
  @$pb.TagNumber(6)
  void clearReagents() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get decimals => $_getIZ(5);
  @$pb.TagNumber(7)
  set decimals($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(7)
  $core.bool hasDecimals() => $_has(5);
  @$pb.TagNumber(7)
  void clearDecimals() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get blankType => $_getIZ(6);
  @$pb.TagNumber(8)
  set blankType($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(8)
  $core.bool hasBlankType() => $_has(6);
  @$pb.TagNumber(8)
  void clearBlankType() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdBy => $_getSZ(7);
  @$pb.TagNumber(9)
  set createdBy($core.String value) => $_setString(7, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedBy() => $_has(7);
  @$pb.TagNumber(9)
  void clearCreatedBy() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get createdAt => $_getSZ(8);
  @$pb.TagNumber(10)
  set createdAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get modifiedBy => $_getSZ(9);
  @$pb.TagNumber(11)
  set modifiedBy($core.String value) => $_setString(9, value);
  @$pb.TagNumber(11)
  $core.bool hasModifiedBy() => $_has(9);
  @$pb.TagNumber(11)
  void clearModifiedBy() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get modifiedAt => $_getSZ(10);
  @$pb.TagNumber(12)
  set modifiedAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(12)
  $core.bool hasModifiedAt() => $_has(10);
  @$pb.TagNumber(12)
  void clearModifiedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get primaryFilter => $_getIZ(11);
  @$pb.TagNumber(13)
  set primaryFilter($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(13)
  $core.bool hasPrimaryFilter() => $_has(11);
  @$pb.TagNumber(13)
  void clearPrimaryFilter() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get secondaryFilter => $_getIZ(12);
  @$pb.TagNumber(14)
  set secondaryFilter($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(14)
  $core.bool hasSecondaryFilter() => $_has(12);
  @$pb.TagNumber(14)
  void clearSecondaryFilter() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get incubationTime => $_getIZ(13);
  @$pb.TagNumber(15)
  set incubationTime($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(15)
  $core.bool hasIncubationTime() => $_has(13);
  @$pb.TagNumber(15)
  void clearIncubationTime() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get readingTime => $_getIZ(14);
  @$pb.TagNumber(16)
  set readingTime($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(16)
  $core.bool hasReadingTime() => $_has(14);
  @$pb.TagNumber(16)
  void clearReadingTime() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get corelationA => $_getN(15);
  @$pb.TagNumber(17)
  set corelationA($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(17)
  $core.bool hasCorelationA() => $_has(15);
  @$pb.TagNumber(17)
  void clearCorelationA() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get corelationB => $_getN(16);
  @$pb.TagNumber(18)
  set corelationB($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(18)
  $core.bool hasCorelationB() => $_has(16);
  @$pb.TagNumber(18)
  void clearCorelationB() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.int get r1Volume => $_getIZ(17);
  @$pb.TagNumber(19)
  set r1Volume($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(19)
  $core.bool hasR1Volume() => $_has(17);
  @$pb.TagNumber(19)
  void clearR1Volume() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.int get r2Volume => $_getIZ(18);
  @$pb.TagNumber(20)
  set r2Volume($core.int value) => $_setSignedInt32(18, value);
  @$pb.TagNumber(20)
  $core.bool hasR2Volume() => $_has(18);
  @$pb.TagNumber(20)
  void clearR2Volume() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get sampleVolume => $_getN(19);
  @$pb.TagNumber(21)
  set sampleVolume($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(21)
  $core.bool hasSampleVolume() => $_has(19);
  @$pb.TagNumber(21)
  void clearSampleVolume() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.int get autoDilutionRatio => $_getIZ(20);
  @$pb.TagNumber(22)
  set autoDilutionRatio($core.int value) => $_setSignedInt32(20, value);
  @$pb.TagNumber(22)
  $core.bool hasAutoDilutionRatio() => $_has(20);
  @$pb.TagNumber(22)
  void clearAutoDilutionRatio() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.int get stirrerSpeedSample => $_getIZ(21);
  @$pb.TagNumber(23)
  set stirrerSpeedSample($core.int value) => $_setSignedInt32(21, value);
  @$pb.TagNumber(23)
  $core.bool hasStirrerSpeedSample() => $_has(21);
  @$pb.TagNumber(23)
  void clearStirrerSpeedSample() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.int get stirrerSpeedR2 => $_getIZ(22);
  @$pb.TagNumber(24)
  set stirrerSpeedR2($core.int value) => $_setSignedInt32(22, value);
  @$pb.TagNumber(24)
  $core.bool hasStirrerSpeedR2() => $_has(22);
  @$pb.TagNumber(24)
  void clearStirrerSpeedR2() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.double get lastReagentBlank => $_getN(23);
  @$pb.TagNumber(25)
  set lastReagentBlank($core.double value) => $_setDouble(23, value);
  @$pb.TagNumber(25)
  $core.bool hasLastReagentBlank() => $_has(23);
  @$pb.TagNumber(25)
  void clearLastReagentBlank() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.double get reagentBlankHigh => $_getN(24);
  @$pb.TagNumber(26)
  set reagentBlankHigh($core.double value) => $_setDouble(24, value);
  @$pb.TagNumber(26)
  $core.bool hasReagentBlankHigh() => $_has(24);
  @$pb.TagNumber(26)
  void clearReagentBlankHigh() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.double get reagentBlankLow => $_getN(25);
  @$pb.TagNumber(27)
  set reagentBlankLow($core.double value) => $_setDouble(25, value);
  @$pb.TagNumber(27)
  $core.bool hasReagentBlankLow() => $_has(25);
  @$pb.TagNumber(27)
  void clearReagentBlankLow() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.String get testCode => $_getSZ(26);
  @$pb.TagNumber(28)
  set testCode($core.String value) => $_setString(26, value);
  @$pb.TagNumber(28)
  $core.bool hasTestCode() => $_has(26);
  @$pb.TagNumber(28)
  void clearTestCode() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.double get linearity => $_getN(27);
  @$pb.TagNumber(29)
  set linearity($core.double value) => $_setDouble(27, value);
  @$pb.TagNumber(29)
  $core.bool hasLinearity() => $_has(27);
  @$pb.TagNumber(29)
  void clearLinearity() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.double get substrateDepletion => $_getN(28);
  @$pb.TagNumber(30)
  set substrateDepletion($core.double value) => $_setDouble(28, value);
  @$pb.TagNumber(30)
  $core.bool hasSubstrateDepletion() => $_has(28);
  @$pb.TagNumber(30)
  void clearSubstrateDepletion() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.int get direction => $_getIZ(29);
  @$pb.TagNumber(31)
  set direction($core.int value) => $_setSignedInt32(29, value);
  @$pb.TagNumber(31)
  $core.bool hasDirection() => $_has(29);
  @$pb.TagNumber(31)
  void clearDirection() => $_clearField(31);
}

class UpdateResponse extends $pb.GeneratedMessage {
  factory UpdateResponse({
    $core.bool? requestSuccess,
    $core.int? errorType,
    $core.String? message,
  }) {
    final result = create();
    if (requestSuccess != null) result.requestSuccess = requestSuccess;
    if (errorType != null) result.errorType = errorType;
    if (message != null) result.message = message;
    return result;
  }

  UpdateResponse._();

  factory UpdateResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'RequestSuccess',
        protoName: 'RequestSuccess')
    ..aI(2, _omitFieldNames ? '' : 'ErrorType', protoName: 'ErrorType')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateResponse copyWith(void Function(UpdateResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateResponse))
          as UpdateResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateResponse create() => UpdateResponse._();
  @$core.override
  UpdateResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateResponse>(create);
  static UpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get requestSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set requestSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get errorType => $_getIZ(1);
  @$pb.TagNumber(2)
  set errorType($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorType() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class TestListRequest extends $pb.GeneratedMessage {
  factory TestListRequest({
    $core.bool? includeSpecialSolutions,
    $core.bool? includeVisibleOnly,
  }) {
    final result = create();
    if (includeSpecialSolutions != null)
      result.includeSpecialSolutions = includeSpecialSolutions;
    if (includeVisibleOnly != null)
      result.includeVisibleOnly = includeVisibleOnly;
    return result;
  }

  TestListRequest._();

  factory TestListRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestListRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestListRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'IncludeSpecialSolutions',
        protoName: 'IncludeSpecialSolutions')
    ..aOB(2, _omitFieldNames ? '' : 'IncludeVisibleOnly',
        protoName: 'IncludeVisibleOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestListRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestListRequest copyWith(void Function(TestListRequest) updates) =>
      super.copyWith((message) => updates(message as TestListRequest))
          as TestListRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestListRequest create() => TestListRequest._();
  @$core.override
  TestListRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestListRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestListRequest>(create);
  static TestListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeSpecialSolutions => $_getBF(0);
  @$pb.TagNumber(1)
  set includeSpecialSolutions($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeSpecialSolutions() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeSpecialSolutions() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeVisibleOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set includeVisibleOnly($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeVisibleOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeVisibleOnly() => $_clearField(2);
}

class TestListResponse extends $pb.GeneratedMessage {
  factory TestListResponse({
    $core.bool? requestSuccess,
    $core.Iterable<TestCardData>? tests,
  }) {
    final result = create();
    if (requestSuccess != null) result.requestSuccess = requestSuccess;
    if (tests != null) result.tests.addAll(tests);
    return result;
  }

  TestListResponse._();

  factory TestListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'RequestSuccess',
        protoName: 'RequestSuccess')
    ..pPM<TestCardData>(2, _omitFieldNames ? '' : 'Tests',
        protoName: 'Tests', subBuilder: TestCardData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestListResponse copyWith(void Function(TestListResponse) updates) =>
      super.copyWith((message) => updates(message as TestListResponse))
          as TestListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestListResponse create() => TestListResponse._();
  @$core.override
  TestListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestListResponse>(create);
  static TestListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get requestSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set requestSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TestCardData> get tests => $_getList(1);
}

class TestCardData extends $pb.GeneratedMessage {
  factory TestCardData({
    $core.int? testID,
    $core.String? testCode,
    $core.String? testName,
    $core.String? method,
    $core.String? blankType,
    $core.String? primaryFilter,
    $core.String? secondaryFilter,
  }) {
    final result = create();
    if (testID != null) result.testID = testID;
    if (testCode != null) result.testCode = testCode;
    if (testName != null) result.testName = testName;
    if (method != null) result.method = method;
    if (blankType != null) result.blankType = blankType;
    if (primaryFilter != null) result.primaryFilter = primaryFilter;
    if (secondaryFilter != null) result.secondaryFilter = secondaryFilter;
    return result;
  }

  TestCardData._();

  factory TestCardData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestCardData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestCardData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'TestID', protoName: 'TestID')
    ..aOS(2, _omitFieldNames ? '' : 'TestCode', protoName: 'TestCode')
    ..aOS(3, _omitFieldNames ? '' : 'TestName', protoName: 'TestName')
    ..aOS(4, _omitFieldNames ? '' : 'Method', protoName: 'Method')
    ..aOS(5, _omitFieldNames ? '' : 'BlankType', protoName: 'BlankType')
    ..aOS(6, _omitFieldNames ? '' : 'PrimaryFilter', protoName: 'PrimaryFilter')
    ..aOS(7, _omitFieldNames ? '' : 'SecondaryFilter',
        protoName: 'SecondaryFilter')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestCardData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestCardData copyWith(void Function(TestCardData) updates) =>
      super.copyWith((message) => updates(message as TestCardData))
          as TestCardData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestCardData create() => TestCardData._();
  @$core.override
  TestCardData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestCardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestCardData>(create);
  static TestCardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get testID => $_getIZ(0);
  @$pb.TagNumber(1)
  set testID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTestID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get testCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set testCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTestCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearTestCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get testName => $_getSZ(2);
  @$pb.TagNumber(3)
  set testName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTestName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTestName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get method => $_getSZ(3);
  @$pb.TagNumber(4)
  set method($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMethod() => $_has(3);
  @$pb.TagNumber(4)
  void clearMethod() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get blankType => $_getSZ(4);
  @$pb.TagNumber(5)
  set blankType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBlankType() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlankType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get primaryFilter => $_getSZ(5);
  @$pb.TagNumber(6)
  set primaryFilter($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrimaryFilter() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrimaryFilter() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get secondaryFilter => $_getSZ(6);
  @$pb.TagNumber(7)
  set secondaryFilter($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSecondaryFilter() => $_has(6);
  @$pb.TagNumber(7)
  void clearSecondaryFilter() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
