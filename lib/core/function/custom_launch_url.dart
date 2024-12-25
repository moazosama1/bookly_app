import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String? uri) async {
  if (uri != null) {
    Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
