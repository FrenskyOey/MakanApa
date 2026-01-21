/*
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/states/data_state.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateUiState>
    with SideEffectMixin<TemplateEffect, TemplateUiState> {
  final TemplateRepository _repository;

  TemplateBloc({required TemplateRepository repository})
    : _repository = repository,
      super(TemplateUiState()) {
    // register event Handler
    on<LoadEvent>(_onLoadData);
    on<OpenDataEvent>(_onOpenPlanItem);
  }

  Future<void> _onLoadData(
    LoadEvent event,
    Emitter<TemplateUiState> emit,
  ) async {
    emit(
      state.copyWith(
        state: const Loading(),
        detailData: event.item,
        isDataLoaded: false,
      ),
    );
    await Future.delayed(Duration(milliseconds: 500));

    if (isClosed) {
      return;
    }

    final result = await _repository.getTemplateList();

    if (isClosed) {
      return;
    }
    result.fold(
      (errorMessage) {
        if ((state.state is Success) == false) {
          state.copyWith(state: Success(""), isDataLoaded: true);
          emitEffect(TemplateEffect.toastError("Gagal Ambil Data"));
        }
      },
      (result) {
        emit(state.copyWith(state: Success(""), isDataLoaded: true));
        return;
      },
    );
  }

  Future<void> _onOpenPlanItem(
    OpenDataEvent event,
    Emitter<TemplateUiState> emit,
  ) async {
    emitEffect(TemplateEffect.openData(event.groupId));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
*/
