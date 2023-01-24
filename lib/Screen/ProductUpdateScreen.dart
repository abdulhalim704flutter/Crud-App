import 'package:crud_app/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/Rest%20API/RestClient.dart';
import 'package:crud_app/Style/style.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool loading = false;

  @override
  void initState() {
    setState(() {
      FormValues.update('Img', (value) => widget.productItem['Img']);
      FormValues.update(
          'ProductCode', (value) => widget.productItem['ProductCode']);
      FormValues.update(
          'ProductName', (value) => widget.productItem['ProductName']);
      FormValues.update('Qty', (value) => widget.productItem['Qty']);
      FormValues.update(
          'TotalPrice', (value) => widget.productItem['TotalPrice']);
      FormValues.update(
          'UnitPrice', (value) => widget.productItem['UnitPrice']);
    });
  }

  InputOnChange(Mapkey, Textvalue) {
    //Form Data Update
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    //Form Validation
    if (FormValues['Img']!.length == 0) {
      ErrorToast("Image Link Required");
    } else if (FormValues['ProductCode']!.length == 0) {
      ErrorToast("Product Code Required");
    } else if (FormValues['ProductName']!.length == 0) {
      ErrorToast("Product Name Required");
    } else if (FormValues['Qty']!.length == 0) {
      ErrorToast("Qty Required");
    } else if (FormValues['TotalPrice']!.length == 0) {
      ErrorToast("Total Price Required");
    } else if (FormValues['UnitPrice']!.length == 0) {
      ErrorToast("Unit Price Required");
    } else {
      //Rest Api.....push
      setState(() {
        loading = true;
      });
      await ProductUpdateReuest(FormValues, widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ProductGridViewScreen()),
          (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Product',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: loading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: FormValues['ProductName'],
                          onChanged: (Textvalue) {
                            InputOnChange('ProductName', Textvalue);
                          },
                          decoration: AppInputDecoration('Product Name'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: FormValues['ProductCode'],
                          onChanged: (Textvalue) {
                            InputOnChange('ProductCode', Textvalue);
                          },
                          decoration: AppInputDecoration('Product Code'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: FormValues['Img'],
                          onChanged: (Textvalue) {
                            InputOnChange('Img', Textvalue);
                          },
                          decoration: AppInputDecoration('Product Image'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: FormValues['UnitPrice'],
                          onChanged: (Textvalue) {
                            InputOnChange('UnitPrice', Textvalue);
                          },
                          decoration: AppInputDecoration('Unit Price'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: FormValues['TotalPrice'],
                          onChanged: (Textvalue) {
                            InputOnChange('TotalPrice', Textvalue);
                          },
                          decoration: AppInputDecoration('Total Price'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppDropdownStyle(
                          DropdownButton(
                            value: FormValues["Qty"],
                            items: [
                              DropdownMenuItem(
                                child: Text('Select Qt'),
                                value: '',
                              ),
                              DropdownMenuItem(
                                child: Text('1 pcs'),
                                value: '1 pcs',
                              ),
                              DropdownMenuItem(
                                child: Text('2 pcs'),
                                value: '2 pcs',
                              ),
                              DropdownMenuItem(
                                child: Text('3 pcs'),
                                value: '3 pcs',
                              ),
                              DropdownMenuItem(
                                child: Text('4 pcs'),
                                value: '4 pcs',
                              ),
                            ],
                            onChanged: (Textvalue) {
                              InputOnChange('Qty', Textvalue);
                            },
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FormOnSubmit();
                          },
                          child: SuccessButtonChild('Submit'),
                          style: AppButtonStyle(),
                        ),
                      ],
                    ),
                  )),
          )
        ],
      ),
    );
  }
}
