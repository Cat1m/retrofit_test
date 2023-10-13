import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chien_event.dart';
part 'chien_state.dart';
part 'chien_bloc.freezed.dart';

class ChienBloc extends Bloc<ChienEvent, ChienState> {
  ChienBloc() : super(const _Initial()) {
    on<ChienEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
