
import 'dart:core';

import 'package:flutter/material.dart';

class BodyComponent extends StatefulWidget {
  const BodyComponent({super.key, required this.title});

  final String title;

  @override
  State<BodyComponent> createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  int currentImage = 0;

  int selectedImage = 0;
  
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            margin: const EdgeInsets.all(50),
            constraints: const BoxConstraints(maxHeight: double.infinity),
            child: changed == false ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: SizedBox(
                    width: 100, height: 100,
                    child: Center(
                      child: Text(
                        currentImage.toString(),
                        style: const TextStyle(fontSize: 40),
                  ),
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 450),
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GridView.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: [

                              for (var i = 1; i < 10; i++) SizedBox(
                                width: 50,
                                height: 40,
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedImage = i;
                                      currentImage = i;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: selectedImage == i ? Colors.blue : Colors.black, width: 3),
                                      color: selectedImage == i ? Colors.blue : Colors.black,
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                      ]
                                    ),
                                      child: Center(
                                        child: Text(i.toString(), textAlign: TextAlign.center, style: const TextStyle(
                                            color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                        )
                                      ),
                                    ),
                                ),
                              ),
                              Container(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedImage = 0;
                                            currentImage = 0;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                          border: Border.all(color: selectedImage == 0 ? Colors.blue : Colors.black, width: 3),
                                          color: selectedImage == 0 ? Colors.blue : Colors.black,
                                          borderRadius: const BorderRadius.all(Radius.circular(20))
                                          ),

                                          child: const Center(
                                              child: Text("0", textAlign: TextAlign.center, style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(),
                            ],

                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ) : Row(
              children: [
                Expanded(child: SizedBox(
                  width: 100, height: 100,
                  child: Center(
                    child: Text(
                      currentImage.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                  ),
                ),)
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: const Icon(Icons.image),
            onPressed: () {
          setState(() {
            changed = !changed;
          });
        }),
      ),
    );
  }
}