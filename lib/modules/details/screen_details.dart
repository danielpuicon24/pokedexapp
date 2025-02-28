import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';

import '../../config/constants/colors_pokemon.dart';
import '../../config/services/service_navigation.dart';
import '../../config/theme/app_colors.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemon});

  final EntidadPokemon pokemon;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double> _colorGradientValue;
  late Animation<double> _whiteGradientValue;

  late bool _changeToBlack;
  late bool _enableInfoItems;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );

    _whiteGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0.1, 1, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );

    _changeToBlack = false;
    _enableInfoItems = false;

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller!.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });

    _controller!.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!
      ..removeStatusListener(_statusListener)
      ..dispose();
    super.dispose();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _enableInfoItems = true;
      });
    }
  }

  Future<void> _backButtonTap() async {
    setState(() {
      _enableInfoItems = false;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _changeToBlack = false;
      });
    });
    _controller!.reverse().then((value) => ServiceNavigation.goBack());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: '${widget.pokemon.name}background',
              child: AnimatedBuilder(
                animation: _controller!,
                builder: (_, __) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(getPokemonColor(widget.pokemon.types.first).value),

                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          _colorGradientValue.value,
                          _whiteGradientValue.value,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Hero(
                    tag: widget.pokemon.imageUrl!,
                    child: Image.network(
                      widget.pokemon.imageUrl!,
                      height: size.height * .55,
                      width: size.width,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        heightFactor: .7,
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: Hero(
                            tag: widget.pokemon.name!,
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              style: textTheme.displayMedium!.copyWith(
                                color:
                                    _changeToBlack
                                        ? Colors.black
                                        : Colors.white,
                              ),
                              child: Text(
                                capitalizeFirstLetter(widget.pokemon.name!),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            'Types:',
                            style: textTheme.headlineMedium!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            widget.pokemon.types.join(", ").toUpperCase(), // Une los tipos con coma y espacio
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(height: 30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            'Abilities',
                            style: textTheme.headlineMedium!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: widget.pokemon.abilities!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final pkm = widget.pokemon.abilities![index];
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 1000 + (300 * index)),
                        curve: Curves.elasticOut,
                        tween: Tween(
                          begin: 0,
                          end: _enableInfoItems ? 0.0 : 1.0,
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 50 * value),
                            child: Opacity(
                              opacity: 1 - value.clamp(0.0, 1.0),
                              child: child,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(pkm.toUpperCase()),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: Hero(
                tag: 'back.button.tag',
                child: Material(
                  color: Colors.transparent,
                  child:  GestureDetector(
                    onTap: _backButtonTap,
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.textPrimaryColor,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
