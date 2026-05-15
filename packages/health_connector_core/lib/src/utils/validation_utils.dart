import 'package:health_connector_core/src/annotations/annotations.dart'
    show sinceV1_0_0, internalUse;

/// Validates that a condition holds for a function argument.
///
/// ## Parameters
///
/// - [condition]: Boolean expression specifying the requirement to validate.
/// - [value]: The value being validated.
/// - [name]: The name of the parameter being validated.
/// - [message]: String describing the failed requirement in the exception.
///
/// ## Throws
///
/// - [ArgumentError.value] if [condition] is false, including the invalid
///   [value] and parameter [name] for better error messages.
///
/// @nodoc
@sinceV1_0_0
@internalUse
@internalUse
void require<T>({
  required bool condition,
  required T value,
  required String name,
  required String message,
}) {
  if (!condition) {
    throw ArgumentError.value(value, name, message);
  }
}

/// Validates that [endTime] is at or after [startTime].
///
/// HealthKit emits zero-duration samples for instantaneous measurements
/// (heart rate snapshots, body mass readings, single-point distance
/// deltas), so equal timestamps must be accepted; only a negative
/// duration is rejected.
///
/// ## Parameters
///
/// - [startTime]: The expected starting point of the time interval.
/// - [endTime]: The expected ending point of the time interval.
///
/// ## Throws
///
/// - [ArgumentError] if [endTime] is strictly before [startTime].
///
/// @nodoc
@sinceV1_0_0
@internalUse
void requireEndTimeAfterStartTime({
  required DateTime startTime,
  required DateTime endTime,
}) {
  if (endTime.isBefore(startTime)) {
    throw ArgumentError.value(
      endTime,
      'endTime',
      'endTime must be at or after startTime. '
          'Got startTime=$startTime, endTime=$endTime',
    );
  }
}
