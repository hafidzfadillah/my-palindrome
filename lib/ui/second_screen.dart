import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/ui/first_viewmodel.dart';
import 'package:suitmedia_test/ui/second_viewmodel.dart';
import 'package:suitmedia_test/ui/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final prov = Provider.of<FirstViewModel>(context);
    final secProv = Provider.of<SecondViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Second Screen',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome'),
              Text(
                prov.savedName ?? 'Guest',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                  child: Center(
                child: Text(
                  secProv.userName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )),
              SizedBox(
                width: width,
                child: ElevatedButton(
                    onPressed: () {
                      if (secProv.userList.isEmpty) {
                        secProv.fetchUsers();
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ThirdScreen()));
                    },
                    child: const Text('Choose a User')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
