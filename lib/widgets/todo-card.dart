// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final int index;
  final Function delete;
  const Todecard(
      {super.key,
      required this.vartitle,
      required this.changeStatus,
      required this.index,
      required this.delete,
      required this.doneORnot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color:doneORnot ?Colors.black : Colors.white, 
                  fontSize: 22,
                  decoration: doneORnot ? TextDecoration.lineThrough : TextDecoration.none ,
                  ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                doneORnot ? Icons.check : Icons.close,
                size: 27,
                color: doneORnot ? Colors.green[400] : Colors.red,
              ),
              Container(
                  child: IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Color.fromARGB(255, 190, 44, 59),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
