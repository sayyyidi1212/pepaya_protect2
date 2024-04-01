import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Patrolguard',
              style: TextStyle(
                color: Color(0xFF356899), // Warna teks putih
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0), // Jarak antara teks dan teks selanjutnya
            Text(
              'Welcome Back 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0), // Jarak antara teks dan teks selanjutnya
            Text(
              'Let’s log in., to continue!',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 113, 120, 128),
              ),
            ),
            SizedBox(height: 50.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(10.0)), // Radius 10
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(10.0)), // Radius 10
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFF356899), // Ubah warna tombol menjadi kode warna yang diinginkan (356899)
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5), // Atur radius sudut tombol
                ),
              ),
              onPressed: () {
                // Replace this with your authentication logic
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Example authentication logic
                if (username == 'admin' && password == 'password') {
                  // Navigate to home page or any other page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  // Show error message or handle authentication failure
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid username or password.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white), // Ubah warna teks menjadi putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example home page after successful login
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
