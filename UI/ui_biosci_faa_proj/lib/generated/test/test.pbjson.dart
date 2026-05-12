// This is a generated file - do not edit.
//
// Generated from test.proto.

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

@$core.Deprecated('Use dropDownRequestDescriptor instead')
const DropDownRequest$json = {
  '1': 'DropDownRequest',
};

/// Descriptor for `DropDownRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropDownRequestDescriptor =
    $convert.base64Decode('Cg9Ecm9wRG93blJlcXVlc3Q=');

@$core.Deprecated('Use dropDownListResponseDescriptor instead')
const DropDownListResponse$json = {
  '1': 'DropDownListResponse',
  '2': [
    {
      '1': 'dropDowns',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.test.DropDownListResponse.DropDownsEntry',
      '10': 'dropDowns'
    },
  ],
  '3': [DropDownListResponse_DropDownsEntry$json],
};

@$core.Deprecated('Use dropDownListResponseDescriptor instead')
const DropDownListResponse_DropDownsEntry$json = {
  '1': 'DropDownsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.test.DropDownValues',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `DropDownListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropDownListResponseDescriptor = $convert.base64Decode(
    'ChREcm9wRG93bkxpc3RSZXNwb25zZRJHCglkcm9wRG93bnMYASADKAsyKS50ZXN0LkRyb3BEb3'
    'duTGlzdFJlc3BvbnNlLkRyb3BEb3duc0VudHJ5Uglkcm9wRG93bnMaUgoORHJvcERvd25zRW50'
    'cnkSEAoDa2V5GAEgASgJUgNrZXkSKgoFdmFsdWUYAiABKAsyFC50ZXN0LkRyb3BEb3duVmFsdW'
    'VzUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use dropDownValuesDescriptor instead')
const DropDownValues$json = {
  '1': 'DropDownValues',
  '2': [
    {
      '1': 'Items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.test.DropDownListItem',
      '10': 'Items'
    },
  ],
};

/// Descriptor for `DropDownValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropDownValuesDescriptor = $convert.base64Decode(
    'Cg5Ecm9wRG93blZhbHVlcxIsCgVJdGVtcxgBIAMoCzIWLnRlc3QuRHJvcERvd25MaXN0SXRlbV'
    'IFSXRlbXM=');

@$core.Deprecated('Use dropDownListItemDescriptor instead')
const DropDownListItem$json = {
  '1': 'DropDownListItem',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `DropDownListItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dropDownListItemDescriptor = $convert.base64Decode(
    'ChBEcm9wRG93bkxpc3RJdGVtEhQKBXZhbHVlGAEgASgFUgV2YWx1ZRISCgR0ZXh0GAIgASgJUg'
    'R0ZXh0');

@$core.Deprecated('Use testRequestDescriptor instead')
const TestRequest$json = {
  '1': 'TestRequest',
  '2': [
    {'1': 'TestID', '3': 1, '4': 1, '5': 5, '10': 'TestID'},
  ],
};

/// Descriptor for `TestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testRequestDescriptor = $convert
    .base64Decode('CgtUZXN0UmVxdWVzdBIWCgZUZXN0SUQYASABKAVSBlRlc3RJRA==');

@$core.Deprecated('Use testResponseDescriptor instead')
const TestResponse$json = {
  '1': 'TestResponse',
  '2': [
    {'1': 'requestSuccess', '3': 1, '4': 1, '5': 8, '10': 'requestSuccess'},
    {'1': 'test', '3': 2, '4': 1, '5': 11, '6': '.test.TestData', '10': 'test'},
  ],
};

/// Descriptor for `TestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testResponseDescriptor = $convert.base64Decode(
    'CgxUZXN0UmVzcG9uc2USJgoOcmVxdWVzdFN1Y2Nlc3MYASABKAhSDnJlcXVlc3RTdWNjZXNzEi'
    'IKBHRlc3QYAiABKAsyDi50ZXN0LlRlc3REYXRhUgR0ZXN0');

@$core.Deprecated('Use testDataDescriptor instead')
const TestData$json = {
  '1': 'TestData',
  '2': [
    {'1': 'testID', '3': 2, '4': 1, '5': 5, '10': 'testID'},
    {'1': 'testName', '3': 3, '4': 1, '5': 9, '10': 'testName'},
    {'1': 'testMethod', '3': 4, '4': 1, '5': 5, '10': 'testMethod'},
    {'1': 'testUnit', '3': 5, '4': 1, '5': 5, '10': 'testUnit'},
    {'1': 'reagents', '3': 6, '4': 1, '5': 5, '10': 'reagents'},
    {'1': 'decimals', '3': 7, '4': 1, '5': 5, '10': 'decimals'},
    {'1': 'blankType', '3': 8, '4': 1, '5': 5, '10': 'blankType'},
    {'1': 'CreatedBy', '3': 9, '4': 1, '5': 9, '10': 'CreatedBy'},
    {'1': 'CreatedAt', '3': 10, '4': 1, '5': 9, '10': 'CreatedAt'},
    {'1': 'ModifiedBy', '3': 11, '4': 1, '5': 9, '10': 'ModifiedBy'},
    {'1': 'ModifiedAt', '3': 12, '4': 1, '5': 9, '10': 'ModifiedAt'},
    {'1': 'primaryFilter', '3': 13, '4': 1, '5': 5, '10': 'primaryFilter'},
    {'1': 'secondaryFilter', '3': 14, '4': 1, '5': 5, '10': 'secondaryFilter'},
    {'1': 'incubationTime', '3': 15, '4': 1, '5': 5, '10': 'incubationTime'},
    {'1': 'readingTime', '3': 16, '4': 1, '5': 5, '10': 'readingTime'},
    {'1': 'corelationA', '3': 17, '4': 1, '5': 1, '10': 'corelationA'},
    {'1': 'corelationB', '3': 18, '4': 1, '5': 1, '10': 'corelationB'},
    {'1': 'r1Volume', '3': 19, '4': 1, '5': 5, '10': 'r1Volume'},
    {'1': 'r2Volume', '3': 20, '4': 1, '5': 5, '10': 'r2Volume'},
    {'1': 'sampleVolume', '3': 21, '4': 1, '5': 1, '10': 'sampleVolume'},
    {
      '1': 'autoDilutionRatio',
      '3': 22,
      '4': 1,
      '5': 5,
      '10': 'autoDilutionRatio'
    },
    {
      '1': 'stirrerSpeedSample',
      '3': 23,
      '4': 1,
      '5': 5,
      '10': 'stirrerSpeedSample'
    },
    {'1': 'stirrerSpeedR2', '3': 24, '4': 1, '5': 5, '10': 'stirrerSpeedR2'},
    {
      '1': 'lastReagentBlank',
      '3': 25,
      '4': 1,
      '5': 1,
      '10': 'lastReagentBlank'
    },
    {
      '1': 'reagentBlankHigh',
      '3': 26,
      '4': 1,
      '5': 1,
      '10': 'reagentBlankHigh'
    },
    {'1': 'reagentBlankLow', '3': 27, '4': 1, '5': 1, '10': 'reagentBlankLow'},
    {'1': 'testCode', '3': 28, '4': 1, '5': 9, '10': 'testCode'},
    {'1': 'linearity', '3': 29, '4': 1, '5': 1, '10': 'linearity'},
    {
      '1': 'substrateDepletion',
      '3': 30,
      '4': 1,
      '5': 1,
      '10': 'substrateDepletion'
    },
    {'1': 'direction', '3': 31, '4': 1, '5': 5, '10': 'direction'},
  ],
};

/// Descriptor for `TestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testDataDescriptor = $convert.base64Decode(
    'CghUZXN0RGF0YRIWCgZ0ZXN0SUQYAiABKAVSBnRlc3RJRBIaCgh0ZXN0TmFtZRgDIAEoCVIIdG'
    'VzdE5hbWUSHgoKdGVzdE1ldGhvZBgEIAEoBVIKdGVzdE1ldGhvZBIaCgh0ZXN0VW5pdBgFIAEo'
    'BVIIdGVzdFVuaXQSGgoIcmVhZ2VudHMYBiABKAVSCHJlYWdlbnRzEhoKCGRlY2ltYWxzGAcgAS'
    'gFUghkZWNpbWFscxIcCglibGFua1R5cGUYCCABKAVSCWJsYW5rVHlwZRIcCglDcmVhdGVkQnkY'
    'CSABKAlSCUNyZWF0ZWRCeRIcCglDcmVhdGVkQXQYCiABKAlSCUNyZWF0ZWRBdBIeCgpNb2RpZm'
    'llZEJ5GAsgASgJUgpNb2RpZmllZEJ5Eh4KCk1vZGlmaWVkQXQYDCABKAlSCk1vZGlmaWVkQXQS'
    'JAoNcHJpbWFyeUZpbHRlchgNIAEoBVINcHJpbWFyeUZpbHRlchIoCg9zZWNvbmRhcnlGaWx0ZX'
    'IYDiABKAVSD3NlY29uZGFyeUZpbHRlchImCg5pbmN1YmF0aW9uVGltZRgPIAEoBVIOaW5jdWJh'
    'dGlvblRpbWUSIAoLcmVhZGluZ1RpbWUYECABKAVSC3JlYWRpbmdUaW1lEiAKC2NvcmVsYXRpb2'
    '5BGBEgASgBUgtjb3JlbGF0aW9uQRIgCgtjb3JlbGF0aW9uQhgSIAEoAVILY29yZWxhdGlvbkIS'
    'GgoIcjFWb2x1bWUYEyABKAVSCHIxVm9sdW1lEhoKCHIyVm9sdW1lGBQgASgFUghyMlZvbHVtZR'
    'IiCgxzYW1wbGVWb2x1bWUYFSABKAFSDHNhbXBsZVZvbHVtZRIsChFhdXRvRGlsdXRpb25SYXRp'
    'bxgWIAEoBVIRYXV0b0RpbHV0aW9uUmF0aW8SLgoSc3RpcnJlclNwZWVkU2FtcGxlGBcgASgFUh'
    'JzdGlycmVyU3BlZWRTYW1wbGUSJgoOc3RpcnJlclNwZWVkUjIYGCABKAVSDnN0aXJyZXJTcGVl'
    'ZFIyEioKEGxhc3RSZWFnZW50QmxhbmsYGSABKAFSEGxhc3RSZWFnZW50QmxhbmsSKgoQcmVhZ2'
    'VudEJsYW5rSGlnaBgaIAEoAVIQcmVhZ2VudEJsYW5rSGlnaBIoCg9yZWFnZW50QmxhbmtMb3cY'
    'GyABKAFSD3JlYWdlbnRCbGFua0xvdxIaCgh0ZXN0Q29kZRgcIAEoCVIIdGVzdENvZGUSHAoJbG'
    'luZWFyaXR5GB0gASgBUglsaW5lYXJpdHkSLgoSc3Vic3RyYXRlRGVwbGV0aW9uGB4gASgBUhJz'
    'dWJzdHJhdGVEZXBsZXRpb24SHAoJZGlyZWN0aW9uGB8gASgFUglkaXJlY3Rpb24=');

