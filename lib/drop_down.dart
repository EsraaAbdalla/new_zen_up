// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  // final String backgroundImage;
  // final String title;
  //const DropdownExample({required this.backgroundImage, required this.title});
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? Awareness;
  String? Breathing;
  String? Compassion;
  String? Forgiveness;
  String? Gratitude;
  String? Happiness;

  List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize with no option selected
    Awareness = null;
    Breathing = null;
    Compassion = null;
    Forgiveness = null;
    Gratitude = null;
    Happiness = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage('assets/Group.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: DropdownButton<String>(
                iconSize: 30,
                iconEnabledColor: Colors.white,
                value: Awareness,
                hint: Column(
                  children: const [
                    Text(
                      'Awareness',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 categories',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Awareness = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/Breathing.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: DropdownButton<String>(
                iconSize: 30,
                iconEnabledColor: Colors.white,
                value: Breathing,
                hint: Column(
                  children: const [
                    Text(
                      'Breathing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 categories',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Breathing = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/Compassion.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              // width: MediaQuery.of(context).size.width,

              child: DropdownButton<String>(
                iconSize: 30,

                iconEnabledColor: Colors.white,
                value: Compassion,
                hint: Column(
                  children: const [
                    Text(
                      'Compassion',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 categories',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Compassion = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/Forgiveness.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              // width: MediaQuery.of(context).size.width,

              child: DropdownButton<String>(
                iconSize: 30,

                iconEnabledColor: Colors.white,
                value: Forgiveness,
                hint: Column(
                  children: const [
                    Text(
                      'Forgiveness',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 categories',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Forgiveness = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/Gratitude.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              // width: MediaQuery.of(context).size.width,

              child: DropdownButton<String>(
                iconSize: 30,

                iconEnabledColor: Colors.white,
                value: Gratitude,
                hint: Column(
                  children: const [
                    Text(
                      'Gratitude',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5 categories',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Gratitude = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/Happiness.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              // width: MediaQuery.of(context).size.width,

              child: DropdownButton<String>(
                iconSize: 30,
                iconEnabledColor: Colors.white,
                value: Happiness,
                hint: Column(
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Happiness',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5 categories',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ), // Hint text
                onChanged: (String? newValue) {
                  setState(() {
                    Happiness = newValue;
                  });
                },
                underline: Container(), //remove underline
                isExpanded: true,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
