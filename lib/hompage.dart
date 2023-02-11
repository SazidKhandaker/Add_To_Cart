import 'package:addcart/modelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    subtotal;
    super.initState();
  }

  var object = modelclass.getdata();
  var deliverycharge = 60;
  var subtotal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(width: 3, color: Colors.black)),
          child: Column(children: [
            Text(
              "Delivery --------------------------------- ${deliverycharge}",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  subtotal = object[0].totalprice +
                      object[1].totalprice +
                      object[2].totalprice +
                      object[3].totalprice +
                      deliverycharge;

                  print(subtotal);
                });
              },
              child: Text(
                "Buy now",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Total-------------------------------------${subtotal}",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ]),
        ),
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add to cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: object.length,
                    itemBuilder: (context, index) {
                      var mylist = object[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10, left: 5, right: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(offset: Offset(1, 1), blurRadius: 2),
                              BoxShadow(offset: Offset(-1, -1), blurRadius: 2),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width:
                                    MediaQuery.of(context).size.width * 0.400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(mylist.photo),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "${mylist.name}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "images/star.svg",
                                            height: 30,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${mylist.rating}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.grey
                                                    .withOpacity(0.7)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SvgPicture.asset(
                                            "images/map-pin.svg",
                                            height: 35,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${mylist.distance}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.grey
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${mylist.quantity == 0 ? mylist.price : mylist.totalprice}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                if (mylist.quantity > 0) {
                                                  mylist.quantity--;
                                                  var mylistquantity =
                                                      mylist.quantity;
                                                  var price = mylist.price;

                                                  mylist.totalprice =
                                                      price * mylistquantity;
                                                }
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.horizontal_rule_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${mylist.quantity}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                mylist.quantity++;
                                                var quantity = mylist.quantity;
                                                var price =
                                                    mylist.price * quantity;

                                                mylist.totalprice = price;

                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))),
      ),
    );
  }
}
