import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/ui/first_viewmodel.dart';
import 'package:suitmedia_test/ui/second_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final prov = Provider.of<FirstViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background 1.png',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(24.0),
              children: [
                Image.asset(
                  'assets/images/ic_photo.png',
                  width: width * 0.3,
                  height: width * 0.3,
                ),
                const SizedBox(height: 64),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: palindromeController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Palindrome',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          final isPalindrome =
                              prov.isPalindrome(palindromeController.text);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(isPalindrome
                                    ? 'isPalindrome'
                                    : 'not palindrome'),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(),
                        child: const Text('CHECK'))),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          final result = prov.storeName(nameController.text);

                          if (result == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SecondScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed saving name')));
                          }
                        },
                        style: ElevatedButton.styleFrom(),
                        child: const Text('NEXT'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
