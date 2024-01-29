import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_summariser_yt/enter_video_details/ui/enter_video_details_screen.dart';
import 'package:video_summariser_yt/saved_summary_list/bloc/saved_summary_list_bloc.dart';
import 'package:video_summariser_yt/widgets/saved_summary_list_item.dart';

class SavedSummaryListScreen extends StatefulWidget {
  const SavedSummaryListScreen({super.key});

  @override
  State<SavedSummaryListScreen> createState() => _SavedSummaryListScreenState();
}

class _SavedSummaryListScreenState extends State<SavedSummaryListScreen> {
  final bloc = SavedSummaryListBloc();

  void retrieveData() {
    bloc.add(SavedSummaryListLoadEvent());
  }

  @override
  void initState() {
    retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Summaries"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterVideoDetailsScreen()))
              .whenComplete(retrieveData);
        },
        backgroundColor: Colors.lightGreen.shade500,
        splashColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<SavedSummaryListBloc, SavedSummaryListState>(
          listenWhen: (previous, current) =>
              current is SavedSummaryListActionState,
          buildWhen: (previous, current) =>
              current is! SavedSummaryListActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case SummariesFetchedSuccessState:
                return ListView.builder(
                  itemCount:
                      (state as SummariesFetchedSuccessState).summaries.length,
                  itemBuilder: (context, index) {
                    final summaries = state.summaries;
                    return SavedSummaryListItem(
                      summaries: summaries,
                      index: index,
                      onPressed: () {
                        bloc.add(SavedSummaryListDeleteEvent(
                            id: summaries[index].id));
                      },
                    );
                  },
                );
              default:
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: const Center(
                    child: Text(
                      "No Summaries Found\nAdd a new Summary.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
