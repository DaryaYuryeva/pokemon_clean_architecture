import 'package:equatable/equatable.dart';

import '../../../../core/constants.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  int get id {
    final idString = url.replaceAll(Constants.baseUrl, '').replaceAll('/', '');
    return int.parse(idString);
  }

  @override
  List<Object?> get props => [name, url];
}
