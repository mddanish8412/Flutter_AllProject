import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail ='';
  var _enteredPassword ='';

  void _submit() async{
   final isValid = _form.currentState!.validate();
   if(!isValid){
     return;
   }
     _form.currentState!.save();
 if(_isLogin){

 }else{
   try {
     final userCredentials = await _firebase.createUserWithEmailAndPassword(
         email:
         _enteredEmail, password: _enteredPassword);
     print(userCredentials);
   } on FirebaseAuthException catch (error){
     if(error.code== 'email-already-in-use'){
       //...
     }
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text(
           error.message ??
               'Authentication failed.'),
     ),
     );
   }
 }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/7572110.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address'
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value){
                              if(value==null || value.trim().isEmpty || value == !value.contains('@')){
                                return 'Please Enter the Valid Email!.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredEmail = value!;
                            },
                          ),

                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password'
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if(value==null || value.trim().length<6 ){
                                return 'Password Must at least 6 character';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12,),
                          ElevatedButton(onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            ),
                              child: Text(_isLogin? 'Login':'Sing up'),
                          ),
                          TextButton(onPressed: (){
                            setState(() {
                              _isLogin =!_isLogin;
                            });
                          },
                              child: Text(_isLogin?'Create an account':'I already have an account'),
                          ),
                        ],
                      ),

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
}
