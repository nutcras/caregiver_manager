import 'dart:convert';
import 'package:caregiver_manager/views/route_page.dart';
import 'package:flutter/material.dart';
import 'config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future checkLogin(String username, String password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.92.71:3200/api/manager/login');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({"username": username, "password": password}),
  )
      .then((req) async {
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('id', data['manager_id']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const RoutePage()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> confirmMentor(dynamic idMentor, String status, context) async {
  Uri url = Uri.parse(
      'http://206.189.92.71:3200/api/mentor/upAccept/$idMentor'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  http
      .put(url,
          headers: headers,
          body: jsonEncode({
            "status_id": status,
          }))
      .then((req) {
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.pop(context);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> inputmentorunaccept() async {
  Uri url = Uri.parse('http://206.189.92.71:3200/api/mentor/unconfirm/');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> inputmentor() async {
  Uri url = Uri.parse('http://206.189.92.71:3200/api/mentor');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future getdataprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('id');

  Uri url = Uri.parse('http://206.189.92.71:3200/api/manager/$idUser');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> inputcommend(dynamic idMentor) async {
  Uri url = Uri.parse(
      'http://206.189.92.71:3200/api/booking/review/$idMentor'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  return await http
      .get(
    url,
  )
      .then((req) {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
