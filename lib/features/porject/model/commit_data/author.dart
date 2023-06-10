import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String? name;
  final String? email;
  final String? date;

  const Author({this.name, this.email, this.date});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json['name'] as String?,
        email: json['email'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'date': date,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, email, date];
}
