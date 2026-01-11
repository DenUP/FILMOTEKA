class Paginator<T> {
  final Future<PaginatorLoadResult<T>> Function(int) load;
  final List<T> _data = [];
  int _currentPage = 0;
  int? _totalPage;
  bool _isLoading = false;

  List<T> get data => List.unmodifiable(_data);

  bool get canLoadNextPage =>
      !_isLoading && (_totalPage == null || _currentPage < _totalPage!);

  Paginator({required this.load});

  Future<void> loadNextPage() async {
    if (!canLoadNextPage) return;

    _isLoading = true;
    try {
      final nextPage = _currentPage + 1;
      final result = await load(nextPage);
      _data.addAll(result.data);
      _currentPage = result.currentPage;
      _totalPage = result.totalPage;
    } catch (e) {
      print('Error loading next page: $e');
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  Future<void> resetMovie() async {
    _data.clear();
    _currentPage = 0;
    _totalPage = null;
    _isLoading = false;
  }
}

class PaginatorLoadResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPage;

  PaginatorLoadResult({
    required this.data,
    required this.currentPage,
    required this.totalPage,
  });
}
