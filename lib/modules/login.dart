import 'package:bmi_calc2/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool tap = true;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordController1 = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator:(value) {
                      if (value!.isEmpty){
                       return "Gmail must not be empty!";
                      }return null;
                      
                    }, 
                    
                    controller: emailController,
                    
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator:(value) {
                      if (value!.isEmpty){
                       return "Password must not be empty!";
                      }return null;
                      
                    }, 
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: tap,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            tap = !tap;
                            
                          });
                        },
                        child: Icon(
                          tap ? Icons.visibility: Icons.visibility_off
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  def_text_form(Controller: passwordController1 ,Border: UnderlineInputBorder() , 
                  label: "lol" , on_edit: (){print ("lol");} , on_sub: (){print("XD");} , 
                  preicon: Icons.sailing , sufficon: Icons.local_airport , val_str: "fucck u " , Obsecure_text: false)
                  ,
                   SizedBox(
                    height: 20.0,
                  ),
                  def_button(bor_radius: 20,
                    func: () {
                      if (formkey.currentState!.validate()){
                      print(emailController.text);
                      print(passwordController.text);
                      }
                    },
                    color: Colors.blue,
                    upper: true,
                    title: "Login"
                  ),
                   SizedBox(
                    height: 10.0,
                  ),
                   def_button(
                     bor_radius: 20,
                    func: () {
                     
                    },
                    color: Colors.green,
                    upper: true,
                    title: "Register"
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
