import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });

  factory User.empty(){
    return const User(id: -1,name: '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }

  @override
  List<Object> get props => [id, name];
}