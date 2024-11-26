import 'package:equatable/equatable.dart';

abstract class DataCollectorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DataCollectionCompletedEvent extends DataCollectorEvent {}

class DataCollectionInitEvent extends DataCollectorEvent {}

class DataCollectionFailedEvent extends DataCollectorEvent {}
class RetryFetchEvent extends DataCollectorEvent {}
