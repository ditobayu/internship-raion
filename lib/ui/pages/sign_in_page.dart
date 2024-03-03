part of "pages.dart";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          context.read<PageBloc>().add(GoToOnboardingPage());
        },
        icon: const Icon(Icons.arrow_back),
      )),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthServices.signIn("bayu@gmail.com", "asdasdasd");
          },
          child: const Text("Sign In"),
        ),
      ),
    );
  }
}
