import 'package:cache_security/cache_model.dart/base_model.dart';
import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person extends BaseModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;

  Person({
    required this.name,
    required this.age,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  @override
  Person fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
    );
  }
}
