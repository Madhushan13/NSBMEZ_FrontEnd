import 'package:flutter/material.dart';
//import 'package:flutter_application/Pages/home_page.dart';
//import 'package:flutter_application/Pages/login_page.dart';

const Color kHintTextColor = Colors.grey; // Define the hint text color here

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row (Logo and Text "SEARCH")
                const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                // Second Row (Search Bar and Menu Icon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Search Bar
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 40, 45, 51),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              //ICONNNN
                              IconButton(
                                icon: const Icon(Icons.search),
                                color: const Color.fromARGB(255, 25, 240, 6),
                                onPressed: () {
                                  //LINK HEREEEEEEEEEEEEEEEE
                                },
                              ),
                              const Expanded(
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors
                                        .black, // Customize the font color of the user-entered text
                                  ),
                                  decoration: InputDecoration(
                                    hintText:
                                        'S e a r c h   H e r e  . . . . . .',
                                    hintStyle: TextStyle(
                                      color:
                                          kHintTextColor, // Use the constant color for hint text
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Menu Icon
                      Padding(
                        padding: const EdgeInsets.only(right: 6, left: 0),
                        child: IconButton(
                          iconSize: 40,
                          icon: const Icon(Icons.menu),
                          color: const Color.fromARGB(255, 12, 12, 12),
                          onPressed: () {
                            // Handle the menu button press here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Year 1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Year 2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Year 3")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Year 4")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Semester 1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Semester 2")),
                  ),
                ],
              ),
              //adding space
              const SizedBox(
                height: 30,
              ),
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Module Code',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('module',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Result',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Center(child: Text('1'))),
                    DataCell(Center(child: Text('ss'))),
                    DataCell(Center(child: Text('ss'))),
                  ]),
                  DataRow(cells: [
                    DataCell(Center(child: Text('1'))),
                    DataCell(Center(child: Text('ss'))),
                    DataCell(Center(child: Text('ss'))),
                  ]),
                  DataRow(cells: [
                    DataCell(Center(child: Text('1'))),
                    DataCell(Center(child: Text('ss'))),
                    DataCell(Center(child: Text('ss'))),
                  ]),
                  DataRow(cells: [
                    DataCell(Center(child: Text('1'))),
                    DataCell(Center(child: Text('ss'))),
                    DataCell(Center(child: Text('ss'))),
                  ]),
                  DataRow(cells: [
                    DataCell(Center(child: Text('1'))),
                    DataCell(Center(child: Text('ss'))),
                    DataCell(Center(child: Text('ss'))),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
