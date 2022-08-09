import 'dart:async';

class HomeBloc {
  final StreamController<int> _controller = StreamController();
  get stream => _controller.stream;

  updatePage(int newPage) {
    _controller.sink.add(newPage);
  }

  dispose() {
    _controller.close();
  }
}