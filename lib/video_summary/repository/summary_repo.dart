import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../env.dart';

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
    String API_TOKEN = Env.key1;
    Map<String, String> headers = {"Authorization": "Bearer $API_TOKEN"};

    Map<String, dynamic> payload = {
      "inputs": transcript,
      "parameters": {
        "do_sample": false,
      },
    };

    var response = await client.post(Uri.parse(API_URL),
        headers: headers, body: jsonEncode(payload));

    var result = jsonDecode(response.body);

    return result[0]["summary_text"].toString().trim();
  }

  static Future<String> getTranscript(String videoUrl) async {
    String? extractedId = YoutubePlayer.convertUrlToId(videoUrl);

    String API_URL = "${Env.key2}$extractedId";

    var client = http.Client();

    var response = await client.get(Uri.parse(API_URL));

    var result = jsonDecode(response.body);

    return result["transcript"];
  }
}
