import 'package:flutter/material.dart';
import 'package:video_summariser_yt/video_summary/models/SummaryDataModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_iframe;

class SavedSummaryListItem extends StatefulWidget {
  const SavedSummaryListItem({
    super.key,
    required this.summaries,
    required this.index,
    required this.onPressed,
  });

  final List<SummaryDataModel> summaries;
  final int index;

  final Function()? onPressed;

  @override
  State<SavedSummaryListItem> createState() => _SavedSummaryListItemState();
}

class _SavedSummaryListItemState extends State<SavedSummaryListItem> {
  final _ytController = yt_iframe.YoutubePlayerController(
    params: const yt_iframe.YoutubePlayerParams(
      mute: true,
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  void initState() {
    String vId =
        YoutubePlayer.convertUrlToId(widget.summaries[widget.index].videoUrl) ??
            "";
    _ytController.cueVideoById(videoId: vId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        border: Border.all(color: Colors.purple.shade200, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            widget.summaries[widget.index].selectedModel,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          yt_iframe.YoutubePlayer(controller: _ytController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: widget.onPressed,
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey.shade600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.copy,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(widget.summaries[widget.index].summaryText),
        ],
      ),
    );
  }
}
