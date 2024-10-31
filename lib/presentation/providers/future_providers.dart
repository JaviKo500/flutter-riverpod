import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
// @riverpod
Future<String> pokemonName(PokemonNameRef ref) async {
  final pokemonId = ref.watch( pokemonIdProvider );
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  ref.onDispose(() {
    if (kDebugMode) {
      print('<----------- FutureProviders  ---------------->');
      print('delete provider');
    }
  },);
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  void nextPokemon() => state++;
  void previousPokemon() {
    if (state > 1) {
      state--;
    }
  }
}


// * family provider
@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}