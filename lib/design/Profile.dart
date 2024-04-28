import 'package:flutter/material.dart';
import 'package:service_provide_app/login_signup/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? dropDownIndex;
  String? dropDownIndexLanguage;
  var dropDownList = ['profile_page_pokhara_text'];
  var dropDownLanguage = ["profile_page_dropdown_english_text", "नेपाली"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    color: Colors.blue,
                    child: Container(
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: const EdgeInsets.only(bottom: 115),
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.only(
                        top: 115,
                        left: 35,
                        right: 35,
                        bottom: MediaQuery.of(context).size.height * 0.08,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child: Image.asset('assets/user.png'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'username',
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'username123@gmail.com',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              ListTile(
                title: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.location_city,
                            size: 30,
                          ),
                          title: Container(
                            width: 140,
                            height: 70,
                            padding: const EdgeInsets.only(left: 12, right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: DropdownButton(
                                icon: const Expanded(
                                  child: Icon(
                                    Icons.expand_more,
                                    size: 30,
                                  ),
                                ),
                                dropdownColor: Colors.white,
                                enableFeedback: true,
                                iconSize: 16,
                                borderRadius: BorderRadius.circular(16),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                items: dropDownList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (String? index) {
                                  setState(() {
                                    dropDownIndex = index;
                                  });
                                },
                                value: dropDownIndex ??
                                    'profile_page_pokhara_text',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.language,
                            size: 30,
                          ),
                          title: Container(
                            width: 140,
                            height: 70,
                            padding: const EdgeInsets.only(left: 12, right: 0),
                            child: Center(
                              child: DropdownButton(
                                  icon: const Expanded(
                                    child: Icon(
                                      Icons.expand_more,
                                      size: 30,
                                    ),
                                  ),
                                  dropdownColor: Colors.white,
                                  enableFeedback: true,
                                  iconSize: 16,
                                  borderRadius: BorderRadius.circular(16),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  items: dropDownLanguage
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (String? index2) {
                                    setState(() {
                                      dropDownIndexLanguage = index2;
                                    });
                                  },
                                  value: dropDownIndexLanguage ??
                                      'profile_page_dropdown_english_text'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.key,
                            size: 28,
                          ),
                          title: TextButton(
                            onPressed: () {
                              _openChangePassword();
                            },
                            child: Align(
                              alignment: Alignment(-1.2, 0),
                              child: Text(
                                'change_password_text',
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ListTile(
                          leading: const Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          title: TextButton(
                            onPressed: () {
                              _showLogoutDialog();
                            },
                            child: Align(
                              alignment: Alignment(-1.2, 0),
                              child: Text(
                                'profile_page_logout',
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openChangePassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('change_password_text'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.77,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Current Password',
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
