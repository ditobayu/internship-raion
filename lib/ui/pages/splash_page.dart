part of "pages.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Splash Page")),
      body: Center(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<PageBloc>().add(GoToLoginPage());
                  },
                  child: const Text("Go To sign page")),
              ElevatedButton(
                  onPressed: () {
                    context.read<PageBloc>().add(GoToOnboardingPage());
                  },
                  child: const Text("Go To onboarding")),
            ],
          ),
        ),
      ),
    );
  }
}
