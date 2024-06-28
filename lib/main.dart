import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firestore_service.dart';
import 'profile_list.dart';
import 'camera_screen.dart';
import 'map_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing Firebase...');
  await Firebase.initializeApp(options: firebaseOptions).then((value) {
    print('Firebase initialized');
    runApp(MyApp());
  }).catchError((error) {
    print('Failed to initialize Firebase: $error');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Profile List'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileList()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Camera'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Google Maps'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Create Post'),
              onPressed: () async {
                Map<String, dynamic> data = {
                  'title': 'foo',
                  'body': 'bar',
                  'userId': 1,
                };
                await firestoreService.createPost(data);
                print('Created Post');
              },
            ),
            ElevatedButton(
              child: Text('Get Post'),
              onPressed: () async {
                String postId = '7GxWYnUcdwgknHan8iUh'; // Ganti dengan ID dokumen yang valid
                final document = await firestoreService.getPost(postId);
                print('Fetched Post: ${document.data()}');
              },
            ),
            ElevatedButton(
              child: Text('Get All Posts'),
              onPressed: () async {
                final querySnapshot = await firestoreService.getAllPosts();
                querySnapshot.docs.forEach((doc) {
                  print('Post: ${doc.data()}');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
