import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_instruction.freezed.dart';
part 'recipe_instruction.g.dart';

@freezed
class RecipeInstruction with _$RecipeInstruction {
  factory RecipeInstruction({
    @JsonKey(name: '@type') String? type,
    String? name,
    String? text,
    String? image,
  }) = _RecipeInstruction;

  factory RecipeInstruction.fromJson(Map<String, dynamic> json) =>
      _$RecipeInstructionFromJson(json);
}
