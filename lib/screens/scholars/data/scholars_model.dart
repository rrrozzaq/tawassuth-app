class ScholarsModel {
  final String topic;
  final String desc;
  final List<SourceModel> sources;

  ScholarsModel({
    required this.topic,
    required this.desc,
    required this.sources,
  });

  // TODO : add fromJson Maping method
}

class SourceModel {
  final String source;
  final String desc;

  SourceModel({required this.source, required this.desc});

  // TODO : add fromJson Maping method
}
