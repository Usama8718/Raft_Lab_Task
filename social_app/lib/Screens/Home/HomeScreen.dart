import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Screens/NewsFeeds/NewsFeed.dart';
// import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController postController = TextEditingController();
  List<XFile> selectedImages = [];
  File imagefile = File("assets/img_1.jpg");
  void _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImages.add(pickedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: postController,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
              ),
            ),
            SizedBox(height: 16),
            if (selectedImages.isNotEmpty)
              Column(
                children: selectedImages
                    .map((image) => Image.file(imagefile))
                    .toList(),
              ),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Add Image'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement post creation and mention/tag functionality here
                // Send post content and selectedImages to your backend
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsFeedScreen(
                              currentUser: User(id: "id", name: "name"),
                            )));
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
