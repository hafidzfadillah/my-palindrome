import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/ui/card_user.dart';
import 'package:suitmedia_test/ui/second_viewmodel.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<SecondViewmodel>(context, listen: false).nextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SecondViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Third Screen',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          prov.nextPage(page: 1);
        },
        child: ListView.separated(
          controller: scrollController,
          padding: const EdgeInsets.all(24.0),
          itemCount: prov.userList.length + 1,
          itemBuilder: (context, index) {
            if (prov.userList.isEmpty) {
              if (prov.onSearch) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Data not found'),
                  const SizedBox(
                    height: 24,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        prov.fetchUsers();
                      },
                      child: const Text('Refresh'))
                ],
              );
            }

            if (index == prov.userList.length) {
              return prov.onSearch
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink();
            }

            return CardUser(
              data: prov.userList[index],
              onClick: (user) {
                prov.selectUser(user);
                Navigator.pop(context);
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
