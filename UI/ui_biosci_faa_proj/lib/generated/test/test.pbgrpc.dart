// This is a generated file - do not edit.
//
// Generated from test.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'test.pb.dart' as $0;

export 'test.pb.dart';

@$pb.GrpcServiceName('test.Test')
class TestClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  TestClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.TestResponse> getTest(
    $0.TestRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTest, request, options: options);
  }

  $grpc.ResponseFuture<$0.DropDownListResponse> getAllDropDowns(
    $0.DropDownRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllDropDowns, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateResponse> updateTest(
    $0.TestResponse request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateTest, request, options: options);
  }

  $grpc.ResponseFuture<$0.TestListResponse> getTestList(
    $0.TestListRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTestList, request, options: options);
  }

  // method descriptors

  static final _$getTest = $grpc.ClientMethod<$0.TestRequest, $0.TestResponse>(
      '/test.Test/GetTest',
      ($0.TestRequest value) => value.writeToBuffer(),
      $0.TestResponse.fromBuffer);
  static final _$getAllDropDowns =
      $grpc.ClientMethod<$0.DropDownRequest, $0.DropDownListResponse>(
          '/test.Test/GetAllDropDowns',
          ($0.DropDownRequest value) => value.writeToBuffer(),
          $0.DropDownListResponse.fromBuffer);
  static final _$updateTest =
      $grpc.ClientMethod<$0.TestResponse, $0.UpdateResponse>(
          '/test.Test/UpdateTest',
          ($0.TestResponse value) => value.writeToBuffer(),
          $0.UpdateResponse.fromBuffer);
  static final _$getTestList =
      $grpc.ClientMethod<$0.TestListRequest, $0.TestListResponse>(
          '/test.Test/GetTestList',
          ($0.TestListRequest value) => value.writeToBuffer(),
          $0.TestListResponse.fromBuffer);
}

@$pb.GrpcServiceName('test.Test')
abstract class TestServiceBase extends $grpc.Service {
  $core.String get $name => 'test.Test';

  TestServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TestRequest, $0.TestResponse>(
        'GetTest',
        getTest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TestRequest.fromBuffer(value),
        ($0.TestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DropDownRequest, $0.DropDownListResponse>(
        'GetAllDropDowns',
        getAllDropDowns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DropDownRequest.fromBuffer(value),
        ($0.DropDownListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TestResponse, $0.UpdateResponse>(
        'UpdateTest',
        updateTest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TestResponse.fromBuffer(value),
        ($0.UpdateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TestListRequest, $0.TestListResponse>(
        'GetTestList',
        getTestList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TestListRequest.fromBuffer(value),
        ($0.TestListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TestResponse> getTest_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.TestRequest> $request) async {
    return getTest($call, await $request);
  }

  $async.Future<$0.TestResponse> getTest(
      $grpc.ServiceCall call, $0.TestRequest request);

  $async.Future<$0.DropDownListResponse> getAllDropDowns_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DropDownRequest> $request) async {
    return getAllDropDowns($call, await $request);
  }

  $async.Future<$0.DropDownListResponse> getAllDropDowns(
      $grpc.ServiceCall call, $0.DropDownRequest request);

  $async.Future<$0.UpdateResponse> updateTest_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.TestResponse> $request) async {
    return updateTest($call, await $request);
  }

  $async.Future<$0.UpdateResponse> updateTest(
      $grpc.ServiceCall call, $0.TestResponse request);

  $async.Future<$0.TestListResponse> getTestList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.TestListRequest> $request) async {
    return getTestList($call, await $request);
  }

  $async.Future<$0.TestListResponse> getTestList(
      $grpc.ServiceCall call, $0.TestListRequest request);
}
