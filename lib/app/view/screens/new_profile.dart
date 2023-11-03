import 'package:flutter/material.dart';
// import 'package:circle_avatar/circle_avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            // Use the alias to differentiate
            radius: 50,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbag9GzN7EBF03ukkWT4wcZ1ZRz1IiUthtzFp8Dnc&s'),
          ),
          Text('Ramesh'),
          SizedBox(height: 30),
          Text(
            'Personal Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Full Name:Ramesh',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Email Address:ramesh@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Mobile Number:9864568923',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
