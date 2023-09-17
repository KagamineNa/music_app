import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool isHiding = true;
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
                Stack(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Edit Profile", style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)
                      ],
                    ),
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
                const SizedBox(height: 40,),
                _buildDetail(Icons.person_outline, "Full name"),
                const SizedBox(height: 20,),
                _buildDetail(Icons.email_outlined, "E-mail"),
                const SizedBox(height: 20,),
                _buildDetail(Icons.phone_outlined, "Phone number"),
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText: isHiding,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      label: Text("Password", style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                      ),),
                      prefixIcon: const Icon(Icons.fingerprint_outlined, color:Colors.white,),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isHiding = !isHiding;
                          });
                        },
                        icon: Icon(isHiding ? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: Colors.white,)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 0.6),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white, width: 0.6),
                      )
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: (){

                    },
                    child: const Text("Edit Profile", style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),),
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

Widget _buildDetail (IconData? icon, String label){
  return TextFormField(
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        label: Text(label, style: TextStyle(
          color: Colors.blueGrey.shade800,
          fontSize: 18,
          fontFamily: 'Rubik',
        ),),
        prefixIcon: Icon(icon, color:Colors.white,),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.6),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 0.6),
        )
    ),
  );
}
