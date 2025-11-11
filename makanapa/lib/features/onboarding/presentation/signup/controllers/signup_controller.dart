/*
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_controller.g.dart';

@riverpod
class TemplateController extends _$TemplateController {
  final DataState<Template> _template = DataState.Initial();

  @override
  TemplateUIState build() async {
    return TemplateUiState()
  }

  Future<void> loadData() async {
    // do something here 
    final repository = await ref.read(templateRepositoryProvider.future);
    final result = await repository.getTemplate();
    state = .....
  }
  */
