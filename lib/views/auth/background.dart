import 'package:flutter/material.dart';

// class Background extends StatelessWidget {
//   const Background({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: Column(
//         children: <Widget>[
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: <Widget>[
//               Image.asset(
//                 'assets/images/collaboration.png',
//                 width: MediaQuery.of(context).size.width / 1.5,
//               ),
//               WavyHeader(),
//             ],
//           ),
//           Expanded(
//             child: Container(),
//           ),
//           Stack(
//             alignment: Alignment.bottomLeft,
//             children: const <Widget>[
//               WavyFooter(),
//               CirclePink(),
//               CircleYellow(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// const List<Color> orangeGradients = [
//   Color(0xFFFF9844),
//   Color(0xFFFE8853),
//   Color(0xFFFD7267),
// ];

// const List<Color> aquaGradients = [
//   Color(0xFF5AEAF1),
//   Color(0xFF8EF7DA),
// ];

// class WavyHeader extends StatelessWidget {
//   const WavyHeader({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: TopWaveClipper(),
//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: orangeGradients, begin: Alignment.topLeft, end: Alignment.center),
//         ),
//         height: MediaQuery.of(context).size.height / 2.5,
//       ),
//     );
//   }
// }

// class WavyFooter extends StatelessWidget {
//   const WavyFooter({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: FooterWaveClipper(),
//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: aquaGradients, begin: Alignment.center, end: Alignment.bottomRight),
//         ),
//         height: MediaQuery.of(context).size.height / 3,
//       ),
//     );
//   }
// }

// class CirclePink extends StatelessWidget {
//   const CirclePink({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: const Offset(-70.0, 90.0),
//       child: const Material(
//         color: Colors.pink,
//         shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
//         child: Padding(padding: EdgeInsets.all(120)),
//       ),
//     );
//   }
// }

// class CircleYellow extends StatelessWidget {
//   const CircleYellow({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: const Offset(0.0, 210.0),
//       child: const Material(
//         color: Colors.yellow,
//         shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
//         child: Padding(padding: EdgeInsets.all(140)),
//       ),
//     );
//   }
// }

// class TopWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // This is where we decide what part of our image is going to be visible.
//     var path = Path();
//     path.lineTo(0.0, size.height);

//     var firstControlPoint = Offset(size.width / 7, size.height - 30);
//     var firstEndPoint = Offset(size.width / 6, size.height / 1.5);

//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint = Offset(size.width / 5, size.height / 4);
//     var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

//     var thirdControlPoint = Offset(size.width - (size.width / 9), size.height / 6);
//     var thirdEndPoint = Offset(size.width, 0.0);
//     path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

//     ///move from bottom right to top
//     path.lineTo(size.width, 0.0);

//     ///finally close the path by reaching start point from top right corner
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class FooterWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(size.width, 0.0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.lineTo(0.0, size.height - 60);
//     var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
//     var secondEndPoint = Offset(size.width, 0.0);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class YellowCircleClipper extends CustomClipper<Rect> {
//   @override
//   Rect getClip(Size size) {
//     return null;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
// }
