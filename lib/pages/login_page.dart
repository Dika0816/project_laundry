import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry/pages/main_tab_page.dart';
import 'package:project_laundry/pages/register_page.dart';
import 'package:project_laundry/widgets/const.dart';
import 'package:project_laundry/widgets/validate.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isValUsername = false;
  bool isValPassword = false;

  bool lockStatus = false;
  bool isSecure = true;
  void lockTapped(bool status) {
    setState(() {
      if (isSecure) {
        isSecure = false;
      } else {
        isSecure = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    userController.addListener(userChange);
    passController.addListener(passChange);
  }

  void userChange() {
    setState(() {
      isValUsername = false;
    });
  }

  void passChange() {
    setState(() {
      isValPassword = false;
    });
  }

  void loginTapped(BuildContext context) {
    setState(() {
      if (userController.text.isEmpty) {
        isValUsername = true;
      } else if (passController.text.isEmpty) {
        isValPassword = true;
      } else {
        Navigator.of(context).push(
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => MainTabPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentBody(context),
    );
  }

  Widget contentBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                _buildWelcomeText(),
                SizedBox(height: 80),
                //username placement
                _buildUsernameTF(),
                SizedBox(height: 30),
                //password placement
                _buildPasswordTF(),
                //register text
                SizedBox(height: 80),
                _buildLoginButton(),
                SizedBox(height: 30),
                _buildRegisterText()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Icon(
          Icons.bubble_chart,
          color: Colors.blueGrey,
          size: 38,
        ),
        SizedBox(height: 30),
        Text(
          'Selamat Datang,',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 8.0),
        Text(
          'Login untuk masuk aplikasi',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
      /*
*/
    );
  }

  //Build username input
  Widget _buildUsernameTF() {
    return Column(
      children: [
        TextField(
          autocorrect: false,
          controller: userController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        if (isValUsername) Validate(message: 'Email tidak boleh kosong'),
        /*TextField(
          obscureText: isSecure,
          autocorrect: false,
          controller: passController,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
                icon: (isSecure)
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  //kasih validasi if else
                  //jika log status true maka saved preference = true
                  lockTapped(lockStatus);
                }),
          ),
        ),*/
      ],
      /*
*/
    );
  }

  //build password input
  Widget _buildPasswordTF() {
    return Column(
      children: [
        TextField(
          obscureText: isSecure,
          autocorrect: false,
          controller: passController,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
                icon: (isSecure)
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  //kasih validasi if else
                  //jika log status true maka saved preference = true
                  lockTapped(lockStatus);
                }),
          ),
        ),
        if (isValPassword) Validate(message: 'Password tidak boleh kosong'),
      ],
      /*
*/
    );
  }

  //login button
  Widget _buildLoginButton() {
    return Flexible(
      child: Container(
        width: 100,
        child: ElevatedButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => loginTapped(context),
        ),
      ),
    );
  }

  //register text
  Widget _buildRegisterText() {
    return GestureDetector(
      onTap: () {
        //Fungsi navigasi menuju register
        Navigator.of(context).pushNamed(REGISTER_SCREEN);
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have account ? ',
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: 'Sign Up ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
