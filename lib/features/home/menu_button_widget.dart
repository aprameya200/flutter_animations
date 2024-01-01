import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_utils.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget(
      {super.key, required this.pressToOpen, required this.menuIsOpen});

  final Function pressToOpen;
  final bool menuIsOpen;

  @override
  State<MenuButtonWidget> createState() => _MenuButtonWidgetState();
}

class _MenuButtonWidgetState extends State<MenuButtonWidget> {
  // final VoidCallback press;
  late SMIBool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        left: widget.menuIsOpen ? 0 : -100,
        top: widget.menuIsOpen ? 50 : 65,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
              color: widget.menuIsOpen ? pureWhite : darkBlue,
              borderRadius: widget.menuIsOpen
                  ? const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))
                  : const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                widget.menuIsOpen ? const BoxShadow(
                    color: Colors.black54, offset: Offset(0, 10), blurRadius: 8) : const BoxShadow(
                    color: Colors.transparent, offset: Offset(0, 0), blurRadius: 0)
              ]),
          height: 45,
          width: 50,
          child: getGestureDetector(),
        ));
  }

  Widget getGestureDetector(){
    return GestureDetector(
      onTap: () {
        widget.pressToOpen();
      },
      child: RiveAnimation.asset( //learning experience
        "assets/RiveAnimations/menu_button.riv",
        onInit: (artboard) {
          StateMachineController controller = RiveUtils.getRiveController(
              artboard,
              stateMachineName: "State Machine");
          // setState(()
          isMenuOpen = controller.findSMI("isOpen") as SMIBool;
          isMenuOpen.value = true;
          if (isMenuOpen != null) {
            setState(() {
              isMenuOpen.value = true;
            });
          }
        },
      ),
    );
  }
}
