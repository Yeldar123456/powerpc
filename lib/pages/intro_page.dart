import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:powerpc/components/my_button.dart';
import 'package:powerpc/pages/shop_page.dart';

class GoogleSignInButton extends StatefulWidget {
  final VoidCallback onPressed;

  GoogleSignInButton({required this.onPressed});

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text('Sign in with Google'),
    );
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              "images/dragon.png",
              width: 200,
            ),
            const SizedBox(height: 25),

            // title
            Text(
              "PowerPc",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 10,),

            // subtitle
            Text(
              "Лучшие игровые компьютеры",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25,),

            // button to navigate to the shop page
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: const Icon(Icons.arrow_forward),
            ),

            const SizedBox(height: 10,),  // Add some spacing

            // Google Sign-In button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoogleSignInExample(),
                  ),
                );
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignInExample extends StatefulWidget {
  @override
  _GoogleSignInExampleState createState() => _GoogleSignInExampleState();
}

class _GoogleSignInExampleState extends State<GoogleSignInExample> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
  }

  checkIfUserIsSignedIn() {
    if (_googleSignIn.currentUser != null) {
      // User is already signed in, navigate to the desired page
      navigateToShopPage();
    }
  }

  _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
    // Check if the user is signed in
    if (_googleSignIn.currentUser != null) {
      // Navigate to the desired page after successful sign-in
      navigateToShopPage();
    }
  } catch (error) {
    print('Google Sign-In Error: $error');
  }
}


  // Helper method to navigate to the shop page
  void navigateToShopPage() {
    Navigator.pushReplacementNamed(context, '/shop_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In Example'),
      ),
      body: Center(
        child: _googleSignIn.currentUser == null
            ? GoogleSignInButton(
                onPressed: _handleSignIn,
              )
            : const Text('User is already signed in!'),
      ),
    );
  }
}
