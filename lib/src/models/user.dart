import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String userId;
  final String name;
  final String email;

  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
  });

  static const empty = MyUser(
    userId: '',
    email: '',
    name: '',
  );

  @override
  List<Object?> get props => [userId, email, name];
}
