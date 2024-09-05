// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeInstruction _$RecipeInstructionFromJson(Map<String, dynamic> json) {
  return _RecipeInstruction.fromJson(json);
}

/// @nodoc
mixin _$RecipeInstruction {
  @JsonKey(name: '@type')
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this RecipeInstruction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeInstructionCopyWith<RecipeInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeInstructionCopyWith<$Res> {
  factory $RecipeInstructionCopyWith(
          RecipeInstruction value, $Res Function(RecipeInstruction) then) =
      _$RecipeInstructionCopyWithImpl<$Res, RecipeInstruction>;
  @useResult
  $Res call(
      {@JsonKey(name: '@type') String? type,
      String? name,
      String? text,
      String? image});
}

/// @nodoc
class _$RecipeInstructionCopyWithImpl<$Res, $Val extends RecipeInstruction>
    implements $RecipeInstructionCopyWith<$Res> {
  _$RecipeInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeInstructionImplCopyWith<$Res>
    implements $RecipeInstructionCopyWith<$Res> {
  factory _$$RecipeInstructionImplCopyWith(_$RecipeInstructionImpl value,
          $Res Function(_$RecipeInstructionImpl) then) =
      __$$RecipeInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@type') String? type,
      String? name,
      String? text,
      String? image});
}

/// @nodoc
class __$$RecipeInstructionImplCopyWithImpl<$Res>
    extends _$RecipeInstructionCopyWithImpl<$Res, _$RecipeInstructionImpl>
    implements _$$RecipeInstructionImplCopyWith<$Res> {
  __$$RecipeInstructionImplCopyWithImpl(_$RecipeInstructionImpl _value,
      $Res Function(_$RecipeInstructionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? image = freezed,
  }) {
    return _then(_$RecipeInstructionImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeInstructionImpl implements _RecipeInstruction {
  _$RecipeInstructionImpl(
      {@JsonKey(name: '@type') this.type, this.name, this.text, this.image});

  factory _$RecipeInstructionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeInstructionImplFromJson(json);

  @override
  @JsonKey(name: '@type')
  final String? type;
  @override
  final String? name;
  @override
  final String? text;
  @override
  final String? image;

  @override
  String toString() {
    return 'RecipeInstruction(type: $type, name: $name, text: $text, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeInstructionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, text, image);

  /// Create a copy of RecipeInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeInstructionImplCopyWith<_$RecipeInstructionImpl> get copyWith =>
      __$$RecipeInstructionImplCopyWithImpl<_$RecipeInstructionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeInstructionImplToJson(
      this,
    );
  }
}

abstract class _RecipeInstruction implements RecipeInstruction {
  factory _RecipeInstruction(
      {@JsonKey(name: '@type') final String? type,
      final String? name,
      final String? text,
      final String? image}) = _$RecipeInstructionImpl;

  factory _RecipeInstruction.fromJson(Map<String, dynamic> json) =
      _$RecipeInstructionImpl.fromJson;

  @override
  @JsonKey(name: '@type')
  String? get type;
  @override
  String? get name;
  @override
  String? get text;
  @override
  String? get image;

  /// Create a copy of RecipeInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeInstructionImplCopyWith<_$RecipeInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
