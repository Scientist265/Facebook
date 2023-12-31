import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/features/friends/presentation/widgets/friends_list.dart';
import 'package:facebook_clo/features/friends/presentation/widgets/request_list.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: Constants.defaultPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Requests",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RequestList(),
            SliverToBoxAdapter(
              child: Divider(
                height: 50,
                thickness: 3,
                color: Colors.black,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Friends",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FriendList()
          ],
        ),
      ),
    );
  }
}
