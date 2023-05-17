import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title:const Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildContainer(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,10,25,3),
                child: buildTextField(TextInputType.text,'Username'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,5),
                child: buildTextField(TextInputType.emailAddress,'Email'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,5),
                child: buildTextField(TextInputType.phone,'Phone'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,5),
                child: buildTextField(TextInputType.text,'Gender'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,5),
                child: buildTextField(TextInputType.datetime,'Date of Birth'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(TextInputType kB,String text) {
    return TextField(
            keyboardType: kB,
            decoration: InputDecoration(
              labelText: text,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 25),
            ),
          );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon:const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  'save'.toUpperCase(),
                  style:const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Stack(alignment: Alignment.bottomRight, children: const [
                 CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('lib/images/assets.png'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
