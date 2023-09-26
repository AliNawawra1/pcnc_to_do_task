import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../core/enum/support_state.dart';

class AuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  final Rx<SupportState> _supportState = SupportState.unknown.obs;
  RxBool? _canCheckBiometrics;
  final RxString _authorized = 'Not Authorized'.obs;
  final RxBool _isAuthenticating = false.obs;

  //getters
  String get authorized => _authorized.value;

  bool get isAuthenticating => _isAuthenticating.value;

  //methods

  @override
  void onInit() {
    super.onInit();
    _checkBiometricsSupport();
    _checkBiometrics();
  }

  Future<void> _checkBiometricsSupport() async {
    try {
      final isSupported = await auth.isDeviceSupported();
      _supportState.value =
          isSupported ? SupportState.supported : SupportState.unsupported;
    } catch (e) {
      //
    }
  }

  Future<void> _checkBiometrics() async {
    try {
      final canCheckBiometrics = await auth.canCheckBiometrics;
      _canCheckBiometrics = canCheckBiometrics.obs;
    } catch (e) {
      _canCheckBiometrics = false.obs;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      _isAuthenticating.value = true;
      _authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      _authorized.value = 'Error - ${e.toString()}';
    } finally {
      _isAuthenticating.value = false;
    }

    _authorized.value = authenticated ? 'Authorized' : 'Not Authorized';
  }
}
