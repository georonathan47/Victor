// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/core/constants/widgetFunctions.dart';
import 'package:laundrykonnect/src/features/Dashboard/presentation/pages/viewAll.dart';
import 'package:laundrykonnect/src/features/History/presentation/pages/history.dart';

import '../../../../../core/components/appBar.dart';

class DashboardScreen extends StatefulWidget {
  final String name;
  const DashboardScreen({Key key, this.name}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Orders> data = const [
    Orders(
      image: 'assets/images/2.jpeg',
      title: 'Ironing',
    ),
    // Orders(
    //   image: 'assets/images/1.webp',
    //   title: 'Washing',
    // ),
    Orders(
      image: 'assets/images/4.jpeg',
      title: 'Washing',
    ),
    Orders(
      image: 'assets/images/4.jpeg',
      title: 'Washing',
    ),
    Orders(
      image: 'assets/images/laundry.png',
      title: 'Dry Cleaning',
    ),
    Orders(
      image: 'assets/images/laundry.png',
      title: 'Dry Cleaning',
    ),
    Orders(
      image: 'assets/images/laundry.png',
      title: 'Dry Cleaning',
    ),
  ];

  List<Services> services = const [
    Services(
      image: 'assets/images/4.jpeg',
      title: 'Washing',
    ),
    Services(
      image: 'assets/images/2.jpeg',
      title: 'Ironing',
    ),
    Services(
      image: 'assets/images/newImage.jpeg',
      title: 'Dry Cleaning',
    ),
    Services(
      image: 'assets/images/laundry1.jpeg',
      title: 'Bulk Washing',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: appBar('Dashboard', true, true),
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
                          widget.name,
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
                            vertical: 4.5,
                            horizontal: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addHeaderText('Your Orders'),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HistoryScreen(
                                      showBefore: true,
                                    ),
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
        itemCount: 3,
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
                    Center(child: Image.asset(data[index].image)),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: addHeaderTextWithStyle(
                        data[index].title,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
                      Image.asset(services[index].image),
                      Align(
                        alignment: Alignment.topRight,
                        child: addSubText(
                          services[index].title,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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

class Services {
  final String image;
  final String title;

  const Services({
    this.image,
    this.title,
  });
}

class Orders {
  final String image;
  final String title;

  const Orders({
    this.image,
    this.title,
  });
}
