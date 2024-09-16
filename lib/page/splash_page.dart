import 'package:coffe_app/page/home_page2.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  Future<void> _startDelay() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(245, 245, 245, 245),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/coffe.jpg",
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: const Text(
                    "Kahve Atölyesi",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  color: Colors.transparent,
                  height: 200,
                  width: double.infinity,
                  child: const Text(
                    "En Doğru Yerdesin",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
