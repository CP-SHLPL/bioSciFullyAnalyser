// This is a generated file - do not edit.
//
// Generated from login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? username,
    $core.String? password,
  }) {
    final result = create();
    if (username != null) result.username = username;
    if (password != null) result.password = password;
    return result;
  }

  LoginRequest._();

  factory LoginRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest copyWith(void Function(LoginRequest) updates) =>
      super.copyWith((message) => updates(message as LoginRequest))
          as LoginRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  @$core.override
  LoginRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.bool? loginSuccess,
    $core.int? userID,
    $core.String? firstName,
    $core.String? secondName,
    $core.int? role,
    $core.String? roleString,
  }) {
    final result = create();
    if (loginSuccess != null) result.loginSuccess = loginSuccess;
    if (userID != null) result.userID = userID;
    if (firstName != null) result.firstName = firstName;
    if (secondName != null) result.secondName = secondName;
    if (role != null) result.role = role;
    if (roleString != null) result.roleString = roleString;
    return result;
  }

  LoginResponse._();

  factory LoginResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'LoginSuccess', protoName: 'LoginSuccess')
    ..aI(2, _omitFieldNames ? '' : 'UserID', protoName: 'UserID')
    ..aOS(3, _omitFieldNames ? '' : 'FirstName', protoName: 'FirstName')
    ..aOS(4, _omitFieldNames ? '' : 'SecondName', protoName: 'SecondName')
    ..aI(5, _omitFieldNames ? '' : 'Role', protoName: 'Role')
    ..aOS(6, _omitFieldNames ? '' : 'RoleString', protoName: 'RoleString')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse copyWith(void Function(LoginResponse) updates) =>
      super.copyWith((message) => updates(message as LoginResponse))
          as LoginResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  @$core.override
  LoginResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get loginSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set loginSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLoginSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondName => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSecondName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get role => $_getIZ(4);
  @$pb.TagNumber(5)
  set role($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get roleString => $_getSZ(5);
  @$pb.TagNumber(6)
  set roleString($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoleString() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoleString() => $_clearField(6);
}

class DictionaryRequest extends $pb.GeneratedMessage {
  factory DictionaryRequest({
    $core.int? dictionaryId,
  }) {
    final result = create();
    if (dictionaryId != null) result.dictionaryId = dictionaryId;
    return result;
  }

  DictionaryRequest._();

  factory DictionaryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DictionaryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DictionaryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'DictionaryId', protoName: 'DictionaryId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryRequest copyWith(void Function(DictionaryRequest) updates) =>
      super.copyWith((message) => updates(message as DictionaryRequest))
          as DictionaryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DictionaryRequest create() => DictionaryRequest._();
  @$core.override
  DictionaryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DictionaryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DictionaryRequest>(create);
  static DictionaryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dictionaryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set dictionaryId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDictionaryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDictionaryId() => $_clearField(1);
}

class DictionaryItem extends $pb.GeneratedMessage {
  factory DictionaryItem({
    $core.int? id,
    $core.String? value,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (value != null) result.value = value;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  DictionaryItem._();

  factory DictionaryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DictionaryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DictionaryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Value', protoName: 'Value')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'CreatedAt',
        protoName: 'CreatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryItem copyWith(void Function(DictionaryItem) updates) =>
      super.copyWith((message) => updates(message as DictionaryItem))
          as DictionaryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DictionaryItem create() => DictionaryItem._();
  @$core.override
  DictionaryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DictionaryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DictionaryItem>(create);
  static DictionaryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreatedAt() => $_ensure(2);
}

class DictionaryListResponse extends $pb.GeneratedMessage {
  factory DictionaryListResponse({
    $core.Iterable<DictionaryItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  DictionaryListResponse._();

  factory DictionaryListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DictionaryListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DictionaryListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..pPM<DictionaryItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: DictionaryItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryListResponse copyWith(
          void Function(DictionaryListResponse) updates) =>
      super.copyWith((message) => updates(message as DictionaryListResponse))
          as DictionaryListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DictionaryListResponse create() => DictionaryListResponse._();
  @$core.override
  DictionaryListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DictionaryListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DictionaryListResponse>(create);
  static DictionaryListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DictionaryItem> get items => $_getList(0);
}

class DictionaryItemRequest extends $pb.GeneratedMessage {
  factory DictionaryItemRequest({
    $core.int? dictionaryKeyId,
    $core.int? dictionaryValueId,
    $core.String? valueDescription,
  }) {
    final result = create();
    if (dictionaryKeyId != null) result.dictionaryKeyId = dictionaryKeyId;
    if (dictionaryValueId != null) result.dictionaryValueId = dictionaryValueId;
    if (valueDescription != null) result.valueDescription = valueDescription;
    return result;
  }

  DictionaryItemRequest._();

  factory DictionaryItemRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DictionaryItemRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DictionaryItemRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'DictionaryKeyId',
        protoName: 'DictionaryKeyId')
    ..aI(2, _omitFieldNames ? '' : 'DictionaryValueId',
        protoName: 'DictionaryValueId')
    ..aOS(3, _omitFieldNames ? '' : 'ValueDescription',
        protoName: 'ValueDescription')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryItemRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DictionaryItemRequest copyWith(
          void Function(DictionaryItemRequest) updates) =>
      super.copyWith((message) => updates(message as DictionaryItemRequest))
          as DictionaryItemRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DictionaryItemRequest create() => DictionaryItemRequest._();
  @$core.override
  DictionaryItemRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DictionaryItemRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DictionaryItemRequest>(create);
  static DictionaryItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dictionaryKeyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set dictionaryKeyId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDictionaryKeyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDictionaryKeyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get dictionaryValueId => $_getIZ(1);
  @$pb.TagNumber(2)
  set dictionaryValueId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDictionaryValueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDictionaryValueId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get valueDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set valueDescription($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValueDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearValueDescription() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
