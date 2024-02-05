import 'package:rearch/rearch.dart';
import 'package:rearch_listener_issue/utils.dart';

(WSState, void Function(WSState)) _wsStateManager(CapsuleHandle use) =>
    use.state(WSState.disconnected);

// void Function() startWsSimulation(CapsuleHandle use) {
//   return () {};
// }

WsController wsControllerCapsule(CapsuleHandle use) {
  final wsSetState = use(_wsStateManager).$2;

  return (
    tryConnect: () async {
      wsSetState(WSState.connecting);

      await sleep(10);

      wsSetState(WSState.disconnected);
    }
  );
}

WSState wsStateCapsule(CapsuleHandle use) => use(_wsStateManager).$1;

enum WSState {
  disconnected,
  connecting,
  connected,
}

typedef WsController = ({
  void Function() tryConnect,
});
