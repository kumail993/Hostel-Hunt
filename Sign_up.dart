import 'package:findyournewhome/Login_page.dart';
import 'package:flutter/material.dart';
class Signup_page extends StatefulWidget {
  const Signup_page({Key? key}) : super(key: key);

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:
        Form(
          key: _formKey,
    child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(child: Column(
                children:[
                  SizedBox(
                    height: 200,
                    width: 200,
                    child:
                    Image.asset('Assets/logo.png',fit: BoxFit.fill,),
                  ),
                  const Text('Create an Account',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]
            ),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(padding: const EdgeInsets.only(left: 50,right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Full Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: 'Enter Your Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Theme.of(context).colorScheme.surface,),

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: 'Enter Your Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Theme.of(context).colorScheme.surface,),

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: 'Enter Your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Theme.of(context).colorScheme.surface,),

                        ),
                      ),
                      obscureText: true,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter password";
                        }else{
                          //call function to check password
                          bool result = validatePassword(value);
                          if(result){
                            // create account event
                            return null;
                          }else{
                            return " Password should contain Capital, small letter & Number & Special";
                          }
                        }
                      },


                    )
                  ],
                )
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(

                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 70.0),
                      ),
                      foregroundColor: MaterialStateProperty.all<
                          Color>(Theme.of(context).colorScheme.secondary,),
                      backgroundColor: MaterialStateProperty.all<
                          Color>( Theme.of(context).colorScheme.primary,),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side:  BorderSide(color: Theme.of(context).colorScheme.secondary,),
                            borderRadius: BorderRadius.circular(
                                18.0),
                          )
                      )
                  ),
                  onPressed: () {

                  },

                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 14),
                  )
              ),
            ),

             Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account'),
                TextButton(onPressed:  (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>const LoginPage(),

                ),
                );
                },
                    child: const Text('Sign in'))
              ],
            )
            ),
          ],
        ) ,
      ),
      ),
    );
  }
}
