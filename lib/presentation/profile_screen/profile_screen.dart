import 'package:flutter/material.dart';

import 'package:music_app/presentation/edit_screen/edit_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Profile", style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),)
                  ],
                ),
                const SizedBox(height: 30,),
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/img/avt.jpg'),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 20,
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.person, color: Colors.black, size: 20,),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nguyen Ngoc Anh", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),)
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("anhnn.contactwork@gmail.com", style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),)
                  ],
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/editScreen');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow,
                    ),
                    child: const Center(
                      child: Text("Edit Profile", style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                _buildFeature(Icons.settings, "Settings"),
                const SizedBox(height: 15,),
                _buildFeature(Icons.details_rounded, "Billing Detail"),
                const SizedBox(height: 15,),
                _buildFeature(Icons.manage_accounts, "User Management"),
                const SizedBox(height: 15,),
                _buildFeature(Icons.info_rounded, "Information"),
                const SizedBox(height: 15,),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        child: Icon(Icons.logout, size: 20, color: Colors.white,),
                      ),
                      SizedBox(width: 15,),
                      Text("Logout", style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFeature (IconData? icon, String title){
  return DecoratedBox(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.5, color: Colors.grey),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Icon(icon, size: 20, color: Colors.white,),
          ),
          const SizedBox(width: 15,),
          Text(title, style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16,
            color: Colors.white,
          ),),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
        ],
      ),
    ),
  );
}

