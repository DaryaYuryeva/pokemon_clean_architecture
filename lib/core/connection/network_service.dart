import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();

  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  Future<bool> get isConnected => _checkIsConnected();

  Future<bool> _checkIsConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result.last == ConnectivityResult.mobile ||
        result.last == ConnectivityResult.wifi;
  }
}
