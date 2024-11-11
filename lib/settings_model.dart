class Settings {
  String title;
  String backgroundColor;

  Settings({required this.title, required this.backgroundColor});

  Map<String, dynamic> toJson() => {
        'title': title,
        'backgroundColor': backgroundColor,
      };

  static Settings fromJson(Map<String, dynamic> json) {
    return Settings(
      title: json['title'],
      backgroundColor: json['backgroundColor'],
    );
  }
}