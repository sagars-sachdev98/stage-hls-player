import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_list.model.freezed.dart';
part 'video_list.model.g.dart';

@freezed
class VideoListModel with _$VideoListModel {
  factory VideoListModel({
    String? thumbnail,
    String? title,
    String? year,
    String? url
  }) = _VideoListModel;

  factory VideoListModel.fromJson(Map<String, dynamic> json) =>
      _$VideoListModelFromJson(json);
}
