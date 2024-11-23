import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:porfoliov7/model/git_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DataNetworks {
  final String url =
      "https://raw.githubusercontent.com/TejasG-007/ProjectData/main/projectdata.json";

  Future<GitData?> getDataFromGitHub() async {
    try {
      final Uri gitUrl = Uri.parse(url);
      final http.Response response = await http.get(gitUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final gitData = GitData.fromMap(data);
        return gitData;
      } else {
        return null;
      }
    } catch (e) {
      log("Error While Fetching data | $e");
      return null;
    }
  }

  Future<void> navigateWhatsApp() async {
    final url = Uri.parse(
        "https://wa.me/+919146780318?text=Hello%20there!\n%20in%20from%20Portfolio%20");
    await launchUrl(url);
  }

  Future<void> navigateToDownloadCV(String url) async {
    await launchUrl(Uri.parse(url));
  }

  Future<void> navigatingToSocial(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
