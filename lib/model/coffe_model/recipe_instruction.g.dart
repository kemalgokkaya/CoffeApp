// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeInstructionImpl _$$RecipeInstructionImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeInstructionImpl(
      type: json['@type'] as String?,
      name: json['name'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$RecipeInstructionImplToJson(
        _$RecipeInstructionImpl instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'name': instance.name,
      'text': instance.text,
      'image': instance.image,
    };
