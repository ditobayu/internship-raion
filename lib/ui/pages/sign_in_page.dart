part of "pages.dart";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
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
          "Selamat Datang",
          style: blackTextStyle.copyWith(
              fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Text(
          "masuk ke akun anda",
          style:
              greyTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
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
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          "Lupa Sandi?",
          style: blueTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomFilledButton(
          title: "Masuk",
          backgroundColor: orangeColor,
          onPressed: () async {
            await AuthServices.signIn(
                emailController.text, passwordController.text);
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          },
        ),
        const SizedBox(
          height: 22,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Tidak memiliki akun? ",
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              "Daftar",
              textAlign: TextAlign.center,
              style: blueTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 22,
        ),
        CustomFilledButtonOtherServices(
            title: "Masuk dengan google",
            iconPath: "assets/ic_google.png",
            onPressed: () async {}),
        const SizedBox(
          height: 13,
        ),
        CustomFilledButtonOtherServices(
            title: "Masuk dengan apple",
            iconPath: "assets/ic_apple.png",
            onPressed: () async {}),
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
