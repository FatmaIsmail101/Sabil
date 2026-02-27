sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  SuccessBaseResponse(this.data);
  final T data;
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  ErrorBaseResponse(this.message);
  final String message;
}
