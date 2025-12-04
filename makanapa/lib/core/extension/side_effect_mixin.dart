import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SideEffectMixin<E, S> on BlocBase<S> {
  final _sideEffectController = StreamController<E>.broadcast();

  Stream<E> get sideEffects => _sideEffectController.stream;

  void emitEffect(E effect) {
    if (!_sideEffectController.isClosed) {
      _sideEffectController.add(effect);
    }
  }

  @override
  Future<void> close() {
    _sideEffectController.close();
    return super.close();
  }
}
