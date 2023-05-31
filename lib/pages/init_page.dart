import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:via_cep/pages/main_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEDEEE1),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          child: Expanded(
            child: Column(
              children: [
                Text("Seja bem-vindo ao\n\nBUSCADOR DE CEP\n\n",
                    style: TextStyle(
                        fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..strokeWidth = 0.5
                        ..color = Colors.black,
                      shadows: const [
                      Shadow(
                      blurRadius: 2,
                      color: Colors.yellow,
                      offset: Offset(2, 1),
                    )])),
                SvgPicture.asset("lib/assets/globalization-pana.svg", height: 300),
                ElevatedButton( onPressed: ()=> Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_)=> const MainPage())),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow)
                    ),
                    child: const Text("BUSCAR CEP",
                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
