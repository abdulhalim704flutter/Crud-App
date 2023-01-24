import 'dart:convert';
import 'package:crud_app/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateReuest(FormValues)async{
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if(ResultCode==200 && ResultBody['status'] == "success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail Please Try Again!");
    return false;
  }
}

Future<List> ProductGridViewListRequest() async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.get(URL,headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }else{
    ErrorToast("Request Fail Please Try Again!");
    return [];
  }
}

Future<bool> ProductDeleteRequest(id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.get(URL,headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if(ResultCode==200 && ResultBody['status'] == "success"){
    SuccessToast("Delete Success");
    return true;
  }else{
    ErrorToast('Delete Fail Please Try Again');
    return false;
  }
}


Future<bool> ProductUpdateReuest(FormValues,id)async{
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if(ResultCode==200 && ResultBody['status'] == "success"){
    SuccessToast("Update Success");
    return true;
  }
  else{
    ErrorToast("Update Fail Please Try Again!");
    return false;
  }
}