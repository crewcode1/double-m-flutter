import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/states/pagination_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin PaginationMixin<T> on Cubit<PaginationState<T>> {
  // late Parameters parameters;
  int page = 1;
  bool hasMore = true;

  final ScrollController scrollController = ScrollController();

  /// You MUST implement this in each cubit
  Future<Either<Failure, List<T>>> fetchingDataFunction();

  bool hasMoreCondition();

  void fetchData() async {
    if (!hasMore) {
      return;
    }
    if (page == 1) {
      emit(LoadingData());
    } else {
      if (!hasMore) {
        return;
      } else {
        emit(LoadingMoreData());
      }
    }

    Either<Failure, List<T>> data = await fetchingDataFunction();
    data.fold(
      (error) {
        if (page == 1) {
          emit(ErrorLoadingData());
        } else {
          emit(ErrorLoadingMoreData(message: error.toString()));
        }
      },
      (employeeRequests) {
        if (page == 1) {
          hasMore = hasMoreCondition();
          emit(DataLoadedSuccessfully(items: employeeRequests));
        } else {
          emit(MoreDataLoadedSuccessfully(items: employeeRequests));
        }
        page++;
      },
    );
  }

  void initPaginationListener() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        fetchData();
      }
    });
  }
}
