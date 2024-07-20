import 'dart:async';

import 'package:porfoliov7/bloc/data_collector/data_collector_event.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_state.dart';
import 'package:bloc/bloc.dart';
import 'package:porfoliov7/networks/data_networks_nwt.dart';

class DataCollectorBloc extends Bloc<DataCollectorEvent, DataCollectorState> {
  final dataNetworks = DataNetworks();

  DataCollectorBloc() : super(DataCollectionInitState()) {
    on<DataCollectionFailedEvent>(
        (event, emit) => emit(DataCollectionFailedState()));
    on<DataCollectionCompletedEvent>(onDataCollectionCompleted);
  }


  FutureOr<void> onDataCollectionCompleted(DataCollectionCompletedEvent event, Emitter<DataCollectorState> emit) async{
    final gitData = await dataNetworks.getDataFromGitHub();
    print("calling");
    emit(DataCollectionCompletedState(gitData: gitData));
  }
}
