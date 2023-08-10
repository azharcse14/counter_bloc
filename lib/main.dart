import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if(state is UpdateCounter){
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      context.read<CounterBloc>().add(IncreaseEvent());
                    }, child: const Icon(Icons.add),),
                    const SizedBox(height: 20,),

                    Text(state.count.toString(), style: TextStyle(fontSize: 20),),

                    const SizedBox(height: 20,),

                    ElevatedButton(onPressed: () {
                      context.read<CounterBloc>().add(DecreaseEvent());
                    }, child: const Icon(Icons.remove),),
                  ],
                )
            );
          }

          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    context.read<CounterBloc>().add(IncreaseEvent());
                  }, child: const Icon(Icons.add),),
                  const SizedBox(height: 20,),

                  Text('0', style: TextStyle(fontSize: 20),),

                  const SizedBox(height: 20,),

                  ElevatedButton(onPressed: () {
                    context.read<CounterBloc>().add(DecreaseEvent());
                  }, child: const Icon(Icons.remove),),
                ],
              )
          );

        },
      ),
    );
  }
}
