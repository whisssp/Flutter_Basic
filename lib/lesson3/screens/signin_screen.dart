import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:tutorial/lesson3/helper/fn.dart';
import 'package:tutorial/lesson3/payload/payload.dart';
import 'package:tutorial/lesson3/screens/signup_screen.dart';
import 'package:tutorial/lesson3/theme/theme.dart';
import 'package:tutorial/lesson3/widgets/custom_scafford.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final formSignInKey = GlobalKey<FormState>();
  TextEditingController usernameTxtController = TextEditingController();
  TextEditingController passwordTxtController = TextEditingController();

  bool rememberPassword = false;

  Future<User>? _user;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  FutureBuilder<User> buildFutureUser() {
    return FutureBuilder(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the future is being resolved
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle errors from the Future
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${snapshot.data!.id!}'),
              const SizedBox(height: 10),
              Text(snapshot.data!.name!),
              const SizedBox(height: 10),
              Text(snapshot.data!.password!),

            ],
          );
        }
        return const Text('No data');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScafford(
      child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: SizedBox(height: 10)
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 50
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                )
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcom Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: lightColorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: usernameTxtController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ), 
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordTxtController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value.length < 6) {
                            return 'Minimum is 6';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                              color: Colors.black26
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, const SignUpScreen());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: lightColorScheme.primary,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      (_isLoading
                        ? (
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: lightColorScheme.primary,
                              strokeWidth: 2,
                              strokeAlign: 3,
                              semanticsValue: '123',
                            ),
                         )
                        )
                        : GestureDetector(
                            onTap: () {
                              // if (formSignInKey.currentState!.validate() && rememberPassword) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(content: Text('Processing data'))
                              //   );
                              // } else if (!rememberPassword) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(content: Text('Please agree to the processing of personal'))
                              //   );
                              // }
                
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                _user = login(usernameTxtController!.value.text, passwordTxtController!.value.text);
                                _user?.whenComplete(() {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              } on Exception catch (_, e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text(
                                        'Please agree to the processing of personal'))
                                );
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20
                              ),
                              decoration: BoxDecoration(
                                color: lightColorScheme.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          Expanded(child: Divider(height: 1,)),
                          SizedBox(width: 10),
                          Text('Sign In with'),
                          SizedBox(width: 10),
                          Expanded(child: Divider(height: 1,)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      (_user != null ? buildFutureUser() : Text('no data')),
                    ],
                  ),
                ),
              )
            ),
          )
        ],
      )
    );
  }
}