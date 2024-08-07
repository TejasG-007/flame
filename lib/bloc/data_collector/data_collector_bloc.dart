import 'dart:async';
import 'dart:developer';

import 'package:porfoliov7/bloc/data_collector/data_collector_event.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_state.dart';
import 'package:bloc/bloc.dart';
import 'package:porfoliov7/networks/data_networks_nwt.dart';
import '../../model/git_data.dart';

class DataCollectorBloc extends Bloc<DataCollectorEvent, DataCollectorState> {
  final dataNetworks = DataNetworks();

  DataCollectorBloc() : super(DataCollectionInitState()) {
    on<DataCollectionInitEvent>(_onInitState);
    on<DataCollectionFailedEvent>(
            (event, emit) => emit(DataCollectionFailedState()));
  }

  Future<void> _onInitState(DataCollectionInitEvent event, Emitter<DataCollectorState> emit) async {
    try {
      final gitData = await dataNetworks.getDataFromGitHub();
      if (gitData != null) {
        log("Data received: ${gitData.personalData.name}");  // Debug statement
        emit(DataCollectionCompletedState(gitData: gitData));
      } else {
        log("Data is null");  // Debug statement
        emit(DataCollectionFailedState());
      }
    } catch (e) {
      log("Error: $e");  // Debug statement
      emit(DataCollectionFailedState());
    }
  }
}


