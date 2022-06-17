// ignore_for_file: file_names, void_checks

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/components/appBar.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/core/constants/widgetFunctions.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key, this.showBefore}) : super(key: key);

  final bool showBefore;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState(showBefore);
}

class _HistoryScreenState extends State<HistoryScreen> {
  final bool showBefore;
  _HistoryScreenState(this.showBefore);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: showBefore == false
          ? appBarNoLogo('Order History', true, Colors.transparent,
              context: context)
          : appBarNoLogo('Order History', true, Colors.black, context: context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.135,
              // padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * .45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVertical(10),
                            Row(
                              children: [
                                Image.asset("assets/images/logo.png",
                                    height: 50),
                                addHorizontal(15),
                                addHeaderText('Order Details'),
                              ],
                            ),
                            const Divider(thickness: .45),
                            addVertical(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addSubText('Order ID:'),
                                    addHorizontal(15),
                                    addHeaderText('2608'),
                                  ],
                                ),
                                addHorizontal(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    addSubText('Order Type:'),
                                    addHorizontal(15),
                                    addHeaderText('Bulk Washing'),
                                  ],
                                ),
                              ],
                            ),
                            addVertical(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addSubText('Date'),
                                    addHorizontal(15),
                                    addHeaderText('26/06/2022'),
                                  ],
                                ),
                                addHorizontal(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    addSubText('Qty of Items:'),
                                    addHorizontal(15),
                                    addHeaderText('20'),
                                  ],
                                ),
                              ],
                            ),
                            addVertical(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addSubText('Amount to Pay'),
                                    addHorizontal(15),
                                    addHeaderText('GH¢ 75.5Op'),
                                  ],
                                ),
                                addHorizontal(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    addSubText(
                                        'Total Amount\n (Including Tax)'),
                                    addHorizontal(15),
                                    addHeaderText('GH¢ 100.00P'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(15),
                      child: const Icon(
                        Icons.history,
                        color: kSecondColor,
                        size: 30,
                      ),
                    ),
                    title: addSubText("27887"),
                    subtitle: addHeaderTextWithStyle('Order Number'),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return addVertical(5);
          },
        ),
      ),
    );
  }
}
