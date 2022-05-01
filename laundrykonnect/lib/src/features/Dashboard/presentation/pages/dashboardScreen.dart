// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/core/constants/widgetFunctions.dart';
import 'package:laundrykonnect/src/features/Dashboard/presentation/pages/viewAll.dart';

import '../../../../../core/components/appBar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic> data = {
    "name": "Laundry Konnect",
    "address": "Kathmandu, Nepal",
    "phone": "+977-9876543210",
    "email": "",
    "image": "assets/images/logo.png",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: appBar('Dashboard', true),
      body: Scrollbar(
        thickness: 6,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kBACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Welcome, ',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AZURE,
                          ),
                        ),
                        addVertical(10),
                        Text(
                          'Dr. Ben Kwofie',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AZURE,
                          ),
                        ),
                      ],
                    ),
                    addVertical(10),
                    Text(
                      'Your laundry is our priority...',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              addVertical(10),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addHeaderText('Your Orders'),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ViewAllScreen(),
                                  ),
                                ),
                                child: addSubText(
                                  'View All',
                                  color: kSecondColor,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 0.75),
                        addVertical(10),
                        ordersGrid(context),
                        addVertical(20),
                        addHeaderText('Services'),
                        const Divider(thickness: 0.75),
                        addVertical(10),
                        servicesGrid(context),
                      ],
                    ),
                  ),
                  addVertical(10),
                  // addHeaderText('HELLO'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox ordersGrid(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            // padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Card(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.asset('assets/images/shirts.png'),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: addHeaderTextWithStyle(
                        'Your Laundry',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AZURE,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return addHorizontal(10);
        },
      ),
    );
  }

  Expanded servicesGrid(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Card(
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/washing-machine.png',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: addSubText(
                          'sleep',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AZURE,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.325,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
