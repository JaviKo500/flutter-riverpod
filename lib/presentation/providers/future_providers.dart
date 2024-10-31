import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
// @riverpod
Future<String> pokemonName(PokemonNameRef ref) async {
  final pokemonName = await PokemonInformation.getPokemonName(1);
  ref.onDispose(() {
    if (kDebugMode) {
      print('<----------- FutureProviders  ---------------->');
      print('delete provider');
    }
  },);
  return pokemonName;
}