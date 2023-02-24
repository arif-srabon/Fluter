import 'dart:convert';

import 'package:counter_app/Model/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductListModel productListModel = ProductListModel();
  Client httpClient = Client();
  bool dataLoadingInProgress = false;

  Future<void> getProductListFromApi() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    dataLoadingInProgress = true;
    setState(() {});
    Response response = await httpClient.get(uri);
    // print(response.body);
    productListModel =
        ProductListModel.setProductList(jsonDecode(response.body));
    // print(productListModel.status);
    // print(productListModel.productList?.length ?? 0);
    dataLoadingInProgress = false;
    setState(() {});
  }

  initState() {
    super.initState();
    getProductListFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: dataLoadingInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: productListModel.productList?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 15, // 15%
                          child: Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.network(
                                    '${productListModel.productList?[index].image}')
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 60, // 60%
                          child: Container(
                            margin: EdgeInsets.all(10),
                            // color: Colors.green,
                            // alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Text(productListModel.productList?[index].title ??
                                    'Unknown'),
                                Text('Brand: ${productListModel.productList?[index].brand}'),
                                Text('Star: ${productListModel.productList?[index].star}'),
                                Text('${productListModel.productList?[index].price}/Unit'),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 25, // 25%
                          child: Container(
                            // color: Colors.pink,
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                ElevatedButton(onPressed: (){}, child: Icon(Icons.edit)),
                                ElevatedButton(onPressed: (){}, child: Icon(Icons.delete))
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              }),
    );
  }
}
