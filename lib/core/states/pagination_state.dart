abstract class PaginationState<T> {}

class PaginationStateInitial<T> extends PaginationState<T> {}

class DataLoadedSuccessfully<T> extends PaginationState<T> {
  final List<T> items;

  DataLoadedSuccessfully({required this.items});
}

class ErrorLoadingData<T> extends PaginationState<T> {}

class LoadingData<T> extends PaginationState<T> {}

class MoreDataLoadedSuccessfully<T> extends PaginationState<T> {
  final List<T> items;
  MoreDataLoadedSuccessfully({required this.items});
}

class ErrorLoadingMoreData<T> extends PaginationState<T> {
  final String message;
  ErrorLoadingMoreData({required this.message});
}

class LoadingMoreData<T> extends PaginationState<T> {}
