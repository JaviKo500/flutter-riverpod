import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch( pokemonProvider(pokemonId) );
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Future / Pokemon Id: $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data), 
          error: (error, stackTrace) => Text(error.toString()), 
          loading: () => const CircularProgressIndicator(),
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            child: const Icon( Icons.refresh ),
            onPressed: () { 
              pokemonId ++;
              setState(() {
              });
            },
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: UniqueKey(),
            child: const Icon( Icons.minimize_rounded ),
            onPressed: () { 
              if ( pokemonId <= 1 ) return;
              pokemonId --;
              setState(() {
              });
            },
          ),
        ],
      )
    );
  }
}