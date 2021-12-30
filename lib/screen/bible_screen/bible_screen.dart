import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bible_bloc.dart';

class BibleScreen extends StatefulWidget {
  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  late BibleBloc bloc;

  @override
  void initState() {
    bloc = BibleBloc()..add(BibleInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bible Screen'),
      ),
      body: BlocListener<BibleBloc, BibleState>(
          listener: (context, state) {},
          bloc: bloc,
          child: BlocBuilder<BibleBloc, BibleState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is BibleLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BibleFailureState) {
                return Text(bloc.message);
              } else if (state is BibleLoadedState) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(bloc.message),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: bloc.bibleList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Number:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(bloc
                                              .bibleList[index].number
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Verse: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child:
                                              Text(bloc.bibleList[index].text!),
                                        )
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //         flex: 1,
                                    //         child: Text(
                                    //           "Chapter: ",
                                    //           style: TextStyle(
                                    //               fontWeight: FontWeight.bold),
                                    //         )),
                                    //     Expanded(
                                    //       flex: 2,
                                    //       child: Text(bloc.chapter[index]),
                                    //     )
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //         flex: 1,
                                    //         child: Text(
                                    //           "Last Name: ",
                                    //           style: TextStyle(
                                    //               fontWeight: FontWeight.bold),
                                    //         )),
                                    //     Expanded(
                                    //       flex: 2,
                                    //       child: Text(
                                    //           bloc.chapter.verses.toString()),
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          )),
    );
  }
}
