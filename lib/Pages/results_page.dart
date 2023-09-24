import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/sendmail.dart';
import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';
//import 'package:flutter_application/Pages/home_page.dart';
//import 'package:flutter_application/Pages/login_page.dart';

const Color kHintTextColor = Colors.grey; // Define the hint text color here

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int selectedYear = 1;
  int selectedSemester = 1;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 80,
        actions: [
          Builder(
            builder: (context) => IconButton(
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/NSBMEZ Black.png',
              height: 100,
              width: 150,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white, // Change the background color as needed
          child: Column(
            children: [
              Image.asset(
                'assets/images/NSBMEZ Black.png',
                height: 100,
                width: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(Icons.support_agent),
                title: const Text('Student Support'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SendMail(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                },
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to the settings page
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  child: Image.asset(
                    'assets/images/rectangle-17-bg-Rf7.png',
                    height: 80,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                const Text(
                  'Results ',
                  style: TextStyle(
                    fontSize: 28, // Adjust font size as needed
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: Colors.white, // Change text color if needed
                    shadows: [
                      Shadow(
                        color: Colors.black, // Color of the shadow
                        offset: Offset(0, 5), // Offset of the shadow
                        blurRadius: 100, // Blur radius of the shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int year = 1; year <= 4; year++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedYear = year;
                          pageController.jumpToPage(0);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedYear == year
                            ? const Color(0xFF264F44)
                            : Colors.grey,
                      ),
                      child: Text("Year $year"),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int semester = 1; semester <= 2; semester++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedSemester = semester;
                          pageController.jumpToPage(0);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedSemester == semester
                            ? const Color(0xFF264F44)
                            : Colors.grey,
                      ),
                      child: Text("Semester $semester"),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  // Create a widget for each table you want to display
                  ResultsTable(
                      selectedYear: selectedYear,
                      selectedSemester: selectedSemester),
                  // Add more tables here for different combinations of year and semester
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3, // Set the correct index for EventsPage
        onTap: (index) {
          // Handle bottom navigation bar tap event
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatDialog()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      ),
    ));
  }
}

// Create a widget for your results table
class ResultsTable extends StatelessWidget {
  final int selectedYear;
  final int selectedSemester;

  ResultsTable({required this.selectedYear, required this.selectedSemester});

  @override
  Widget build(BuildContext context) {
    // Define the data for all 8 data tables here
    List<DataTable> tables = [
      // Year 1, Semester 1
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('MAD'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('MAD'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('MAD'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('MAD'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('MAD'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 2, Semester 1
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('DBMS'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('DBMS'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('DBMS'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('DBMS'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('DBMS'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 3, Semester 1
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('SAD'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('SAD'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('SAD'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('SAD'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('SAD'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 4, Semester 1
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('ADBMS'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('ADBMS'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('ADBMS'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('ADBMS'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('ADBMS'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 1, Semester 2
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('Crypto'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('Crypto'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('Crypto'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('Crypto'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('Crypto'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 2, Semester 2
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('IAS'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('IAS'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('IAS'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('IAS'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('IAS'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 3, Semester 2
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('ASR'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('ASR'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('ASR'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('ASR'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('ASR'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
      // Year 4, Semester 2
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Module Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text('101.2'))),
            DataCell(Center(child: Text('Wireless'))),
            DataCell(Center(child: Text('A'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('102.2'))),
            DataCell(Center(child: Text('Wireless'))),
            DataCell(Center(child: Text('B'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('103.2'))),
            DataCell(Center(child: Text('Wireless'))),
            DataCell(Center(child: Text('C'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('104.2'))),
            DataCell(Center(child: Text('Wireless'))),
            DataCell(Center(child: Text('D'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('105.2'))),
            DataCell(Center(child: Text('Wireless'))),
            DataCell(Center(child: Text('E'))),
          ]),
          // Add more rows as needed
        ],
      ),
    ];

    // Determine the index of the selected table based on the year and semester
    int tableIndex = (selectedYear - 1) * 2 + selectedSemester - 1;

    return tables[tableIndex];
  }
}
