import 'package:equatable/equatable.dart';
import 'package:porfoliov7/model/git_data.dart';

abstract class DataCollectorState extends Equatable{
  @override
  List<Object?> get props =>[];
}

class DataCollectionCompletedState extends DataCollectorState {
  final GitData gitData;
  DataCollectionCompletedState({required this.gitData});
  @override
  List<Object?> get props=>[gitData];
}

class DataCollectionInitState extends DataCollectorState {}

class DataCollectionFailedState extends DataCollectorState {}
