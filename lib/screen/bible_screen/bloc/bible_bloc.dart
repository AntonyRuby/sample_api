import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../base_equtable.dart';
import '../../../models/bible_models/bible.dart';
import '../../../models/bible_models/chapter.dart';
import '../../../models/bible_models/verse.dart';
import '../../../respository/repository.dart';

part 'bible_event.dart';
part 'bible_state.dart';

class BibleBloc extends Bloc<BibleEvent, BibleState> {
  BibleBloc() : super(BibleInitial());

  List<Verse> bibleList = [];
  // List<dynamic> chapter = [];
  // Chapter chapter;
  String supportText = "";
  String message = '';

  @override
  Stream<BibleState> mapEventToState(
    BibleEvent event,
  ) async* {
    if (event is BibleInitialEvent) {
      yield BibleLoadingState();

      Map<String, dynamic> bible = await getBibleData();

      if (bible["success"] == true) {
        Map<String, dynamic> jsonData = bible["data"];
        Bible bibleData = Bible.fromJson(jsonData);
        bibleList = bibleData.verses!;
        supportText = bibleData.chapter!.number.toString();

        // Map<String, dynamic> jsonData = json.decode(bible["data"]);
        // Bible bibleObject = Bible.fromJson(jsonData);

        yield BibleLoadedState();
      } else {
        message = bible["data"];
        yield BibleFailureState();
      }
    }
  }
}
