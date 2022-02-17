import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Encabezado extends StatelessWidget {
  const Encabezado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey, Jorge!',
                style: GoogleFonts.dosis(
                  fontSize: 55,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Estas son tus tareas.',
                style: GoogleFonts.dosis(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                'No olvides terminarlas a tiempo.',
                style: GoogleFonts.dosis(fontSize: 20),
              ),
            ],
          ),
          const Icon(
            Icons.alarm_rounded,
            color: Color.fromARGB(255, 155, 84, 155),
          ),
        ],
      ),
    );
  }
}
