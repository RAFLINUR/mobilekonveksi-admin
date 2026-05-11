class UserModel {
  final String nama;
  final String id;

  UserModel({
    required this.nama,
    required this.id,
  });

  String get initial {
    List<String> words = nama.split(" ");
    return words.length > 1
        ? words[0][0] + words[1][0]
        : words[0][0];
  }
}