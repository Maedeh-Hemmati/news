import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String? name;

  const Source({
    this.id,
    this.name,
  });

  @override
  List<String?> get props => [
        id,
        name,
      ];
}
