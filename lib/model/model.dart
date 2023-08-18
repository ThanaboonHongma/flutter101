import 'package:flutter/material.dart';

class MyModelList extends StatelessWidget {
  final String title;
  final String description;
  final String img;
  const MyModelList(
      {super.key,
      required this.title,
      required this.description,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0, // Soften the shaodw
              spreadRadius: 2.0,
              offset: Offset(0.0, 0.0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 45, 241, 110),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.network(img)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 253, 0, 0)),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () {print('object');},
                              child: const Text('Add to Cart')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
