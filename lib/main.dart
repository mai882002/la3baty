import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('images/background.png'), // ضع مسار الصورة هنا
                fit: BoxFit.fill, // لضبط الصورة لتملأ الشاشة بالكامل
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent, // لتجنب تغطية الصورة بالخلفية
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Image Matching',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Sevillana',
                  ),
                ),
              ),
              backgroundColor: Colors.black,
            ),
            body: Imagepage(),
          ),
        ],
      ),
    ),
  ));
}

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;
  void changeImage() {
    rightImageNumber = Random().nextInt(8) + 1;
    leftImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'Congratulations' : 'Try again',
          style: TextStyle(
            fontFamily: 'ArchivoBlack',
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 219, 131, 131),
          ),
        ),
        SizedBox(
          height: 200.0,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('images/image-$leftImageNumber.png'),
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/image-$rightImageNumber.png'),
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
