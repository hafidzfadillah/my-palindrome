import 'package:flutter/material.dart';
import 'package:suitmedia_test/models/user.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key, required this.data, required this.onClick});
  final UserData data;
  final Function(UserData data) onClick;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onClick(data);
      },
      child: Row(
        children: [
          Container(
            width: width * 0.15,
            height: width * 0.15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(data.avatar!))),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.firstName ?? 'Name'} ${data.lastName ?? 'Surname'}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  data.email ?? '-',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
