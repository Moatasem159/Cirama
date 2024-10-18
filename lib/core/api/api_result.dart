import 'package:movies_app/core/api/error_handler.dart';
/// A sealed class representing the result of an API call.
///
/// It can be either a [ApiSuccess], containing the result data,
/// or a [ApiFailure], containing an error handler.
sealed class ApiResult<A> {
  /// Base constructor for [ApiResult].
  const ApiResult();

  /// Factory constructor to create a successful result containing the given data.
  const factory ApiResult.success(A data) = ApiSuccess<A>;

  /// Factory constructor to create a failure result containing the given [ErrorHandler].
  const factory ApiResult.failure(ErrorHandler handler) = ApiFailure<A>;
}

/// A class representing a successful API result.
///
/// [A] is the type of the result data, and [data] holds the actual result.
final class ApiSuccess<A> extends ApiResult<A> {
  /// The data returned from the API when the call is successful.
  final A data;

  /// Creates an instance of [ApiSuccess] with the given data.
  const ApiSuccess(this.data);
}

/// A class representing a failed API result.
///
/// [ErrorHandler] is used to handle or describe the error that occurred.
final class ApiFailure<A> extends ApiResult<A> {
  /// Ahe error handler that holds information about the failure.
  final ErrorHandler handler;

  /// Creates an instance of [ApiFailure] with the given error handler.
  const ApiFailure(this.handler);
}

/// Extension on [ApiResult] to handle the different possible outcomes
/// (success or failure) using a pattern matching `when` function.
extension ApiResultX<A> on ApiResult<A> {
  /// Matches the [ApiResult] instance and performs the provided callback
  /// based on whether the result is [ApiSuccess] or [ApiFailure].
  ///
  /// - [success] is called with the [A] data if the result is a success.
  /// - [failure] is called with the [ErrorHandler] if the result is a failure.
  ///
  /// Example usage:
  /// ```dart
  /// ApiResult<int> result = ApiResult.success(42);
  ///
  /// String message = result.when(
  ///   success: (data) => 'Success with data: $data',
  ///   failure: (handler) => 'Error: ${handler.errorMessage}',
  /// );
  /// ```
  ///
  /// This ensures that both the success and failure cases are handled in
  /// a clear and exhaustive manner.
  R when<R>({
    required R Function(A data) success,
    required R Function(ErrorHandler handler) failure,
  }) {
    // Using pattern matching with switch to handle the different cases
    switch (this) {
      // If the result is an instance of ApiSuccess, call the success callback with the data.
      case ApiSuccess<A>():
        return success((this as ApiSuccess<A>).data);
      // If the result is an instance of ApiFailure, call the failure callback with the error handler.
      case ApiFailure<A>():
        return failure((this as ApiFailure<A>).handler);
    }
  }
}