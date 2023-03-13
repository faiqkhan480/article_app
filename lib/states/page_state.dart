part of '../controller/page_offset_notifier.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class PageState extends Equatable {
  final double offset;
  final double page;

  const PageState({
    this.offset = 0,
    this.page = 0
  });

  PageState copyWith({
    double? offset,
    double? page,
  }) {
    return PageState(
      offset: offset ?? this.offset,
      page: page ?? this.page,
    );
  }

  List<Object> get props => [offset, page];
}