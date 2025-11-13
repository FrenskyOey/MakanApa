part of 'router.dart';

Listenable? _refreshListener(Ref ref) {
  return ref.read(routerRefreshNotifierProvider);
}

class RouterRefreshNotifier extends ChangeNotifier {
  final Ref ref;

  RouterRefreshNotifier(this.ref) {
    _listenAuthChanges();
  }

  void _listenAuthChanges() {
    ref.listen(tokenProvider, (previous, next) {
      if (previous != next) notifyListeners();
    });
  }
}

final routerRefreshNotifierProvider = Provider<RouterRefreshNotifier>((ref) {
  return RouterRefreshNotifier(ref);
});
