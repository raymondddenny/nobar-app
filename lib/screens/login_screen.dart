import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nobar_app/resources/auth_methods.dart';
import 'package:nobar_app/utils/utils.dart';

import 'widgets/nobar_primary_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods authMethods = AuthMethods();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController joinCodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    joinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ayo ikutan nobar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                  child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_EKneFK.json',
                      fit: BoxFit.cover)),
              const Spacer(),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Masukan Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Masukan Kode Ruangan',
                  border: OutlineInputBorder(),
                ),
              ),
              NobarPrimaryBtn(
                text: 'Masuk',
                onPressed: () async {
                  if (nameController.text.isEmpty || joinCodeController.text.isEmpty) {
                    showSnackBar(context: context, text: "Nama dan Kode Ruangan tidak boleh kosong");
                    return;
                  }
                  final res = await authMethods.saveDataToFirebase(
                    context: context,
                    name: 'test',
                    joinCode: 'test',
                  );

                  if (res) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/call');
                  }
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
