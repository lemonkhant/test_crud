import 'package:flutter/material.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/service/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: Api.getProduct(), 
      
      builder:(BuildContext context,AsyncSnapshot snapshot){
  
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{

          List<Product> pdata =snapshot.data;

          print(pdata);
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder:(BuildContext context, int index){
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].desc}"),
                  trailing: Text("${pdata[index].price}"),
                );
              } );
        }
      }
      ));

  }
}