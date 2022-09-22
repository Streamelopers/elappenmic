import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
                image: AssetImage('assets/streamelopers.png'),
                fit: BoxFit.fitWidth),
            Row(children: const [
              Expanded(
                child: Text(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    "Gracias por usar la aplicación. Esta es una aplicación de codigo abierto. Puedes ver el codigo en nuestro github y seguirnos en las redes sociales usando los botones aquí debajo."),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse('https://github.com/streamelopers')),
                    icon: const Icon(FontAwesomeIcons.github)),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse('https://twitch.tv/streamelopers')),
                    icon: const Icon(FontAwesomeIcons.twitch)),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse('https://twitter.com/streamelopers')),
                    icon: const Icon(FontAwesomeIcons.twitter)),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse('https://youtube.com/streamelopers')),
                    icon: const Icon(FontAwesomeIcons.youtube)),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse('https://instagram.com/streamelopers')),
                    icon: const Icon(FontAwesomeIcons.instagram))
              ],
            ),
            const Divider(height: 100),
            const Divider(),
            const Divider(),
            Row(children: const [
              Expanded(
                child: Text(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    "ElAppEnMic es una aplicación hecha por fans. Sus creadores no están asociado de ninguna forma con el programa radiar El Open Mic ni con Alofoke Media Group"),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
