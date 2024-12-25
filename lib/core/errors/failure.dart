import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate received");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            statusCode: dioException.response!.statusCode!,
            response: dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Connection error occurred");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage:
                "An unknown error occurred. Please check your internet connection and try again.");
      default:
        return ServerFailure(errorMessage: "Unexpected error occurred");
    }
  }

  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response["errors"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: "Your request not found , try later");
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: "Internal server error , try later");
    } else {
      return ServerFailure(errorMessage: "Opps There was an Error , try again");
    }
  }
}
