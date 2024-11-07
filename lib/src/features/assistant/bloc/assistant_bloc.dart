import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'assistant_event.dart';
part 'assistant_state.dart';

class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  AssistantBloc() : super(AssistantInitial()) {
    on<AssistantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
