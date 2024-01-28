import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../bloc/video_summary_bloc.dart';

class SummaryScreen extends StatefulWidget {
  final String ytVideoUrl;
  final String selectedModel;
  final double partitionNum;

  const SummaryScreen(
      {super.key,
      required this.ytVideoUrl,
      required this.selectedModel,
      required this.partitionNum});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _summaryBloc = VideoSummaryBloc();
  final _dialogTec = TextEditingController();

  @override
  void initState() {
    // VaXpJm7b-m8
    _summaryBloc.add(GetTranscriptEvent(
      videoUrl: widget.ytVideoUrl,
      selectedModel: widget.selectedModel,
      partitionNum: widget.partitionNum,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Summary!")),
      body: BlocProvider(
        create: (context) => _summaryBloc,
        child: BlocConsumer<VideoSummaryBloc, VideoSummaryState>(
          listenWhen: (previous, current) => current is VideoSummaryActionState,
          buildWhen: (previous, current) => current is! VideoSummaryActionState,
          listener: (context, state) {
            switch (state.runtimeType) {
              case SummarySavedSuccessState:
                const snackBar = SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Summary Saved."),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              case SummarySaveErrorState:
                const snackBar = SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.error_outline),
                      Text("Oops! an error occured"),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case GetTranscriptLoadingState:
                return Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                  width: double.maxFinite,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hang on tight!\nFetching video transcript.",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 6.0,
                        ),
                      ),
                    ],
                  ),
                );
              case VideoSummaryLoadingState:
                return const SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hang on tight!\nWe're generating your summary.",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 6.0,
                        ),
                      ),
                    ],
                  ),
                );
              case VideoSummaryErrorState:
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      (state as VideoSummaryErrorState).message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              case VideoSummarySuccessState:
                final successState = state as VideoSummarySuccessState;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    child: Stack(
                      children: [
                        // Summary text and elevated save summary button (fab style)
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Here's your Summary:",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SelectableText(successState.summary.summaryText),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              await Share.share(
                                  'Summary Generated by YT Video Summarizer app\n\nVideo URL: ${successState.summary.videoUrl}\n\n${successState.summary.summaryText}');
                            },
                            style: ElevatedButton.styleFrom(
                              // Save Summary fab
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 20,
                                right: 20,
                              ),
                              elevation: 6,
                            ),
                            child: const Icon(Icons.share),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (!_summaryBloc.clicked) {
                                _summaryBloc.add(
                                    SaveSummaryBtnClickedActionEvent(
                                        summary: successState.summary));
                                _summaryBloc.clicked = true;
                              }
                            },
                            icon: const Icon(Icons.save),
                            label: const Text("Save Summary"),
                            style: ElevatedButton.styleFrom(
                              // Save Summary fab
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 20,
                                right: 20,
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
