import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/my_pokemon_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final void Function() onPressedLeftButton;
  final Widget leftButtonChild;
  final bool disabledConditionLeftButton;
  final void Function() onPressedRightButton;
  final Widget rightButtonChild;
  final bool disabledConditionRightButton;
  final String middleText;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onPressedLeftButton,
    required this.leftButtonChild,
    required this.disabledConditionLeftButton,
    required this.onPressedRightButton,
    required this.rightButtonChild,
    required this.disabledConditionRightButton,
    required this.middleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(shape: CircleBorder()),
          onPressed: disabledConditionLeftButton ? null : onPressedLeftButton,
          child: leftButtonChild,
        ),
        Text(
          middleText,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(shape: CircleBorder()),
          onPressed: disabledConditionRightButton ? null : onPressedRightButton,
          child: rightButtonChild,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPokemonPage(),
              ),
            );
          },
          child: Text(
            "Go to my pokemons",
          ),
        ),
      ],
    );
  }
}
