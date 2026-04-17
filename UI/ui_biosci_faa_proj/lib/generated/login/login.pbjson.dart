// This is a generated file - do not edit.
//
// Generated from login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'LoginSuccess', '3': 1, '4': 1, '5': 8, '10': 'LoginSuccess'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'FirstName', '3': 3, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'SecondName', '3': 4, '4': 1, '5': 9, '10': 'SecondName'},
    {'1': 'Role', '3': 5, '4': 1, '5': 5, '10': 'Role'},
    {'1': 'RoleString', '3': 6, '4': 1, '5': 9, '10': 'RoleString'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEiIKDExvZ2luU3VjY2VzcxgBIAEoCFIMTG9naW5TdWNjZXNzEhYKBl'
    'VzZXJJRBgCIAEoBVIGVXNlcklEEhwKCUZpcnN0TmFtZRgDIAEoCVIJRmlyc3ROYW1lEh4KClNl'
    'Y29uZE5hbWUYBCABKAlSClNlY29uZE5hbWUSEgoEUm9sZRgFIAEoBVIEUm9sZRIeCgpSb2xlU3'
    'RyaW5nGAYgASgJUgpSb2xlU3RyaW5n');

@$core.Deprecated('Use dictionaryRequestDescriptor instead')
const DictionaryRequest$json = {
  '1': 'DictionaryRequest',
  '2': [
    {'1': 'DictionaryId', '3': 1, '4': 1, '5': 5, '10': 'DictionaryId'},
  ],
};

/// Descriptor for `DictionaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryRequestDescriptor = $convert.base64Decode(
    'ChFEaWN0aW9uYXJ5UmVxdWVzdBIiCgxEaWN0aW9uYXJ5SWQYASABKAVSDERpY3Rpb25hcnlJZA'
    '==');

@$core.Deprecated('Use dictionaryItemDescriptor instead')
const DictionaryItem$json = {
  '1': 'DictionaryItem',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 5, '10': 'Id'},
    {'1': 'Value', '3': 2, '4': 1, '5': 9, '10': 'Value'},
    {'1': 'CreatedAt', '3': 3, '4': 1, '5': 9, '10': 'CreatedAt'},
  ],
};

/// Descriptor for `DictionaryItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryItemDescriptor = $convert.base64Decode(
    'Cg5EaWN0aW9uYXJ5SXRlbRIOCgJJZBgBIAEoBVICSWQSFAoFVmFsdWUYAiABKAlSBVZhbHVlEh'
    'wKCUNyZWF0ZWRBdBgDIAEoCVIJQ3JlYXRlZEF0');

@$core.Deprecated('Use dictionaryListResponseDescriptor instead')
const DictionaryListResponse$json = {
  '1': 'DictionaryListResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.login.DictionaryItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `DictionaryListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryListResponseDescriptor =
    $convert.base64Decode(
        'ChZEaWN0aW9uYXJ5TGlzdFJlc3BvbnNlEisKBWl0ZW1zGAEgAygLMhUubG9naW4uRGljdGlvbm'
        'FyeUl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use dictionaryItemRequestDescriptor instead')
const DictionaryItemRequest$json = {
  '1': 'DictionaryItemRequest',
  '2': [
    {'1': 'DictionaryKeyId', '3': 1, '4': 1, '5': 5, '10': 'DictionaryKeyId'},
    {
      '1': 'DictionaryValueId',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'DictionaryValueId'
    },
    {'1': 'ValueDescription', '3': 3, '4': 1, '5': 9, '10': 'ValueDescription'},
  ],
};

/// Descriptor for `DictionaryItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryItemRequestDescriptor = $convert.base64Decode(
    'ChVEaWN0aW9uYXJ5SXRlbVJlcXVlc3QSKAoPRGljdGlvbmFyeUtleUlkGAEgASgFUg9EaWN0aW'
    '9uYXJ5S2V5SWQSLAoRRGljdGlvbmFyeVZhbHVlSWQYAiABKAVSEURpY3Rpb25hcnlWYWx1ZUlk'
    'EioKEFZhbHVlRGVzY3JpcHRpb24YAyABKAlSEFZhbHVlRGVzY3JpcHRpb24=');
