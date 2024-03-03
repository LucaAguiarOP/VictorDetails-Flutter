import 'package:equatable/equatable.dart';
import 'package:victordetailsflutter/user_repository.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String email;
  // final Cars;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
  });

  static const empty = MyUser(id: '', name: '', email: '');

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(id: entity.id, name: entity.name, email: entity.email);
  }

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  @override
  List<Object?> get props => [id, email, name];
}
