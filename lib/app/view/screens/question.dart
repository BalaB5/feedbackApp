import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int? _selectedOption; // Change the type to int

  List<Map<String, dynamic>> quizData = [
    {
      'question':
          'Lorem ipsum dolor si amit,consectetur adipiscing elit.Nulla vitae facilisis ante.Phasellus aliquet mattis pulvinar.Pellentesque semper massa quam, at consequat sem gravida at.Quisque hendrerit urna at scelerisque tempor.Nunc dapibus lorem metus,ut pellentesque nisi dignissim ut?',
      'options': [
        'Very Satisfied',
        'Satisfied',
        'Neutral',
        'Dissatisfied',
        'Very Dissatisfied'
      ],
      'correctAnswer': 'Very Satisfied',
    },
  ];

  void _handleOptionChange(int? value) {
    // Change the type to int
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Form'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Survey Question 1",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quizData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0), // Add padding for spacing
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          quizData[index]['question'],
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Column(
                        children: List<Widget>.generate(
                          quizData[index]['options'].length,
                          (i) {
                            return RadioListTile(
                              title: Text(quizData[index]['options'][i]),
                              value: i,
                              groupValue: _selectedOption,
                              onChanged: _handleOptionChange,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Check answers when the user submits
                for (int i = 0; i < quizData.length; i++) {
                  if (_selectedOption == null ||
                      _selectedOption !=
                          quizData[i]['options']
                              .indexOf(quizData[i]['correctAnswer'])) {
                    // Handle incorrect answers here
                    print('Question ${i + 1}: Incorrect');
                  } else {
                    // Handle correct answers here
                    print('Question ${i + 1}: Correct');
                  }
                }
              },
              child: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }
}
