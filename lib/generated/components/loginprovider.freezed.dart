// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../components/loginprovider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginProviderState {
  AsyncValue<User?> get firebaseUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginProviderStateCopyWith<LoginProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginProviderStateCopyWith<$Res> {
  factory $LoginProviderStateCopyWith(
          LoginProviderState value, $Res Function(LoginProviderState) then) =
      _$LoginProviderStateCopyWithImpl<$Res>;
  $Res call({AsyncValue<User?> firebaseUser});
}

/// @nodoc
class _$LoginProviderStateCopyWithImpl<$Res>
    implements $LoginProviderStateCopyWith<$Res> {
  _$LoginProviderStateCopyWithImpl(this._value, this._then);

  final LoginProviderState _value;
  // ignore: unused_field
  final $Res Function(LoginProviderState) _then;

  @override
  $Res call({
    Object? firebaseUser = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser // ignore: cast_nullable_to_non_nullable
              as AsyncValue<User?>,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginProviderStateCopyWith<$Res>
    implements $LoginProviderStateCopyWith<$Res> {
  factory _$$_LoginProviderStateCopyWith(_$_LoginProviderState value,
          $Res Function(_$_LoginProviderState) then) =
      __$$_LoginProviderStateCopyWithImpl<$Res>;
  @override
  $Res call({AsyncValue<User?> firebaseUser});
}

/// @nodoc
class __$$_LoginProviderStateCopyWithImpl<$Res>
    extends _$LoginProviderStateCopyWithImpl<$Res>
    implements _$$_LoginProviderStateCopyWith<$Res> {
  __$$_LoginProviderStateCopyWithImpl(
      _$_LoginProviderState _value, $Res Function(_$_LoginProviderState) _then)
      : super(_value, (v) => _then(v as _$_LoginProviderState));

  @override
  _$_LoginProviderState get _value => super._value as _$_LoginProviderState;

  @override
  $Res call({
    Object? firebaseUser = freezed,
  }) {
    return _then(_$_LoginProviderState(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser // ignore: cast_nullable_to_non_nullable
              as AsyncValue<User?>,
    ));
  }
}

/// @nodoc

class _$_LoginProviderState extends _LoginProviderState
    with DiagnosticableTreeMixin {
  _$_LoginProviderState({this.firebaseUser = const AsyncValue<User?>.loading()})
      : super._();

  @override
  @JsonKey()
  final AsyncValue<User?> firebaseUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginProviderState(firebaseUser: $firebaseUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginProviderState'))
      ..add(DiagnosticsProperty('firebaseUser', firebaseUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginProviderState &&
            const DeepCollectionEquality()
                .equals(other.firebaseUser, firebaseUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(firebaseUser));

  @JsonKey(ignore: true)
  @override
  _$$_LoginProviderStateCopyWith<_$_LoginProviderState> get copyWith =>
      __$$_LoginProviderStateCopyWithImpl<_$_LoginProviderState>(
          this, _$identity);
}

abstract class _LoginProviderState extends LoginProviderState {
  factory _LoginProviderState({final AsyncValue<User?> firebaseUser}) =
      _$_LoginProviderState;
  _LoginProviderState._() : super._();

  @override
  AsyncValue<User?> get firebaseUser => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginProviderStateCopyWith<_$_LoginProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}
