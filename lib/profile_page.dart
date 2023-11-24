import 'package:adminpannelweb/ownoutlinetexrfield.dart';
import 'package:adminpannelweb/side_menubar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffcceeff),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      drawer: SideMenu(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: CircleAvatar(
                      maxRadius: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/new_profile_pic.png",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "Full Name",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 15,),
            Container(
              width: 500,
              child: OwnOutlineTextField(placeHolder: ""),
            ),
            SizedBox(height: 15,),
            Text(
              "Email",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 15,),
            Container(
              width: 500,
              child: OwnOutlineTextField(placeHolder: ""),
            ),
            SizedBox(height: 15,),
            Text(
              "Phone Number",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 15,),
            Container(
              width: 500,
              child: OwnOutlineTextField(placeHolder: ""),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){}, child: Text("Update")),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
