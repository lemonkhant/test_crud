import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/model/product_model.dart';

class Api{
  static const baseUrl = "http://192.168.1.13/api/";




//post method
  static addProduct(Map pdata) async{

    print(pdata);

      var url =Uri.parse("${baseUrl}add_product");
    try {
  final response = await http.post(url,body: pdata);
  print(response.statusCode); 
  
  if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      print(data);
  }else{
    print("Failed to get response");
  }
} on Exception catch (e) {
  debugPrint(e.toString());
}
  }

  //get method

  static getProduct() async{  

    List<Product> product =[]; 
    var url = Uri.parse("${baseUrl}get_product");




    try {
  final  res = await http.get(url);
  
  if(res.statusCode == 200){
    
    var data = jsonDecode(res.body);
      
      data['product'].forEach(
        (value)=>{
          product.add(
            Product(name: value['pname'], price: value['pprice'], desc: value['pdesc'], id: value['id'].toString()),
          ),

        }
      );
      return product;
  }else{
   return [];
  }
} on Exception catch (e) {
  print(e.toString());
}
  }


  //update the method 

  static updateProduct(id,body) async{
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url,body: body);

    if(res.statusCode == 200){
      print(jsonDecode(res.body));
    }else{
      print("failed to update data");
    }
  }

  //deleted method

  static deleteProduct(id) async{
    var url = Uri.parse("${baseUrl}delete/$id");

    final res = await http.post(url);
    if(res.statusCode == 204){
      print(jsonDecode(res.body));
    }else{
      print("failed to delete");
    }
  }
}