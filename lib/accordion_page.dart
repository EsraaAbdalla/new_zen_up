// ignore_for_file: library_private_types_in_public_api, prefer_const_declarations, use_full_hex_values_for_flutter_colors, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, unnecessary_cast

import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'audio_ready.dart';

List<Map<String, dynamic>> updatedList = [];

class YourObject {
  String categoryName;
  String id;
  String AudioName;

  YourObject(
      {required this.categoryName, required this.id, required this.AudioName});

  Map<String, dynamic> toJson() {
    return {'categoryName': categoryName, '_id': id, 'name': AudioName};
  }
}

List<Map<String, dynamic>> updateListWithCategory(
    YourObject newObject, List<Map<String, dynamic>> selected) {
  int index = selected.indexWhere(
      (element) => element['categoryName'] == newObject.categoryName);

  if (index != -1) {
    // Replace the existing object with the new one
    selected[index] =
        newObject.toJson(); // Assuming YourObject has a toJson method
  } else {
    // If the category name doesn't exist, add the new object
    selected.add(newObject.toJson());
  }

  return selected;
}

Color getCategoryBackgroundColor(String category) {
  // Logic to determine the background color based on the category
  if (category == 'awareness') {
    return const Color(0XFFFFF3B3B);
  } else if (category == 'breathing') {
    return const Color(0XFFF0DCA91);
  } else if (category == 'compassion') {
    return const Color(0XFFFFFD541);
  } else if (category == 'forgiveness') {
    return const Color(0XFFFFB6F20);
  } else if (category == 'gratitude') {
    return const Color(0XFFF441DFC);
  } else {
    return const Color(0XFFF9D86FF);
  }
}

Map<String, dynamic> audios = {};
Future<Map<String, dynamic>> fetchAudiosByCategory(String categoryName) async {
  final String baseUrl = 'https://meditation-0gig.onrender.com';
  final response =
      await http.get(Uri.parse('$baseUrl/getAudiosByCat/$categoryName'));

  if (response.statusCode == 200) {
    // print(categoryName);
    // print(response.body); // Print the entire response body
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data from the API');
  }
}

/// Main example page
class AccordionPage extends StatefulWidget //__
{
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999),
      fontSize: 14,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis);
  static const List<String> categoryNames = [
    'awareness',
    'breathing',
    'compassion',
    'forgiveness',
    'gratitude',
    'happiness',
  ];
  final List<Map<String, dynamic>> selected;
  const AccordionPage({super.key, required this.selected});

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  void updateSelected(String categoryName, int? selectedIndex) {
    setState(() {
      if (selectedIndex != null) {
        // Add the selected item to the list
        widget.selected.add(audios[categoryName][selectedIndex]);
      } else {
        // Remove the unselected item from the list
        widget.selected
            .removeWhere((item) => item['categoryName'] == categoryName);
      }
    });
  }

  bool showPriceColumn = true;
  @override
  build(context) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Accordion(
                paddingListHorizontal: 15,
                headerBorderColorOpened: Colors.transparent,
                contentBackgroundColor: Colors.white,
                contentBorderWidth: 3,
                contentHorizontalPadding: 20,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  for (final category in AccordionPage.categoryNames)
                    AccordionSection(
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      headerBackgroundColor:
                          getCategoryBackgroundColor(category),
                      contentBorderColor: getCategoryBackgroundColor(category),
                      headerBackgroundColorOpened:
                          getCategoryBackgroundColor(category),
                      headerBorderColor: getCategoryBackgroundColor(category),
                      onOpenSection: () async {
                        audios = await fetchAudiosByCategory(category);
                      },
                      isOpen: false,
                      header: Container(
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                category
                                    .toUpperCase(), // Assuming you have a capitalize method
                                style: AccordionPage.headerStyle
                                    .copyWith(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "5 categories",
                                style: AccordionPage.contentStyle
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      content: MyDataTable(
                        dataFuture: fetchAudiosByCategory(category),
                        selected: widget.selected,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Ink(
                  //  width: ,1
                  height: 70,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioReady(
                                  listOfAudios: updatedList,
                                )),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.purpleAccent,
                            size: 17,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class MyDataTable extends StatefulWidget {
  final Future<Map<String, dynamic>> dataFuture;
  final List<Map<String, dynamic>> selected;

  const MyDataTable(
      {Key? key, required this.dataFuture, required this.selected})
      : super(key: key);

  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  Map<String, int?> selectedRows = {};
  RegExp pattern = RegExp(r'[._-]');

  double responsiveTextSize(double percentage, BuildContext context) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dataFuture,
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final data = snapshot.data?['Audios'];
          if (data == null || data.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }
          return DataTable(
            sortAscending: true,
            sortColumnIndex: 1,
            showBottomBorder: false,
            columns: const [
              DataColumn(
                label: Text(
                  'Name',
                  style: AccordionPage.contentStyleHeader,
                ),
                numeric: false,
              ),
              DataColumn(
                label: Text(
                  'Select',
                  style: AccordionPage.contentStyleHeader,
                ),
                numeric: true,
              ),
            ],
            rows: List<DataRow>.generate(
              data.length,
              (index) {
                final item = data[index];
                final ID = item['_id'];
                final categoryName = item['categoryName'];
                final audioName = item['name'].toString();
                final isSelected = widget.selected.any((selectedItem) =>
                    audioName.toLowerCase() ==
                    selectedItem['name'].toString().toLowerCase());

                return DataRow(
                  selected: selectedRows[categoryName] == index,
                  cells: [
                    DataCell(
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: responsiveTextSize(200, context)),
                        child: Text(
                          audioName.replaceAll(pattern, ' '),
                          style: AccordionPage.contentStyle,
                          maxLines: 3,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(
                      Radio(
                        value: isSelected ? null : index,
                        groupValue: selectedRows[categoryName],
                        onChanged: (value) {
                          setState(() {
                            YourObject newCategoryObject = YourObject(
                                categoryName: categoryName,
                                id: ID,
                                AudioName: audioName);
                            updatedList = updateListWithCategory(
                                newCategoryObject, widget.selected);

                            print(updatedList);
                            selectedRows[categoryName] =
                                value as int?; // Change to int? if needed
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
