import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(99, 0, 156, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No',
            style: GoogleFonts.abel(color: Colors.black),
          ),
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              'task',
              style: GoogleFonts.abel(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