@$core.Deprecated('Use updateResponseDescriptor instead')
const UpdateResponse$json = {
  '1': 'UpdateResponse',
  '2': [
    {'1': 'RequestSuccess', '3': 1, '4': 1, '5': 8, '10': 'RequestSuccess'},
    {'1': 'ErrorType', '3': 2, '4': 1, '5': 5, '10': 'ErrorType'},
    {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `UpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateResponseDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVSZXNwb25zZRImCg5SZXF1ZXN0U3VjY2VzcxgBIAEoCFIOUmVxdWVzdFN1Y2Nlc3'
    'MSHAoJRXJyb3JUeXBlGAIgASgFUglFcnJvclR5cGUSGAoHTWVzc2FnZRgDIAEoCVIHTWVzc2Fn'
    'ZQ==');

@$core.Deprecated('Use testListRequestDescriptor instead')
const TestListRequest$json = {
  '1': 'TestListRequest',
  '2': [
    {
      '1': 'IncludeSpecialSolutions',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'IncludeSpecialSolutions'
    },
    {
      '1': 'IncludeVisibleOnly',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'IncludeVisibleOnly'
    },
  ],
};

/// Descriptor for `TestListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testListRequestDescriptor = $convert.base64Decode(
    'Cg9UZXN0TGlzdFJlcXVlc3QSOAoXSW5jbHVkZVNwZWNpYWxTb2x1dGlvbnMYASABKAhSF0luY2'
    'x1ZGVTcGVjaWFsU29sdXRpb25zEi4KEkluY2x1ZGVWaXNpYmxlT25seRgCIAEoCFISSW5jbHVk'
    'ZVZpc2libGVPbmx5');

@$core.Deprecated('Use testListResponseDescriptor instead')
const TestListResponse$json = {
  '1': 'TestListResponse',
  '2': [
    {'1': 'RequestSuccess', '3': 1, '4': 1, '5': 8, '10': 'RequestSuccess'},
    {
      '1': 'Tests',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.test.TestCardData',
      '10': 'Tests'
    },
  ],
};

/// Descriptor for `TestListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testListResponseDescriptor = $convert.base64Decode(
    'ChBUZXN0TGlzdFJlc3BvbnNlEiYKDlJlcXVlc3RTdWNjZXNzGAEgASgIUg5SZXF1ZXN0U3VjY2'
    'VzcxIoCgVUZXN0cxgCIAMoCzISLnRlc3QuVGVzdENhcmREYXRhUgVUZXN0cw==');

@$core.Deprecated('Use testCardDataDescriptor instead')
const TestCardData$json = {
  '1': 'TestCardData',
  '2': [
    {'1': 'TestID', '3': 1, '4': 1, '5': 5, '10': 'TestID'},
    {'1': 'TestCode', '3': 2, '4': 1, '5': 9, '10': 'TestCode'},
    {'1': 'TestName', '3': 3, '4': 1, '5': 9, '10': 'TestName'},
    {'1': 'Method', '3': 4, '4': 1, '5': 9, '10': 'Method'},
    {'1': 'BlankType', '3': 5, '4': 1, '5': 9, '10': 'BlankType'},
    {'1': 'PrimaryFilter', '3': 6, '4': 1, '5': 9, '10': 'PrimaryFilter'},
    {'1': 'SecondaryFilter', '3': 7, '4': 1, '5': 9, '10': 'SecondaryFilter'},
  ],
};

/// Descriptor for `TestCardData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testCardDataDescriptor = $convert.base64Decode(
    'CgxUZXN0Q2FyZERhdGESFgoGVGVzdElEGAEgASgFUgZUZXN0SUQSGgoIVGVzdENvZGUYAiABKA'
    'lSCFRlc3RDb2RlEhoKCFRlc3ROYW1lGAMgASgJUghUZXN0TmFtZRIWCgZNZXRob2QYBCABKAlS'
    'Bk1ldGhvZBIcCglCbGFua1R5cGUYBSABKAlSCUJsYW5rVHlwZRIkCg1QcmltYXJ5RmlsdGVyGA'
    'YgASgJUg1QcmltYXJ5RmlsdGVyEigKD1NlY29uZGFyeUZpbHRlchgHIAEoCVIPU2Vjb25kYXJ5'
    'RmlsdGVy');
