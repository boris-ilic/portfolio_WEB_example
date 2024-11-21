import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_detail_model.freezed.dart';
part 'about_detail_model.g.dart';

@freezed
class AboutDetailModel with _$AboutDetailModel {
  const factory AboutDetailModel({
    @Default("") String aboutService,
    @Default([]) List<ServiceModel> services,
  }) = _AboutDetailModel;

  factory AboutDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AboutDetailModelFromJson(json);
}

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @Default("") String title,
    @Default("") String description,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}

extension AboutDetailModelX on AboutDetailModel {
  Map<String, dynamic> toFirestoreJson() {
    return {
      'aboutService': aboutService,
      'services': services
          .map((service) => {
                'title': service.title,
                'description': service.description,
              })
          .toList(),
    };
  }
}
