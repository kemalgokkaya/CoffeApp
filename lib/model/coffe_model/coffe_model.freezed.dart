// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoffeModel _$CoffeModelFromJson(Map<String, dynamic> json) {
  return _CoffeModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '@context')
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get recipeYield => throw _privateConstructorUsedError;
  String? get datePublished => throw _privateConstructorUsedError;
  String? get prepTime => throw _privateConstructorUsedError;
  String? get totalTime => throw _privateConstructorUsedError;
  List<String>? get recipeIngredient => throw _privateConstructorUsedError;
  List<RecipeInstruction>? get recipeInstructions =>
      throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this CoffeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoffeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeModelCopyWith<CoffeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeModelCopyWith<$Res> {
  factory $CoffeModelCopyWith(
          CoffeModel value, $Res Function(CoffeModel) then) =
      _$CoffeModelCopyWithImpl<$Res, CoffeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
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
      String? category});
}

/// @nodoc
class _$CoffeModelCopyWithImpl<$Res, $Val extends CoffeModel>
    implements $CoffeModelCopyWith<$Res> {
  _$CoffeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? context = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? recipeYield = freezed,
    Object? datePublished = freezed,
    Object? prepTime = freezed,
    Object? totalTime = freezed,
    Object? recipeIngredient = freezed,
    Object? recipeInstructions = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeYield: freezed == recipeYield
          ? _value.recipeYield
          : recipeYield // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String?,
      prepTime: freezed == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeIngredient: freezed == recipeIngredient
          ? _value.recipeIngredient
          : recipeIngredient // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recipeInstructions: freezed == recipeInstructions
          ? _value.recipeInstructions
          : recipeInstructions // ignore: cast_nullable_to_non_nullable
              as List<RecipeInstruction>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeModelImplCopyWith<$Res>
    implements $CoffeModelCopyWith<$Res> {
  factory _$$CoffeModelImplCopyWith(
          _$CoffeModelImpl value, $Res Function(_$CoffeModelImpl) then) =
      __$$CoffeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
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
      String? category});
}

/// @nodoc
class __$$CoffeModelImplCopyWithImpl<$Res>
    extends _$CoffeModelCopyWithImpl<$Res, _$CoffeModelImpl>
    implements _$$CoffeModelImplCopyWith<$Res> {
  __$$CoffeModelImplCopyWithImpl(
      _$CoffeModelImpl _value, $Res Function(_$CoffeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? context = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? recipeYield = freezed,
    Object? datePublished = freezed,
    Object? prepTime = freezed,
    Object? totalTime = freezed,
    Object? recipeIngredient = freezed,
    Object? recipeInstructions = freezed,
    Object? category = freezed,
  }) {
    return _then(_$CoffeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeYield: freezed == recipeYield
          ? _value.recipeYield
          : recipeYield // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String?,
      prepTime: freezed == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeIngredient: freezed == recipeIngredient
          ? _value._recipeIngredient
          : recipeIngredient // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recipeInstructions: freezed == recipeInstructions
          ? _value._recipeInstructions
          : recipeInstructions // ignore: cast_nullable_to_non_nullable
              as List<RecipeInstruction>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeModelImpl implements _CoffeModel {
  _$CoffeModelImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: '@context') this.context,
      @JsonKey(name: '@type') this.type,
      this.name,
      this.image,
      this.description,
      this.recipeYield,
      this.datePublished,
      this.prepTime,
      this.totalTime,
      final List<String>? recipeIngredient,
      final List<RecipeInstruction>? recipeInstructions,
      this.category})
      : _recipeIngredient = recipeIngredient,
        _recipeInstructions = recipeInstructions;

  factory _$CoffeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: '@context')
  final String? context;
  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final String? recipeYield;
  @override
  final String? datePublished;
  @override
  final String? prepTime;
  @override
  final String? totalTime;
  final List<String>? _recipeIngredient;
  @override
  List<String>? get recipeIngredient {
    final value = _recipeIngredient;
    if (value == null) return null;
    if (_recipeIngredient is EqualUnmodifiableListView)
      return _recipeIngredient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RecipeInstruction>? _recipeInstructions;
  @override
  List<RecipeInstruction>? get recipeInstructions {
    final value = _recipeInstructions;
    if (value == null) return null;
    if (_recipeInstructions is EqualUnmodifiableListView)
      return _recipeInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? category;

  @override
  String toString() {
    return 'CoffeModel(id: $id, context: $context, type: $type, name: $name, image: $image, description: $description, recipeYield: $recipeYield, datePublished: $datePublished, prepTime: $prepTime, totalTime: $totalTime, recipeIngredient: $recipeIngredient, recipeInstructions: $recipeInstructions, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recipeYield, recipeYield) ||
                other.recipeYield == recipeYield) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.prepTime, prepTime) ||
                other.prepTime == prepTime) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            const DeepCollectionEquality()
                .equals(other._recipeIngredient, _recipeIngredient) &&
            const DeepCollectionEquality()
                .equals(other._recipeInstructions, _recipeInstructions) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      context,
      type,
      name,
      image,
      description,
      recipeYield,
      datePublished,
      prepTime,
      totalTime,
      const DeepCollectionEquality().hash(_recipeIngredient),
      const DeepCollectionEquality().hash(_recipeInstructions),
      category);

  /// Create a copy of CoffeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeModelImplCopyWith<_$CoffeModelImpl> get copyWith =>
      __$$CoffeModelImplCopyWithImpl<_$CoffeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeModelImplToJson(
      this,
    );
  }
}

abstract class _CoffeModel implements CoffeModel {
  factory _CoffeModel(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: '@context') final String? context,
      @JsonKey(name: '@type') final String? type,
      final String? name,
      final String? image,
      final String? description,
      final String? recipeYield,
      final String? datePublished,
      final String? prepTime,
      final String? totalTime,
      final List<String>? recipeIngredient,
      final List<RecipeInstruction>? recipeInstructions,
      final String? category}) = _$CoffeModelImpl;

  factory _CoffeModel.fromJson(Map<String, dynamic> json) =
      _$CoffeModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: '@context')
  String? get context;
  @override
  @JsonKey(name: '@type')
  String? get type;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get description;
  @override
  String? get recipeYield;
  @override
  String? get datePublished;
  @override
  String? get prepTime;
  @override
  String? get totalTime;
  @override
  List<String>? get recipeIngredient;
  @override
  List<RecipeInstruction>? get recipeInstructions;
  @override
  String? get category;

  /// Create a copy of CoffeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeModelImplCopyWith<_$CoffeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
