import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'effect.dart';
import 'state.dart';
import 'reducer.dart';

/// get the component page
final state = GetIt.instance<CounterState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home('Home'),
    );
  }
}



class Home extends StatelessWidget {
  final String title;

  Home(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TimerTextWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            read();
            add();
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class TimerTextWidget extends StatelessWidget {
  const TimerTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: state,
      builder: (context, counter, child) {
        print('building counter state');
        return Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
