class Response<T> {
  Status status;
  T data;
  String message;

  Response.loading(this.message) : status = Status.LOADING;

  Response.completed(this.data) : status = Status.COMPLETED;

  Response.error(this.message) : status = Status.ERROR;

  Response.none() : status = Status.NONE;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, NONE }
