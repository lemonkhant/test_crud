import 'package:flutter/material.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/service/api.dart';

class Deletecreen extends StatefulWidget {
  const Deletecreen({super.key});

  @override
  State<Deletecreen> createState() => _DeletecreenState();
}

class _DeletecreenState extends State<Deletecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Operation"),
      ),
      body: FutureBuilder(
        
        future: Api.getProduct(),
         builder: (BuildContext context,
         AsyncSnapshot snapshot
         ){
          if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
           List<Product> pdata =snapshot.data;

           return ListView.builder(
              itemCount: pdata.length,
              itemBuilder:(BuildContext context, int index){
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].desc}"),
                  trailing: IconButton(onPressed: () async{
                    await Api.deleteProduct(pdata[index].id);
                    pdata.removeAt(index);
                    setState(() {});

                  }, 
                  icon: const Icon(Icons.delete)),
                );
              } );


        }
         }
         
         ),
    );
  }
}