import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/home/home_page.dart';
import 'package:simlimites/presentation/widgets/circle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //conocer la dimension de la pantalla actual
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        //toda la pantalla
        width: double.infinity,
        height: double.infinity,

        child: Stack(children: [
          Positioned(
            top: -100,
            left: -50,
            child: Circle(
              size: 230,
              colors: const [
                Color.fromARGB(255, 40, 156, 254),
                Color.fromARGB(255, 40, 186, 254),
              ],
            ),
          ),
          Positioned(
            top: -100,
            right: -50,
            child: Circle(
              size: 300,
              colors: const [
                Color.fromARGB(255, 40, 186, 254),
                Color.fromARGB(255, 249, 215, 21),
              ],
            ),
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              IconContainer(),
              Text(
                "Accede a tu cuenta",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color.fromARGB(255, 40, 186, 254)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 30),
                child: LoginForm(),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 30),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(44, 0, 0, 0),
                blurRadius: 5,
              )
            ]),
        padding: const EdgeInsets.all(5),
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
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

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

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 40, 186, 254),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text(
                  "Entrar",
                )),

            TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, 'opt-verify');
                },
                child: const Text("¿New user? Register Now"))
          ],
        ),
      ),
    );
  }
}
