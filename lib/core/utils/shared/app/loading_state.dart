import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  final bool silent;
  final bool loading;
  final bool reloading;
  final bool loadingMore;

  bool get anyLoading => loading || reloading || loadingMore;

  const LoadingState()
      : silent = false,
        loading = false,
        reloading = false,
        loadingMore = false;

  const LoadingState.loading({
    this.silent = false,
  })  : loading = true,
        reloading = false,
        loadingMore = false;

  const LoadingState.reloading({
    this.silent = false,
  })  : loading = false,
        reloading = true,
        loadingMore = false;

  const LoadingState.loadingMore({
    this.silent = false,
  })  : loading = false,
        reloading = false,
        loadingMore = true;

  @override
  List<Object?> get props => [
        silent,
        loading,
        reloading,
        loadingMore,
      ];

  // ✅ Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'silent': silent,
      'loading': loading,
      'reloading': reloading,
      'loadingMore': loadingMore,
    };
  }

  // ✅ Restore from JSON
  factory LoadingState.fromJson(Map<String, dynamic> json) {
    return LoadingState._internal(
      silent: json['silent'] ?? false,
      loading: json['loading'] ?? false,
      reloading: json['reloading'] ?? false,
      loadingMore: json['loadingMore'] ?? false,
    );
  }

  // ✅ Private named constructor for `fromJson()`
  const LoadingState._internal({
    required this.silent,
    required this.loading,
    required this.reloading,
    required this.loadingMore,
  });
}
