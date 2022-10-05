import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),

      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: const Text(
                '',

                style: const TextStyle(color: Colors.white, fontSize: 45),
              ),
              height: 100,
              width: 160,

              padding: const EdgeInsets.only(left: 35, top: 30),
              decoration: const BoxDecoration(

                image: DecorationImage(
                    image: const AssetImage('assets/aa.png'),fit: BoxFit.scaleDown),

              ),


            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(


                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(

                        children: [
                          const Center(child: Text("Paranétrage", style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                              fontWeight: FontWeight.bold,
                          ),)),
                          TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                prefixIcon: const Icon(Icons.location_on),
                                filled: true,
                                hintText: "Address IP",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),

                          ),


                          const SizedBox(
                            height: 30,
                          ),

                          const SizedBox(
                            height: 30,

                          ),
                          TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,

                                filled: true,
                                hintText: "Port Numreo",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),

                          ),


                          const SizedBox(
                            height: 30,
                          ),

                          const SizedBox(
                            height: 30,

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               const Text(
                                ' validate',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                           const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Back',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}