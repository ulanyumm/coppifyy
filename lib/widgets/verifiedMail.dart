import 'package:flutter/material.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';
import 'package:provider/provider.dart';

class VerifiedMailCard extends StatelessWidget {
  const VerifiedMailCard({super.key});

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<SettingsScreenViewModel>(context);

    // E-posta doğrulama durumu
    bool isEmailVerified =
        viewmodel.showAuthModel.data!.user!.emailVerified ?? false;

    // E-posta doğrulama durumuna göre görünürlük kontrolü
    return Visibility(
      visible:
          !isEmailVerified, // Eğer e-posta doğrulanmışsa false yapın, böylece gizlenir.
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.mail, color: Colors.red, size: 50),
                Text('Email not verified'),
              ],
            ),
            const Text('Your email is not verified. Please verify your email.'),
            TextButton(
              onPressed: () {
                // E-posta doğrulama e-postasını gönderme işlemi burada gerçekleştirilebilir.
                // Örneğin, sendEmail() gibi bir işlevi burada çağırabilirsiniz.
              },
              child: const Text(
                "Verify Email",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
