import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../business_logic/data/data_interacter.dart';
import '../../business_logic/models/question.dart';
import '../theme/style.dart';
import 'review_screen.dart';
import 'welcome_screen.dart';

class TabScreen extends StatefulWidget {
  static const route = '/home';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [
    WelcomeScreen(),
    ReviewScreen(),
  ];

  List<QuestionData> storedQuestions = [];

  static const _reviewIndex = 1;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FBLA Lexicon'),
        automaticallyImplyLeading: false,
        actions: [
          if (_selectedPageIndex == _reviewIndex)
            IconButton(
              icon: Icon(
                Icons.delete,
                color: fblaRed,
              ),
              tooltip: 'Clear Data',
              onPressed: () async {
                await showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                          'Are you sure you want to delete your data?'),
                      content: const Text(
                        'Deleting your data is permanent. This action can not be undone',
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text('No, Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'You Have Cancelled Deleting Your Data'),
                                duration: const Duration(milliseconds: 2500),
                                backgroundColor: correctColor,
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Yes, I am sure'),
                          onPressed: () async {
                            storedQuestions =
                                (await clearAnsweredQuestionData) ?? [];
                            setState(() {
                              _pages[_reviewIndex] = ReviewScreen();
                            });
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      if (storedQuestions != null &&
                                          storedQuestions.length > 0)
                                        writeAnsweredQuestion(storedQuestions
                                            ?.toAnsweredQuestionList);
                                    });
                                  },
                                  textColor: fblaBlue,
                                ),
                                content:
                                    const Text('Your data has been deleted'),
                                duration: const Duration(milliseconds: 2500),
                                backgroundColor: fblaRed,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return fblaRed;
                                return fblaRed.withOpacity(0.9);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          if (_selectedPageIndex == _reviewIndex)
            IconButton(
              icon: Icon(Icons.print),
              color: Colors.white,
              tooltip: 'Print the Review',
              onPressed: () async {
                await Printing.layoutPdf(
                  onLayout: (format) async {
                    final pdf = pw.Document();
                    pdf.addPage(
                      pw.Page(
                        pageFormat: format,
                        build: (context) => pw.Placeholder(),
                      ),
                    );
                    return pdf.save();
                  },
                );
              },
            ),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Play Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Review',
            ),
          ]),
    );
  }
}
