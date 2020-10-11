import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsViewModel{

  launchURL(String urlSource) async {
    if (await canLaunch(urlSource)) {
      await launch(urlSource);
    } else {
      print('error');
      throw 'Could not launch $urlSource';
    }
  }
}