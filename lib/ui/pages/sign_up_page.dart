part of "pages.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final namaController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final auth.User? user = context.watch<auth.User?>();

    if (user == null) {
      // if ((prevPageEvent is! GoToOnboardingPage)) {
      //   prevPageEvent = GoToOnboardingPage();
      //   context.read<PageBloc>().add(prevPageEvent);
      // }
    } else {
      if ((prevPageEvent is! GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(user.uid));
        // prevPageEvent = GoToMainPage();
        // context.read<PageBloc>().add(prevPageEvent);

        // Navigator.pushReplacementNamed(context, '/home');
      }
    }
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          context.read<PageBloc>().add(GoToOnboardingPage());
          Navigator.pushNamed(context, '/');
        },
        icon: const Icon(Icons.arrow_back),
      )),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      children: [
        Text(
          "Daftar",
          style: blackTextStyle.copyWith(
              fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Text(
          "buat akun anda",
          style:
              greyTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 42,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Nama",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: namaController,
              style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300), // Set text color to white

              decoration: InputDecoration(
                hintText: "nama",
                hintStyle: greyTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 42,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Email",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: emailController,
              style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300), // Set text color to white

              decoration: InputDecoration(
                hintText: "email",
                hintStyle: greyTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 42,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Kata Sandi",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 45,
            child: TextFormField(
              obscureText: true,

              controller: passwordController,
              style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300), // Set text color to white

              decoration: InputDecoration(
                hintText: "kata sandi",
                hintStyle: greyTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 50,
        ),
        CustomFilledButton(
          title: "Daftar",
          backgroundColor: orangeColor,
          onPressed: () async {
            await AuthServices.signUp(emailController.text,
                passwordController.text, "mahasiswa", namaController.text);
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          },
        ),
        const SizedBox(
          height: 22,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sudah memiliki akun? ",
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              "Masuk",
              textAlign: TextAlign.center,
              style: blueTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

// Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await AuthServices.signIn("bayu@gmail.com", "asdasdasd");
//             Navigator.pushNamedAndRemoveUntil(
//                 context, '/home', (route) => false);
//           },
//           child: const Text("Sign In"),
//         ),
//       ),
