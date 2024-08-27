import 'package:bloc_examples/bloc/switch_bloc/switch_events.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents ,SwitchState> {
  SwitchBloc() : super(SwitchState()){
    on<EnableOrDisableNotifications>(_EnableOrDisableNotifications);
    on<SliderEvent>(_sliderEvent);
    
  }

  void _EnableOrDisableNotifications(EnableOrDisableNotifications event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent event , Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.sliderValue));
  }
}