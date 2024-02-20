import 'dart:convert';

import 'package:bai1/models/addressInfo.dart';
import 'package:bai1/models/district.dart';
import 'package:bai1/models/province.dart';
import 'package:bai1/models/userInfo.dart';
import 'package:bai1/models/ward.dart';
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
  ],
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _streetController = TextEditingController();

  late AddressInfo _addressInfo;
  late UserInfo _userInfo;

  late List<Step> _steps;

  @override
  void initState() {
    super.initState();
    _addressInfo = AddressInfo();
    _userInfo = UserInfo(
      name: "abc",
      email: "abc@",
      phoneNumber: "0123456789",
      birthDate: DateTime.parse("2000-01-01"),
      address: AddressInfo(street: "hn"),
    );
    initSteps();
  }

  void initSteps() {
    _steps = [
      Step(
        title: Text('Step 1'),
        content: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Enter your phone number'),
            ),
          ],
        ),
        isActive: true,
      ),
      Step(
        title: Text('Step 2'),
        content: Column(
          children: [
            DropdownButtonFormField<Province>(
              value: _addressInfo.province,
              items: dataJson['province']
                  .map<DropdownMenuItem<Province>>(
                    (provinceData) => DropdownMenuItem<Province>(
                      value: Province.fromMap(provinceData),
                      child: Text(provinceData['name'] as String),
                    ),
                  )
                  .toList(),
              onChanged: (selectedProvince) {
                setState(() {
                  _addressInfo.province = selectedProvince;
                  _addressInfo.district = null;
                  _addressInfo.ward = null;
                });
              },
              decoration: InputDecoration(labelText: 'Select Province'),
            ),
            Column(
              children: [
                DropdownButtonFormField<District>(
                  value: _addressInfo.district,
                  items: dataJson['district']
                      .where((districtData) =>
                          districtData['provinceId'] ==
                          _addressInfo.province?.id)
                      .map<DropdownMenuItem<District>>(
                        (districtData) => DropdownMenuItem<District>(
                          value: District.fromMap(districtData),
                          child: Text(districtData['name'] as String),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedDistrict) {
                    setState(() {
                      _addressInfo.district = selectedDistrict;
                      _addressInfo.ward = null;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Select District'),
                ),
                DropdownButtonFormField<Ward>(
                  value: _addressInfo.ward,
                  items: dataJson['ward']
                      .where((wardData) =>
                          wardData['districtId'] == _addressInfo.district?.id &&
                          wardData['provinceId'] == _addressInfo.province?.id)
                      .map<DropdownMenuItem<Ward>>(
                        (wardData) => DropdownMenuItem<Ward>(
                          value: Ward.fromMap(wardData),
                          child: Text(wardData['name'] as String),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedWard) {
                    setState(() {
                      _addressInfo.ward = selectedWard;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Select Ward'),
                ),
              ],
            ),
          ],
        ),
        isActive: false,
      ),
      Step(
        title: Text('Step 3'),
        content: Column(
          children: [
            Text("Name: ${_userInfo.name}"),
            Text("Email: ${_userInfo.email}"),
            Text("Phone Number: ${_userInfo.phoneNumber}"),
            Text("Province: ${_addressInfo.province?.name ?? ''}"),
            Text("District: ${_addressInfo.district?.name ?? ''}"),
            Text("Ward: ${_addressInfo.ward?.name ?? ''}"),
            Text("Street: ${_streetController.text}"),
          ],
        ),
        isActive: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        steps: _steps,
        type: StepperType.horizontal,
        onStepContinue: () {
          bool isValid = validateCurrentStep();

          if (isValid) {
            setState(() {
              if (_currentStep < _steps.length - 1) {
                _currentStep++;
                updateStepState();
              } else {
                // Save user info
                _userInfo.name = _nameController.text;
                _userInfo.email = _emailController.text;
                _userInfo.phoneNumber = _phoneNumberController.text;
                _userInfo.address =
                    _addressInfo.copyWith(street: _streetController.text);

                // Print or process _userInfo as needed
                print(_userInfo);
              }
            });
          }
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
              updateStepState();
            }
          });
        },
      ),
    );
  }

  bool validateCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _nameController.text.isNotEmpty &&
            _emailController.text.isNotEmpty &&
            _phoneNumberController.text.isNotEmpty;
      case 1:
        return _addressInfo.province != null &&
            _addressInfo.district != null &&
            _addressInfo.ward != null;
      case 2:
        return _streetController.text.isNotEmpty;
      default:
        return true;
    }
  }

  void updateStepState() {
    setState(() {
      for (int i = 0; i < _steps.length; i++) {
        _steps[i] = Step(
          title: _steps[i].title,
          content: _steps[i].content,
          isActive: i == _currentStep,
        );
      }
    });
  }
}
