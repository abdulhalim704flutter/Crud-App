import 'package:crud_app/Rest%20API/RestClient.dart';
import 'package:crud_app/Screen/ProductCreateScreen.dart';
import 'package:crud_app/Screen/ProductUpdateScreen.dart';
import 'package:crud_app/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    Loading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItems(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete!'),
            content: Text("Once Delete You can't Back This Data"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    await ProductDeleteRequest(id);
                    await CallData();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          );
        });
  }

  GotoUpdate(context, productItem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (builder) => ProductUpdateScreen(productItem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : RefreshIndicator(
                    onRefresh: () async {
                      await CallData();
                    },
                    child: GridView.builder(
                        gridDelegate: ProductGridViewStyle(),
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    ProductList[index]['Img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(ProductList[index]['ProductName']),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text("Price: " +
                                          ProductList[index]['TotalPrice'] +
                                          " BDT"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                GotoUpdate(context,
                                                    ProductList[index]);
                                              },
                                              child: Icon(
                                                CupertinoIcons
                                                    .ellipsis_vertical_circle,
                                                size: 18,
                                                color: colorGreen,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                DeleteItems(
                                                    ProductList[index]['_id']);
                                              },
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 18,
                                                color: colorRed,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ProductCreateScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
