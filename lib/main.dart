import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LED_Matrix(),
    );
  }
}

class LED_Matrix extends StatefulWidget {
  const LED_Matrix({super.key});

  @override
  State<LED_Matrix> createState() => _LED_MatrixState();
}

class _LED_MatrixState extends State<LED_Matrix> {
  int num_counter = 0;
  int first_digit = 0;
  int second_digit = 0;

  AppBar _label() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 78, 105, 185),
      titleSpacing: 0.0,
      title: Container(
        width: 500.0,
        height: 500.0,
        child: Center(
            child: Text('CP-SU LED MATRIX',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }

  Widget _arrow({required bool isUpward}) {
    IconData ic = isUpward
        ? Icons.arrow_drop_up_outlined
        : Icons.arrow_drop_down_outlined;

    return InkWell(
      onTap: (){
        setState(() {
          if(isUpward){
            num_counter++;
            if(num_counter >= 99){
              num_counter = 0;
            }
            first_digit = num_counter ~/ 10;
            second_digit = num_counter % 10;
          }else{
            num_counter--;
            if(num_counter <= -1){
              num_counter = 99;
            }
            first_digit = num_counter ~/ 10;
            second_digit = num_counter % 10;
          }
        });
      },
      child: Expanded(
        child: Center(
          child: Container(
            width: 65.0,
            height: 65.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.black,
            ),
            child: Expanded(
              child: Icon(
                ic,
                color: Colors.white,
                size: 55.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _screen() {
    return Container(
      height: 250.0,
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 12.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildDigit(num: first_digit),
        _buildDigit(num: second_digit),
      ]),
    );
  }

  Widget _buildDot({required int dots}){
    return Container(
          width: 17.0,
          height: 17.0,
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dots == 0
                ? Color.fromARGB(255, 58, 54, 54)
                : Colors.lightGreenAccent,
          ),
        );
  }

  Widget _buildRow({required List<int> dots}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < 5; i++)
        _buildDot(dots: dots[i]),
    ]);
  }

  Widget _buildDigit({required int num}) {
    const dotsData = [
      // Digit 0
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 1
      [
        [0, 0, 1, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 1, 1, 0],
      ],
      // Digit 2
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [1, 1, 1, 1, 1],
      ],
      // Digit 3
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 4
      [
        [0, 0, 0, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 1, 0, 1, 0],
        [1, 0, 0, 1, 0],
        [1, 1, 1, 1, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 0, 1, 0],
      ],
      // Digit 5
      [
        [1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 6
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 7
      [
        [1, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0],
      ],
      // Digit 8
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 9
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ]
    ];

    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 7; i++) _buildRow(dots: dotsData[num][i]),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _label(),
      body: Container(
        color: Color.fromARGB(255, 136, 137, 138),
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _arrow(isUpward: true),
            _screen(),
            _arrow(isUpward: false),
          ],
        ),
      ),
    );
  }
}
