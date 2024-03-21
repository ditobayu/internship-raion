part of "pages.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return const Text("User Initial");
                } else if (state is UserLoaded) {
                  return Text("User Loaded: ${state.user.name}");
                } else {
                  return const Text("User Initial");
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signOut(context);
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
