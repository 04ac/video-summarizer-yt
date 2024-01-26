import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video_summary_bloc.dart';

class SummaryScreen extends StatefulWidget {
  final String ytVideoUrl;
  final String selectedModel;
  const SummaryScreen(
      {super.key, required this.ytVideoUrl, required this.selectedModel});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _summaryBloc = VideoSummaryBloc();

  @override
  void initState() {
    // VaXpJm7b-m8
    _summaryBloc.add(GetTranscriptEvent(
      videoUrl: widget.ytVideoUrl,
      selectedModel: widget.selectedModel,
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
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case VideoSummaryLoadingState:
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              case VideoSummaryErrorState:
                return const Center(
                    child: Text(
                        "An error occurred... Please enter a valid URL or try again after some time."));
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
                              Text(successState.summary.summaryText),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton.icon(
                            onPressed: () {},
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
