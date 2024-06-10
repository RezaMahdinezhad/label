import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/send/request_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  late RepositoryImpl _repo;

  var isUploading = false.obs;

  RequestModel requestModel = RequestModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController socialController = TextEditingController();

  @override
  void onInit() {
    _repo = Get.put(RepositoryImpl());

    super.onInit();
  }

  bool isValid() {
    if (nameController.text == '') {
      Fluttertoast.showToast(msg: 'Name field is required.');

      return false;
    }
    if (emailController.text == '') {
      Fluttertoast.showToast(msg: 'Email field is required.');

      return false;
    }
    if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: 'Your email adress is not valid.');
      return false;
    }
    if (phoneNumberController.text == '') {
      Fluttertoast.showToast(msg: 'Phone number field is required');
      return false;
    }
    if (phoneNumberController.text.length < 10) {
      Fluttertoast.showToast(msg: 'Your phone number is not valid.');
      return false;
    }
    if (socialController.text == '') {
      Fluttertoast.showToast(msg: 'Social network field is required');
      return false;
    }
    return true;
  }

  requestJoin(context) async {
    isUploading.value = true;
    requestModel.name = nameController.text;
    requestModel.email = emailController.text;
    requestModel.phonenumber = phoneNumberController.text;
    requestModel.social = socialController.text;
    Either<Failure, Success> res = await _repo.requestToJoin(requestModel);

    res.fold((l) async {
      isUploading.value = false;

      update();
    }, (r) async {
      isUploading.value = false;
      Fluttertoast.showToast(msg: 'Your request submitted successfully.');

      await Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
      update();
    });
  }
}
