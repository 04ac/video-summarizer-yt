import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_summariser_yt/data/hf_model_list.dart';
import 'package:video_summariser_yt/video_summary/ui/video_summary_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Text("Welcome Areen! 👋"),
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
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<EnterVideoDetailsBloc, EnterVideoDetailsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case ModelSelectedState:
                      var currState = state as ModelSelectedState;
                      return DropdownButton<String>(
                        hint: Text(currState.selectedModel),
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
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  String url = _urltec.text;
                  String modelSelected = _vidDetailsBloc.dropdownValue;
                  if (url == "" || modelSelected == "") {
                    _vidDetailsBloc.add(FieldsNotFilledErrorEvent());
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          ytVideoUrl: url,
                          selectedModel: modelSelected,
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
