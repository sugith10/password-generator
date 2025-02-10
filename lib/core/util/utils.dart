import 'dart:math';

num degToRad(num deg) => deg * (pi / 180.0);

//
// ignore: type_annotate_public_apis, always_specify_types, avoid_dynamic_calls
num normalize(value, min, max) => (value - min) / (max - min);
