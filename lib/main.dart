import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_test2/widgets/searchField_widget.dart';
import 'package:dio/dio.dart';
import 'package:api_test2/api_models/get_apimodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:api_test2/addScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//   //ListView
//   List<String> list1_images = [
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//   ];

//   List<String> list1_title = [
//     'Beats',
//     'BeatsBeats',
//     'Beats',
//     'BeatsBeats',
//   ];
// //GridView
//   List<String> list2_images = [
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//     "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/64576906-013d-4af9-828a-fc3c69482a8a_288x.png?v=1625046144",
//   ];
//   List<String> list2_title = [
//     'Beats',
//     'BeatsBeats',
//     'Beats',
//     'BeatsBeats',
//   ];
//   List<String> list2_price = [
//     '\$249.95',
//     '\$249.95',
//     '\$249.95',
//     '\$249.95',
//   ];
//Api_Model
  bool _loader = false;
  GetPostapi? getPostapi_model;

  void getApi() async {
    try {
      var responce = await Dio()
          .get("http://jayanthi10.pythonanywhere.com/api/v1/brands/");
      setState(() {
        getPostapi_model = getPostapiFromJson(jsonEncode(responce.data));
        print("${responce.data}");
      });
    } catch (e) {
      setState(() {});
      print(e);
    }
  }

  @override
  void initState() {
    _loader = true;
    // TODO: implement initState
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.format_list_bulleted,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(
                      Icons.all_inclusive,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Icon(
                      Icons.qr_code_scanner,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Search_Field(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text("Choose brand",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                    ),
                    InkWell(
                      child: Text("See All",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff121212))),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return ();
                        // }));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                getPostapi_model == null
                    ? CircularProgressIndicator()
                    : Container(
                        width: 400,
                        height: 175,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: getPostapi_model!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(255, 235, 240, 240),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Center(
                                        child: InkWell(
                                          child: Image.network(
                                            'http://jayanthi10.pythonanywhere.com${getPostapi_model!.data![index].brandImage}',
                                            width: 131,
                                            height: 100,
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      InkWell(
                                        child: Text(
                                            '${getPostapi_model!.data![index].brandName}',
                                            style: GoogleFonts.inter(
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff121212))),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 5,
                                height: 20,
                              );
                            }),
                      ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text("Popular",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Text("Discount",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45)),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return ();
                        // }));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Text("Exclusive",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45)),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return ();
                        // }));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Text("Add Product",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return add_Product();
                        }));
                      },
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 2,
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       height: 8,
                //       width: 8,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           color: Colors.blue),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                getPostapi_model == null
                    ? CircularProgressIndicator()
                    : Container(
                        height: 350,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: getPostapi_model!.brandProducts!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 5 / 6,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: InkWell(
                                        child: Image.network(
                                          'http://jayanthi10.pythonanywhere.com${getPostapi_model!.brandProducts![index].productImage}',
                                          width: 131,
                                          height: 100,
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    InkWell(
                                      child: Text(
                                          '${getPostapi_model!.brandProducts![index].productName}',
                                          style: GoogleFonts.inter(
                                              decoration: TextDecoration.none,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54)),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    InkWell(
                                      child: Text(
                                          '${getPostapi_model!.brandProducts![index].description}',
                                          style: GoogleFonts.inter(
                                              decoration: TextDecoration.none,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    InkWell(
                                      child: Text(
                                          '${getPostapi_model!.brandProducts![index].price}',
                                          style: GoogleFonts.inter(
                                              decoration: TextDecoration.none,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ]),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
