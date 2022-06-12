import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100, bottom: 40),
            child: Center(
              child: IconContainer(),
            ),
          ),
          const Text("Login page"),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      padding: const EdgeInsets.all(20),
      child: const SizedBox(
        height: 200,
        width: 200,
        child: Image(
          width: 40,
          height: 40,
          image: AssetImage(
            'assets/Imagotipo.png',
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

String? _email;
String? _password;
bool _rememberme = true;
bool? _passwordVisible = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //EMAIL AREA
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Insert your email',
                prefixIcon: Icon(Icons.alternate_email),
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                {
                  return "Please enter valid email";
                }
              },
              //controller: _emailController,
              onChanged: (value) {
                _email = value;
              },
              //controller: _emailController,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //PASSWORD AREA
            TextFormField(
              decoration: InputDecoration(
                //labelText: 'Password',
                hintText: "Insert your password",
                filled: true,
                isDense: true,
                prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible!
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible!;
                      });
                    }),
                //suffixIcon: const Icon(Icons.account_box),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              onChanged: (value) {
                _password = value;
              },
              obscureText: !_passwordVisible!,
              //controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              //autocorrect: false,
            ),

            const SizedBox(
              height: 12,
            ),

            CheckboxListTile(
                title: const Text("Remember me"),
                value: _rememberme,
                onChanged: (value) {
                  setState(() {
                    _rememberme = value!;
                  });
                }),

            ElevatedButton(onPressed: () {}, child: const Text("Login Now")),
            const SizedBox(
              height: 10,
            ),

            TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, 'opt-verify');
                },
                child: const Text("Are you new user ?, Register Now"))
          ],
        ),
      ),
    );
  }
}
