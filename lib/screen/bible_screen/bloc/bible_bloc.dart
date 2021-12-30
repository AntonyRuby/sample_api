import 'dart:async';
import 'package:bloc/bloc.dart';

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

  Chapter chapter = Chapter();
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
        chapter = bibleData.chapter!;
        supportText = bibleData.chapter!.number.toString();

        yield BibleLoadedState();
      } else {
        message = bible["data"];
        yield BibleFailureState();
      }
    }
  }
}
