import 'package:flutter/material.dart';
import '../workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      // Scaffold - скелет страницы
      child: Scaffold(
        backgroundColor:
            Theme.of(context).primaryColor, // такой же цвет как и сначала
        appBar: AppBar(
          title: Text('LoginRegister'),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = [
    (
      title: 'Test1',
      author: 'Max1',
      description: 'Test Workout1',
      level: 'Beginer'
    ),
    (
      title: 'Test2',
      author: 'Max2',
      description: 'Test Workout2',
      level: 'Advanced'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0, //подятие карточки над поверхонстью
                margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical:
                        4), // отступы симметричны с помощью виджета EdgeInsets
                child: Container(
                  // Container помозволяет легко поменять параметры child
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12), // отступ справа 12
                      child: Icon(Icons.fitness_center,
                          color: Theme.of(context).primaryColor),
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.white24)),
                      ),
                    ),
                    title: Text(workouts[i].title,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight:
                                FontWeight.bold)), // вывод на экран текста
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
