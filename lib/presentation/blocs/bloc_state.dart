enum Status {
  initial,
  loading,
  loaded,
  error,
  success,
}

class BlocState<T> {
  Status status;
  T? data;
  String msg;
  dynamic extraData;

  BlocState({
    this.status = Status.initial,
    this.data,
    this.msg = 'Error. Connection to server failed',
    this.extraData,
  });

  BlocState<T> copyWith({
    Status? status,
    T? data,
    String? msg,
    dynamic extraData,
  }) {
    return BlocState(
      status: status ?? this.status,
      data: data ?? this.data,
      msg: msg ?? this.msg,
      extraData: extraData ?? this.extraData,
    );
  }
}