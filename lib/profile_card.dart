import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String title;
  final String description;

  ProfileCard({
    required this.imagePath,
    required this.name,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 16.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
