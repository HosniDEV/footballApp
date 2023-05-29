class CountryModel {
  String? name;
  String? code;
  String? flag;
  CountryModel({
    this.name,
    this.flag,
    this.code,
  });
  factory CountryModel.fromJson(Map<String, dynamic> data) {
    return CountryModel(
      name: data['name'],
      code: data['code'],
      flag: data['flag'],
    );
  }
}
