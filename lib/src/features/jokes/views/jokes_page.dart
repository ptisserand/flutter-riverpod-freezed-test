import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_test/src/features/jokes/logic/jokes_provider.dart';

class JokesPage extends StatelessWidget {
  // JokesPage constructor
  JokesPage({Key? key}) : super(key: key);

  //JokesPage routename
  static const routeName = 'JokesPage';

  // Router for JokesPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => JokesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Jokes'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _JokeConsumer(),
            const SizedBox(
              height: 50,
            ),
            _ButtonConsumer(),
          ],
        ),
      ),
    );
  }
}

class _JokeConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(jokesNotifierProvider);
    return state.when(
      initial: () => Text(
        'Press the button to Start',
        textAlign: TextAlign.center,
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      data: (joke) => Text('${joke.setup}\n${joke.delivery}'),
      error: (error) => Text('$error'),
    );
  }
}

class _ButtonConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(jokesNotifierProvider);
    return ElevatedButton(
      child:
          !state.isLoading ? Text('Press me to get a joke') : Text('Loading'),
      onPressed: !state.isLoading
          ? () {
              context.read(jokesNotifierProvider.notifier).getJoke();
            }
          : null,
    );
  }
}
