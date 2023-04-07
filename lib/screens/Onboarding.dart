import 'package:flutter/material.dart';
import 'package:home_workout/screens/content_model.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/login_screen.dart';





class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  PageController _controller = PageController();
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(
                  () {
                    currentPage = index;
                  },
                );
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].images,
                        
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => dots_indicator(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.all(80),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (currentPage == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                }
                _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Text(
                  style: const TextStyle(fontSize: 24),
                  currentPage == contents.length - 1 ? "Continue" : "Next"),
            ),
          )
        ],
      ),
    );
  }

  Container dots_indicator(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPage == index
            ? const Color.fromARGB(255, 253, 107, 62)
            : const Color.fromARGB(255, 199, 199, 199),
      ),
    );
  }
}
