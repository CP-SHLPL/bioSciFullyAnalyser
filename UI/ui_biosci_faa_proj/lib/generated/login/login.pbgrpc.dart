// This is a generated file - do not edit.
//
// Generated from login.proto.

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

import 'login.pb.dart' as $0;

export 'login.pb.dart';

@$pb.GrpcServiceName('login.Login')
class LoginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  LoginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.LoginResponse> loginAttempt(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$loginAttempt, request, options: options);
  }

  $grpc.ResponseFuture<$0.DictionaryListResponse> getDictionaryValues(
    $0.DictionaryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDictionaryValues, request, options: options);
  }

  $grpc.ResponseFuture<$0.DictionaryItem> updateDictionaryValue(
    $0.DictionaryItemRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateDictionaryValue, request, options: options);
  }

  // method descriptors

  static final _$loginAttempt =
      $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
          '/login.Login/LoginAttempt',
          ($0.LoginRequest value) => value.writeToBuffer(),
          $0.LoginResponse.fromBuffer);
  static final _$getDictionaryValues =
      $grpc.ClientMethod<$0.DictionaryRequest, $0.DictionaryListResponse>(
          '/login.Login/GetDictionaryValues',
          ($0.DictionaryRequest value) => value.writeToBuffer(),
          $0.DictionaryListResponse.fromBuffer);
  static final _$updateDictionaryValue =
      $grpc.ClientMethod<$0.DictionaryItemRequest, $0.DictionaryItem>(
          '/login.Login/UpdateDictionaryValue',
          ($0.DictionaryItemRequest value) => value.writeToBuffer(),
          $0.DictionaryItem.fromBuffer);
}

@$pb.GrpcServiceName('login.Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'login.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'LoginAttempt',
        loginAttempt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DictionaryRequest, $0.DictionaryListResponse>(
            'GetDictionaryValues',
            getDictionaryValues_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DictionaryRequest.fromBuffer(value),
            ($0.DictionaryListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DictionaryItemRequest, $0.DictionaryItem>(
        'UpdateDictionaryValue',
        updateDictionaryValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DictionaryItemRequest.fromBuffer(value),
        ($0.DictionaryItem value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> loginAttempt_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return loginAttempt($call, await $request);
  }

  $async.Future<$0.LoginResponse> loginAttempt(
      $grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$0.DictionaryListResponse> getDictionaryValues_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DictionaryRequest> $request) async {
    return getDictionaryValues($call, await $request);
  }

  $async.Future<$0.DictionaryListResponse> getDictionaryValues(
      $grpc.ServiceCall call, $0.DictionaryRequest request);

  $async.Future<$0.DictionaryItem> updateDictionaryValue_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DictionaryItemRequest> $request) async {
    return updateDictionaryValue($call, await $request);
  }

  $async.Future<$0.DictionaryItem> updateDictionaryValue(
      $grpc.ServiceCall call, $0.DictionaryItemRequest request);
}
