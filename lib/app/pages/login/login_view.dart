import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:inside_trainning/app/pages/login/login_controller.dart';
import 'package:inside_trainning/generated/l10n.dart';

class LoginView extends CleanView {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends CleanViewState<LoginView, LoginController> {
  _LoginViewState() : super(LoginController());

  @override
  Widget get view {
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        body: ControlledWidgetBuilder<LoginController>(
          builder: (context, controller) {
            return _buildBody(context, controller);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, LoginController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).login_page_title,
          ),
          SizedBox(height: 20),
          !controller.isBiometricAvailable
              ? GestureDetector(
                  onTap: (() {
                    controller.fingerAuthLogin();
                  }),
                  child: Icon(
                    Icons.fingerprint,
                    size: 80,
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(S.of(context).login_page_buttom, style: TextStyle(color: Colors.white)),
                  ),
                ),
          SizedBox(height: 20),
          Text(controller.device.id.toString(), style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
