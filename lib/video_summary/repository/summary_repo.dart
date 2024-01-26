import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:video_summariser_yt/secrets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SummaryRepo {
  static Future<String> getSummaryMultiplePortions(
      String url, String transcript, double partitionNum) async {
    String summary = '';
    int pNumInt = partitionNum.round();

    for (int i = 0; i <= transcript.length ~/ pNumInt; i++) {
      String summaryText = await getSummary(
          url,
          transcript.substring(
              i * pNumInt,
              (i + 1) * pNumInt < transcript.length
                  ? (i + 1) * pNumInt
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
    String? extractedId = YoutubePlayer.convertUrlToId(videoUrl);

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
