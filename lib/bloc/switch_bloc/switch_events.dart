import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvents {
  
}

class SliderEvent extends SwitchEvents {
  double sliderValue;
  SliderEvent({required this.sliderValue});

  @override 
  List<Object> get props => [sliderValue];
}

