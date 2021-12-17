class LanguageCard {
  int id;
  String lang1;
  String lang2;
  String genreGroup;
  int? level;

  LanguageCard(
      {required this.id,
      required this.lang1,
      required this.lang2,
      this.genreGroup = "",
      this.level});
}
