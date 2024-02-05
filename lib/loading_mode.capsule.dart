import 'package:rearch/rearch.dart';

LoadingModeController loadingModeCapsule(CapsuleHandle use) {
  final (loading, setLoading) = use.state(false);

  return (
    loading: loading,
    toggle: () => setLoading(!loading),
    // on: () => setLoading(true),
    on: () {
      print('Setting loading mode ON -- current: $loading');
      setLoading(true);
    },
    // off: () => setLoading(false),
    off: () {
      print('Setting loading mode OFF -- current: $loading');
      setLoading(false);
    },
  );
}

typedef LoadingModeController = ({
  bool loading,
  void Function() toggle,
  void Function() on,
  void Function() off,
});
