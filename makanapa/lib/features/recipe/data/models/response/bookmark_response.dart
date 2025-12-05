import 'package:freezed_annotation/freezed_annotation.dart';
part 'bookmark_response.freezed.dart';
part 'bookmark_response.g.dart';

@freezed
abstract class BookmarkResponse with _$BookmarkResponse {
  const BookmarkResponse._();

  const factory BookmarkResponse({
    @JsonKey(name: 'recipe_id', defaultValue: 0) required int id,
    @Default(false) @JsonKey(name: 'is_bookmarked') bool isBookmark,
    @JsonKey(name: 'action_type', defaultValue: '') required String action,
  }) = _BookmarkResponse;

  factory BookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResponseFromJson(json);
}
