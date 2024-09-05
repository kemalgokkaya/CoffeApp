// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeModelImpl _$$CoffeModelImplFromJson(Map<String, dynamic> json) =>
    _$CoffeModelImpl(
      id: json['_id'] as String?,
      context: json['@context'] as String?,
      type: json['@type'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      recipeYield: json['recipeYield'] as String?,
      datePublished: json['datePublished'] as String?,
      prepTime: json['prepTime'] as String?,
      totalTime: json['totalTime'] as String?,
      recipeIngredient: (json['recipeIngredient'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recipeInstructions: (json['recipeInstructions'] as List<dynamic>?)
          ?.map((e) => RecipeInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$CoffeModelImplToJson(_$CoffeModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '@context': instance.context,
      '@type': instance.type,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'recipeYield': instance.recipeYield,
      'datePublished': instance.datePublished,
      'prepTime': instance.prepTime,
      'totalTime': instance.totalTime,
      'recipeIngredient': instance.recipeIngredient,
      'recipeInstructions': instance.recipeInstructions,
      'category': instance.category,
    };
