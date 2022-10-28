//Search_Field
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_Field extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 310,
          height: 59,
          child: TextFormField(
            //style: TextStyle(color: Colors.pinkAccent),
            decoration: InputDecoration(
              fillColor: Color(0xffFFFFFF),
              filled: true,
              suffixIcon: IconTheme(
                  data: IconThemeData(color: Color(0xffB5B5B5), size: 25),
                  child: Icon(
                    Icons.search,
                  )),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Color(0xffFFFFFF))),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Color(0xffFFFFFF)),
              ),
              hintText: "Search here",
            ),
            style: GoogleFonts.inter(
                decoration: TextDecoration.none,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000)),
          ),
        ),
        SizedBox(
          width: 11,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(
                Icons.mic_none_outlined,
                color: Colors.black87,
                size: 30,
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
