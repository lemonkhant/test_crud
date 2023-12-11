
import 'package:flutter/material.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/service/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;

  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Edit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name here",
              ),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: "Price here",
              ),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                hintText: "desc here",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Api.updateProduct(widget.data.id,{
                "pname" : nameController.text.toString(),
                "pdesc" : descController.text,
                "pprice" : priceController.text,
                "id" : widget.data.id
              });
            }, child: Text("Update data"))
          ],
        ),
      ),
    );
    
  }
}