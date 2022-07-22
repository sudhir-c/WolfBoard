import 'package:flutter/material.dart';

final List<String> COURSES = [
  //DEFAULT MESSAGE
  "Select a course",
  //MATH COURSES
  "Algebra Support",
  "Algebra 1",
  "Algebra 2",
  "Geometry",
  "Precalculus",
  "AP Calculus AB",
  "AP Calculus BC",
  "AP Statistics",
  //ENGLISH COURSES
  "Pre-AP English 1",
  "Pre-AP English 2",
  "English 3",
  "English 4",
  "AP Seminar",
  "AP Research",
  "AP English Language and Composition",
  "AP English Literature and Composition",
  "UW English and Composition",
  //SCIENCE COURSES
  "Biology in the Environment",
  "Physics in the Universe",
  "Chemistry in Earth Systems",
  "AP Environmental Sciences",
  "AP Physics 1",
  "AP Physics 2",
  "AP Biology",
  "AP Chemistry",
  //HISTORY/SOCIAL STUDIES
  "AP Human Geography",
  "AP World History (Modern)",
  "AP US History",
  "AP Government",
  //LANGUAGES
  "Spanish 1",
  "Spanish 2",
  "Spanish 3",
  "Spanish 4",
  "French 1",
  "French 2",
  "French 3",
  "French 4",
  //ARTS
  "Concert Band",
  "Symphonic Band",
  "Wind Ensemble",
  "Honors Wind Ensemble",
];
final List<String> STAFF = [
  "Select a teacher",
  "Katherine Akesson",
  "Rebeca Ambriz de Olivera",
  "Monica Andersen",
  "Nicholas Andersen",
  "Margaret Armstrong",
  "Judy-Gail Baker",
  "Matthew Barry",
  "Travis Birse",
  "Brenda Black",
  "Emily Borden",
  "Kyle Pihl",
  "David Heaton-Bush",
  "Jason Gadek",
  "Kevin Kukla",
  "Keelin Davis",
  "Michael Lundquist",
  "Samuel Lessard",
  "Natalie Macknight"
];

final ButtonStyle NAVBUTTON = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
    shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 116, 88)),
    textStyle: MaterialStateProperty.all(
        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)));

final ButtonStyle DEFAULTBUTTON = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 116, 88)),
    shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
    textStyle: MaterialStateProperty.all(
        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)));
final TextStyle HEADERTEXT = TextStyle(
  fontSize: 28,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  fontFamily: 'Ubuntu',
);

Map<int, Color> THEMECOLOR = {
  50: Color.fromRGBO(2, 116, 88, .1),
  100: Color.fromRGBO(2, 116, 88, .2),
  200: Color.fromRGBO(2, 116, 88, .3),
  300: Color.fromRGBO(2, 116, 88, .4),
  400: Color.fromRGBO(2, 116, 88, .5),
  500: Color.fromRGBO(2, 116, 88, .6),
  600: Color.fromRGBO(2, 116, 88, .7),
  700: Color.fromRGBO(2, 116, 88, .8),
  800: Color.fromRGBO(2, 116, 88, .9),
  900: Color.fromRGBO(2, 116, 88, 1),
};
