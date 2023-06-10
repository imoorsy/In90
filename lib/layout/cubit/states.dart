abstract class SportStates {}

class InitialSportState extends SportStates {}

class ChangeNavSportState extends SportStates {}

class GetLoadingHomeDataSportState extends SportStates {}
class GetSuccessHomeDataSportState extends SportStates {}
class GetErrorHomeDataSportState extends SportStates {}

class GetLoadingCrntMatchSportState extends SportStates {}
class GetSuccessCrntMatchSportState extends SportStates {}
class GetErrorCrntMatchSportState extends SportStates {}

class GetLoadingCrntPlayerSportState extends SportStates {}
class GetSuccessCrntPlayerSportState extends SportStates {}
class GetErrorCrntPlayerSportState extends SportStates {}


class GetLoadingLeaguesStandingSportState extends SportStates {}
class GetSuccessLeaguesStandingSportState extends SportStates {}
class GetErrorLeaguesStandingSportState extends SportStates {}

class GetLoadingTeamsSearchSportState extends SportStates {}
class GetSuccessTeamsSearchSportState extends SportStates {}
class GetErrorTeamsSearchSportState extends SportStates {}
