import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_summariser_yt/data/hf_model_list.dart';
import 'package:video_summariser_yt/saved_summary_list/saved_summary_list_screen.dart';
import 'package:video_summariser_yt/video_summary/ui/video_summary_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_iframe;

import '../bloc/enter_video_details_bloc.dart';

class EnterVideoDetailsScreen extends StatefulWidget {
  const EnterVideoDetailsScreen({super.key});

  @override
  State<EnterVideoDetailsScreen> createState() =>
      _EnterVideoDetailsScreenState();
}

class _EnterVideoDetailsScreenState extends State<EnterVideoDetailsScreen> {
  final _vidDetailsBloc = EnterVideoDetailsBloc();
  final _urltec = TextEditingController();

  final _ytPlayerController = yt_iframe.YoutubePlayerController(
    params: const yt_iframe.YoutubePlayerParams(
      mute: true,
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Areen! 👋"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ThemeData.light().primaryColor,
              ),
              child: Column(
                children: [
                  const Text(
                    'YT Video Summarizer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.video_collection_outlined,
                    size: 60,
                    color: Colors.red.shade200,
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: const Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: const Icon(
                Icons.save_outlined,
                color: Colors.grey,
              ),
              title: const Text(
                'Saved Summaries',
              ),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedSummaryListScreen()));
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => _vidDetailsBloc,
        child: BlocListener<EnterVideoDetailsBloc, EnterVideoDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            children: [
              const Text(
                "Lets Generate you a summary!",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.video_collection_outlined),
                  hintText: "Enter Video URL",
                ),
                controller: _urltec,
                onChanged: (newVal) {
                  String vId = YoutubePlayer.convertUrlToId(_urltec.text) ?? "";
                  _ytPlayerController.cueVideoById(videoId: vId);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              yt_iframe.YoutubePlayer(
                controller: _ytPlayerController,
                aspectRatio: 16 / 9,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<EnterVideoDetailsBloc, EnterVideoDetailsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case EnterVideoDetailsInitial:
                      return DropdownButton<String>(
                        hint: const Text('Please choose a model'),
                        items: hf_model_list.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          if (newVal != null) {
                            _vidDetailsBloc
                                .add(ModelDropdownChangeEvent(newVal: newVal));
                          }
                        },
                      );
                    default:
                      return DropdownButton<String>(
                        hint: Text(_vidDetailsBloc.dropdownValue),
                        items: hf_model_list.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          if (newVal != null) {
                            _vidDetailsBloc
                                .add(ModelDropdownChangeEvent(newVal: newVal));
                          }
                        },
                      );
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Adjust length of summary:"),
              BlocBuilder<EnterVideoDetailsBloc, EnterVideoDetailsState>(
                builder: (context, state) {
                  return Slider(
                    min: -2500,
                    max: -500,
                    value: _vidDetailsBloc.sliderValue,
                    onChanged: (newVal) {
                      _vidDetailsBloc.add(SliderSlideEvent(newVal: newVal));
                    },
                  );
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Short"),
                  Text("Long"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  String url = _urltec.text;
                  String modelSelected = _vidDetailsBloc.dropdownValue;
                  double partitionNum = _vidDetailsBloc.sliderValue * (-1.0);
                  if (url == "" || modelSelected == "Please choose a model") {
                    _vidDetailsBloc.add(FieldsNotFilledErrorEvent());
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          ytVideoUrl: url,
                          selectedModel: modelSelected,
                          partitionNum: partitionNum,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Generate Summary"),
              ),
              const SizedBox(height: 10),
              BlocBuilder<EnterVideoDetailsBloc, EnterVideoDetailsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case FieldsNotFilledState:
                      return const Text("Please fill all fields.");
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
