import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}

class Post {
  final User user;
  final String text;

  Post({required this.user, required this.text});
}

class NewsFeedScreen extends StatefulWidget {
  final User currentUser;

  NewsFeedScreen({required this.currentUser});

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<User> following = [];
  List<Post> newsFeed = [];

  void followUser(User userToFollow) {
    setState(() {
      following.add(userToFollow);
      // Call an API to update the following list on the server.
    });
  }

  void unfollowUser(User userToUnfollow) {
    setState(() {
      following.remove(userToUnfollow);
      // Call an API to update the following list on the server.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: ListView.builder(
        itemCount: newsFeed.length,
        itemBuilder: (context, index) {
          final post = newsFeed[index];
          return ListTile(
            title: Text(post.user.name),
            subtitle: Text(post.text),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen where the user can follow/unfollow other users.
          // Implement the follow/unfollow functionality there.
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
