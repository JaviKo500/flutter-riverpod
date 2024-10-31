import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType {
  all, completed, pending
}

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void setCurrentFilter(FilterType newFilterType ) {
    state = newFilterType;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() => [
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ];

  void createTodo( String description ) {
    state = [ 
      Todo(id: uuid.v4(), description: description, completedAt: null), 
      ...state, 
    ];
  }

  void toggleTodo( String id ) {
    state = state.map((todo) {
      if ( todo.id == id ) {
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now()
        );
      }
      return todo;
    }).toList();
  }
}