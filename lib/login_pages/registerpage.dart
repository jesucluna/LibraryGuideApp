import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth =FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passswordController =TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.black12,
                
              ),
              Center(child:Container(
                
                child: Card(
                
                  color: Colors.grey[100],
                  margin: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 100.0, bottom: 230.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Email', icon: Icon(Icons.email)),
                            onFieldSubmitted: (value) {
                              //FocusScope.of(context).requestFocus(_phoneFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Type your name';
                              }
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            autocorrect: false,
                            obscureText: true,
                            maxLines: 1,
                            controller: _passswordController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                            ),
                            onFieldSubmitted: (value) {
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Type your password';
                              }
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        RaisedButton(
                          color: Colors.deepPurpleAccent[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                          _register();
                          },
                        ),
                       
                        Container(
              alignment: Alignment.center,
              child: Text(_success == null
                ? ''
                : (_success
                  ? 'Successfully registered ' + _userEmail
                  : 'Registration failed'
                )
              ),
            )
                        
                        
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(onPressed: ()=>
          Navigator.of(context)
            .pushNamed('/login'), child: Text("Ya estoy registrado"),)
      ],
            
          
        );
     
  }


  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passswordController.text,
    );
    if (user != null) {
      setState(() {
       _success = true;
       _userEmail = user.email; 
      });
    } else {
      _success = false;
    }
  }


}

