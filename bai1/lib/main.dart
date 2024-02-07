import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

dynamic dataJson = {
  "province": [
    {"id": "01", "name": "Thành Phố Hà Nội", "level": "Thành phố Trung ương"},
    {"id": "02", "name": "Tỉnh Hà Giang", "level": "Tỉnh"},
  ],
  "district": [
    {
      "id": "001",
      "name": "Quận Ba Đình",
      "level": "Thành phố",
      "provinceId": "02"
    },
    {
      "id": "024",
      "name": "Thành phố Hà Giang",
      "level": "Quận",
      "provinceId": "01"
    },
  ],
  "ward": [
    {
      "id": "00001",
      "name": "Phường Phúc Xá",
      "level": "Phường",
      "districtId": "001",
      "provinceId": "01"
    },
    {
      "id": "00688",
      "name": "Phường Quang Trung",
      "level": "Phường",
      "districtId": "024",
      "provinceId": "02"
    }
  ]
};

void main() {}
