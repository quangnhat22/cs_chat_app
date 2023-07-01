import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class OtherLocalDataSrc {
  static Box? _box;
  final String _otherBox = "other_box";
  final String _locationTurnOnKey = "_locationTurnOnKey";
  final String _newLocationKey = "_newLocationKey";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_otherBox);
    return _box!;
  }

  Future<void> setLocationTurnOn() async {
    await _openBox().then((box) async {
      await box.put(_locationTurnOnKey, true);
    });
  }

  Future<void> setLocationTurnOff() async {
    await _openBox().then((box) async {
      await box.put(_locationTurnOnKey, false);
    });
  }

  Stream<bool> getLocationStatusStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _locationTurnOnKey).map((event) {
      return event.value;
    });
  }

  Future<void> setNewLocation() async {
    await _openBox().then((box) async {
      await box.put(_newLocationKey, true);
    });
  }

  Future<void> removeNewLocation() async {
    await _openBox().then((box) async {
      await box.put(_newLocationKey, false);
    });
  }

  Stream<bool> getNewLocation() async* {
    final box = await _openBox();
    yield* box.watch(key: _newLocationKey).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxOther() async {
    await _openBox().then((_) async {
      await Hive.box(_otherBox).clear();
    });
  }
}
