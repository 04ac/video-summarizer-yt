import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video_summary_bloc.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _summaryBloc = VideoSummaryBloc();
  @override
  void initState() {
    // VaXpJm7b-m8
    _summaryBloc.add(GetTranscriptEvent(
        videoUrl: "https://www.youtube.com/watch?v=VaXpJm7b-m8"));
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
                  child:
                      SingleChildScrollView(child: Text(successState.summary)),
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
