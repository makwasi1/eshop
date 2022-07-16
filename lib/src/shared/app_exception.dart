class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class UnknownResponseException extends AppException {
  UnknownResponseException([message]) : super(message, "Retry: ");
}

class NoQuestionsException extends AppException {
  NoQuestionsException([message]) : super(message, "NoQuestions: ");
}

class NoPollsException extends AppException {
  NoPollsException([message]) : super(message, "NoPolls: ");
}
