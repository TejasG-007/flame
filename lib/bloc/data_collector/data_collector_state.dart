import 'package:porfoliov7/model/git_data.dart';

abstract class DataCollectorState {}

class DataCollectionCompletedState extends DataCollectorState {
  GitData? gitData;
  DataCollectionCompletedState({required this.gitData});
}

class DataCollectionInitState extends DataCollectorState {}

class DataCollectionFailedState extends DataCollectorState {}
