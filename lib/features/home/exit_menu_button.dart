import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_utils.dart';

class ExitMenuButtonWidget extends StatefulWidget {
  const ExitMenuButtonWidget(
      {super.key, required this.pressToOpen, required this.menuIsOpen});

  final Function pressToOpen;
  final bool menuIsOpen;

  @override
  State<ExitMenuButtonWidget> createState() => _ExitMenuButtonWidgetState();
}

class _ExitMenuButtonWidgetState extends State<ExitMenuButtonWidget> {
  // final VoidCallback press;
  late SMIBool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        left: widget.menuIsOpen ? 160 : 210,
        top:  65,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    color: Colors.transparent, offset: Offset(0, 0), blurRadius: 0)
              ]),
          height: 45,
          width: widget.menuIsOpen ? 0 : 50,
          duration: const Duration(milliseconds: 90),
          child: GestureDetector(
            onTap: () {
              isMenuOpen.value = isMenuOpen.value;
               widget.pressToOpen();
            },
            child:
            RiveAnimation.asset(
              "assets/RiveAnimations/menu_button.riv",
              onInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                // setState(()
                isMenuOpen = controller.findSMI("isOpen") as SMIBool;
                isMenuOpen.value = false;
                if (isMenuOpen != null) {
                  setState(() {
                    isMenuOpen.value = false;
                  });
                }
                ;
              },
            ),
          ),
        ));
  }
}
