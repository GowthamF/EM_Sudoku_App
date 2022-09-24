import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseRepository firebaseRepository;
  FirebaseBloc({required this.firebaseRepository}) : super(FirebaseInitial()) {
    on<FirebaseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
