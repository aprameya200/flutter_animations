import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_utils.dart';

class MenuButtonWidget extends StatefulWidget {
  MenuButtonWidget({super.key, required this.pressToOpen});

  final Function pressToOpen;

  @override
  State<MenuButtonWidget> createState() => _MenuButtonWidgetState();
}

class _MenuButtonWidgetState extends State<MenuButtonWidget> {
  // final VoidCallback press;
  late SMIBool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        top: 50,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 20),
                    blurRadius: 10)
              ]),
          height: 45,
          width: 50,
          child: GestureDetector(
            onTap: () {
              isMenuOpen.value = !isMenuOpen.value;
              widget.pressToOpen();
            },
            child: RiveAnimation.asset(
              "assets/RiveAnimations/menu_button.riv",
              onInit: (artboard) {
                print(artboard.toString());
                StateMachineController controller =
                RiveUtils.getRiveController(artboard,
                    stateMachineName: "State Machine");
                // setState(()
                //artboard.addController(controller)
                isMenuOpen = controller.findSMI("isOpen") as SMIBool;
                isMenuOpen.value = true;
                if (isMenuOpen != null) {
                  print(isMenuOpen.type.toString());
                  setState(() {
                    isMenuOpen.value = true;
                  });
                };
              },
            ),
          ),
        ));
  }
}
