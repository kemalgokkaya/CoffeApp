import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipe_instruction.dart';

part 'coffe_model.freezed.dart';
part 'coffe_model.g.dart';

@freezed
class CoffeModel with _$CoffeModel {
  factory CoffeModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: '@context') String? context,
    @JsonKey(name: '@type') String? type,
    String? name,
    String? image,
    String? description,
    String? recipeYield,
    String? datePublished,
    String? prepTime,
    String? totalTime,
    List<String>? recipeIngredient,
    List<RecipeInstruction>? recipeInstructions,
    String? category,
  }) = _CoffeModel;

  factory CoffeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeModelFromJson(json);
}
