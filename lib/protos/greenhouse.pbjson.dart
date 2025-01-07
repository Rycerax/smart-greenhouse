//
//  Generated code. Do not modify.
//  source: lib/protos/greenhouse.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceRegistrationDescriptor instead')
const DeviceRegistration$json = {
  '1': 'DeviceRegistration',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `DeviceRegistration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceRegistrationDescriptor = $convert.base64Decode(
    'ChJEZXZpY2VSZWdpc3RyYXRpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRISCgR0eXBlGAIgASgJUg'
    'R0eXBlEhIKBHBvcnQYAyABKAVSBHBvcnQ=');

@$core.Deprecated('Use responseRegistrationDescriptor instead')
const ResponseRegistration$json = {
  '1': 'ResponseRegistration',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'device', '3': 2, '4': 1, '5': 9, '10': 'device'},
  ],
};

/// Descriptor for `ResponseRegistration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseRegistrationDescriptor = $convert.base64Decode(
    'ChRSZXNwb25zZVJlZ2lzdHJhdGlvbhIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIWCgZkZXZpY2'
    'UYAiABKAlSBmRldmljZQ==');

@$core.Deprecated('Use commandDescriptor instead')
const Command$json = {
  '1': 'Command',
  '2': [
    {'1': 'command', '3': 1, '4': 1, '5': 9, '10': 'command'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 3, '4': 1, '5': 2, '10': 'value'},
    {'1': 'basevalue', '3': 4, '4': 1, '5': 2, '10': 'basevalue'},
  ],
};

/// Descriptor for `Command`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDescriptor = $convert.base64Decode(
    'CgdDb21tYW5kEhgKB2NvbW1hbmQYASABKAlSB2NvbW1hbmQSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IUCgV2YWx1ZRgDIAEoAlIFdmFsdWUSHAoJYmFzZXZhbHVlGAQgASgCUgliYXNldmFsdWU=');

@$core.Deprecated('Use deviceStatusDescriptor instead')
const DeviceStatus$json = {
  '1': 'DeviceStatus',
  '2': [
    {'1': 'device', '3': 1, '4': 1, '5': 9, '10': 'device'},
    {'1': 'feature', '3': 2, '4': 1, '5': 9, '10': 'feature'},
    {'1': 'actuator', '3': 3, '4': 1, '5': 9, '10': 'actuator'},
    {'1': 'on', '3': 4, '4': 1, '5': 8, '10': 'on'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'value', '3': 5, '4': 1, '5': 2, '10': 'value'},
    {'1': 'unit', '3': 6, '4': 1, '5': 9, '10': 'unit'},
  ],
};

/// Descriptor for `DeviceStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceStatusDescriptor = $convert.base64Decode(
    'CgxEZXZpY2VTdGF0dXMSFgoGZGV2aWNlGAEgASgJUgZkZXZpY2USGAoHZmVhdHVyZRgCIAEoCV'
    'IHZmVhdHVyZRIaCghhY3R1YXRvchgDIAEoCVIIYWN0dWF0b3ISDgoCb24YBCABKAhSAm9uEhYK'
    'BnN0YXR1cxgHIAEoCVIGc3RhdHVzEhQKBXZhbHVlGAUgASgCUgV2YWx1ZRISCgR1bml0GAYgAS'
    'gJUgR1bml0');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
    {'1': 'device_status', '3': 2, '4': 3, '5': 11, '6': '.greenhouse.DeviceStatus', '10': 'deviceStatus'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRIaCghyZXNwb25zZRgBIAEoCVIIcmVzcG9uc2USPQoNZGV2aWNlX3N0YXR1cx'
    'gCIAMoCzIYLmdyZWVuaG91c2UuRGV2aWNlU3RhdHVzUgxkZXZpY2VTdGF0dXM=');

