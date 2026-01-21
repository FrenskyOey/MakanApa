/*
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_controller.g.dart';

@riverpod
class TemplateController extends _$TemplateController {

  late TemplateRepository _repo;
  bool _mounted = true;

  final _eventController = StreamController<TemplateEventState>.broadcast();
  Stream<TemplateEventState> get events => _eventController.stream;

  @override
  TemplateUIState build() {
     _repo = ref.read(templateRepositoryProvider);
    _mounted = true;

    ref.onDispose(() {
      _mounted = false;
      _eventController.close();
    });

    return TemplateUiState()
  }

  Future<void> loadData() async {
     state = state.copyWith(state = const Loading());
    await Future.delayed(Duration(seconds: 2));
    if (!_mounted) return;

    final results = await _repo.getTemplateList();
    if (!_mounted) return;
    results.fold(
      (errorMessage) {
        if ((state.state is Success) == false) {
          state.copyWith(state: Success(""), isDataLoaded: true);
          _eventController.add(TemplateEventState.toastError(errorMessage));
        }
      },
      (result) {
        //blablabla
        emit(state.copyWith(state: Success(result), isDataLoaded: true));
        return;
      }
    );
  }
  */
