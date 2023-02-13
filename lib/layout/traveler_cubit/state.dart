abstract class TravelerState{}

class TravelerInitialState extends TravelerState{}

class TravelerLoadingState extends TravelerState{}

class TravelerSuccessState extends TravelerState{
  final String uId;

  TravelerSuccessState(this.uId);
}

class TravelerChangeNavBarSuccessState extends TravelerState{}