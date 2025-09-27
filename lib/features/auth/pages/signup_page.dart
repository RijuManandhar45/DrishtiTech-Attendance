import 'package:drishtitech/core/utils.dart';
import 'package:drishtitech/features/auth/providers/auth_provider.dart';
import 'package:drishtitech/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AuthProvider>();

      provider.addListener(() {
        if (provider.statusUtils == StatusUtils.success) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Signup Sucessful!"),
          ));
        }
        if (provider.statusUtils == StatusUtils.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid")));
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      "https://scontent.fktm1-1.fna.fbcdn.net/v/t39.30808-6/496042775_122124642992724235_4721238277388662554_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=5zb0LZYq-EsQ7kNvwHj6jmP&_nc_oc=Admg8bvrQvaN1iVYjw-A5UnVWXohCk82ktjiNxigXHgAQih2j6pWGWDFxAO02_g4KZU&_nc_zt=23&_nc_ht=scontent.fktm1-1.fna&_nc_gid=iL2fLT2H1JncxtlodnyqwQ&oh=00_AfbacKPS7ZdclzA0HMuNXLfhmWJGzEKOer9mShK_6lTqGA&oe=68DB4866",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Let's Sign In.!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Login to Your Account to Continue your all Courses",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.visibility_off)),
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_box, color: Colors.blue),
                      Text("Remember Me"),
                      Spacer(),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        authProvider.signinPage(_emailController.text.trim(),
                            _passwordController.text.trim());
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 110,
                          ),
                          Text("Sign In"),
                          Spacer(),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Text("Or Continue With"),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 40,
                              width: 40,
                              color: const Color.fromARGB(255, 247, 247, 245),
                              child: Image.network(
                                  "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 40,
                              width: 40,
                              color: const Color.fromARGB(255, 247, 247, 245),
                              child: Image.network(
                                "https://gpng.net/wp-content/uploads/Apple-Logo-Icon-PNG.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupPage()));
                            },
                            child: Text(
                              "SIGN Up",
                              style: TextStyle(color: Colors.lightBlueAccent),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
