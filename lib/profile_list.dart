import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_card.dart';

class ProfileList extends StatelessWidget {
  final CollectionReference profiles = FirebaseFirestore.instance.collection('profiles');

  @override
  Widget build(BuildContext context) {
    print('Building ProfileList');
    return Scaffold(
      //...
      body: StreamBuilder<QuerySnapshot>(
        stream: profiles.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Loading data...');
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Failed to load profiles'));
          } else if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
            print('No data available');
            return Center(child: Text('No profiles found'));
          } else {
            final profilesData = snapshot.data!.docs;
            print('Data loaded: ${profilesData.length} profiles');
            return ListView.builder(
              itemCount: profilesData.length,
              itemBuilder: (context, index) {
                final profiles = profilesData[index];
                print('Profile: ${profiles['name']}');
                return ProfileCard(
                  imagePath: profiles['imagePath'],
                  name: profiles['name'],
                  title: profiles['title'],
                  description: profiles['description'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
