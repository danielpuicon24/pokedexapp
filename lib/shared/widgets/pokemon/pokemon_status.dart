import 'package:flutter/material.dart';
import 'package:pokedexapp/config/theme/app_colors.dart';

class PokemonStatus extends StatelessWidget {
  final String statName;
  final bool isStatName;
  final String statValue;
  final Color color;

  const PokemonStatus({
    super.key,
    required this.statName,
    required this.isStatName,
    required this.statValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * .33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Visibility(
            visible: isStatName,
            child: Container(
              width: width * .2,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                statName,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding:isStatName ? EdgeInsets.all(0.0) : const EdgeInsets.all(12.0),
            child: Text(
              statValue.toString(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
