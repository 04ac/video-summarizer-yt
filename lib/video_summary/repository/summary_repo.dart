// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:video_summariser_yt/secrets.dart';

class SummaryRepo {
  static Future<String> getSummaryMultiplePortions(
      String url, String transcript) async {
    String summary = '';

    for (int i = 0; i <= transcript.length ~/ 1000; i++) {
      String summaryText = await getSummary(
          url,
          transcript.substring(
              i * 1000,
              (i + 1) * 1000 < transcript.length
                  ? (i + 1) * 1000
                  : transcript.length));

      summary += '$summaryText\n\n';
    }

    return summary;
  }

  static Future<String> getSummary(String url, String transcript) async {
    var client = http.Client();

    String API_URL = url;
    const String API_TOKEN = Secrets.HF_API_TOKEN;
    Map<String, String> headers = {"Authorization": "Bearer $API_TOKEN"};

    Map<String, dynamic> payload = {
      "inputs": transcript,
      "parameters": {
        "min_length": 30,
      },
    };

    try {
      var response = await client.post(Uri.parse(API_URL),
          headers: headers, body: jsonEncode(payload));

      var result = jsonDecode(response.body);

      return result[0]["summary_text"];
    } catch (e) {
      log(e.toString());
      return "Summary Not Generated.";
    }
  }

  // https://www.youtube.com/watch?v=VaXpJm7b-m8
  static Future<String> getTranscript(String videoUrl) async {
    List<String> parts = videoUrl.split("=");
    String? extractedId = parts.length > 1 ? parts[1] : null;

    if (extractedId == null) {
      return "Transcript Not Available";
    }

    String API_URL = "${Secrets.TRANSCRIPT_API}$extractedId";

    var client = http.Client();

    try {
      var response = await client.get(Uri.parse(API_URL));

      var result = jsonDecode(response.body);

      return result["transcript"];
    } catch (e) {
      log(e.toString());
      return "Transcript Not Available";
    }
  }
}
