import 'package:rearch/rearch.dart';
import 'package:rearch_listener_issue/loading_mode.capsule.dart';
import 'package:rearch_listener_issue/utils.dart';
import 'package:rearch_listener_issue/websocket.capsules.dart';

void main(List<String> arguments) async {
  print('Starting ReArch Websocket Issue Example!');

  final cc = CapsuleContainer();

  // Listener #1 -- Loading mode
  final cancelLoadingModeListener = cc.listen((use) {
    final loadingCtrl = use(loadingModeCapsule);

    print('Loading mode listener -- Loading: ${loadingCtrl.loading}');
  });

  // Listener #2 -- WS state
  final cancelWSStaateListener = cc.listen((use) {
    final wsState = use(wsStateCapsule);

    print('Ws State listener -- State: $wsState');

    final loadingCtrl = use(loadingModeCapsule);
    final wsController = use(wsControllerCapsule);

    if (wsState == WSState.disconnected) {
      loadingCtrl.on();

      sleep(10).then((value) {
        wsController.tryConnect();
      });
    }
  });

  await Future.delayed(const Duration(days: 99));
}
