import 'dart:convert';

class Rounds {
  int roundID;
  int roundNumber;
  String roundName;
  int modelID;
  int gameID;
  int player1ID;
  int player2ID;
  int player3ID;
  int player4ID;
  int player1Point;
  int player2Point;
  int player3Point;
  int player4Point;
  Rounds({
    this.roundNumber,
    this.roundName,
    this.modelID,
    this.gameID,
    this.player1ID,
    this.player2ID,
    this.player3ID,
    this.player4ID,
    this.player1Point,
    this.player2Point,
    this.player3Point,
    this.player4Point,
  });
  Rounds.withID({
    this.roundID,
    this.roundNumber,
    this.roundName,
    this.modelID,
    this.gameID,
    this.player1ID,
    this.player2ID,
    this.player3ID,
    this.player4ID,
    this.player1Point,
    this.player2Point,
    this.player3Point,
    this.player4Point,
  });

  Rounds copyWith({
    int roundID,
    int roundNumber,
    String roundName,
    int modelID,
    int gameID,
    int player1ID,
    int player2ID,
    int player3ID,
    int player4ID,
    int player1Point,
    int player2Point,
    int player3Point,
    int player4Point,
  }) {
    return Rounds.withID(
      roundID: roundID ?? this.roundID,
      roundNumber: roundNumber ?? this.roundNumber,
      roundName: roundName ?? this.roundName,
      modelID: modelID ?? this.modelID,
      gameID: gameID ?? this.gameID,
      player1ID: player1ID ?? this.player1ID,
      player2ID: player2ID ?? this.player2ID,
      player3ID: player3ID ?? this.player3ID,
      player4ID: player4ID ?? this.player4ID,
      player1Point: player1Point ?? this.player1Point,
      player2Point: player2Point ?? this.player2Point,
      player3Point: player3Point ?? this.player3Point,
      player4Point: player4Point ?? this.player4Point,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roundID': roundID,
      'roundNumber': roundNumber,
      'roundName': roundName,
      'modelID': modelID,
      'gameID': gameID,
      'player1ID': player1ID,
      'player2ID': player2ID,
      'player3ID': player3ID,
      'player4ID': player4ID,
      'player1Point': player1Point,
      'player2Point': player2Point,
      'player3Point': player3Point,
      'player4Point': player4Point,
    };
  }

  factory Rounds.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Rounds.withID(
      roundID: map['roundID'],
      roundNumber: map['roundNumber'],
      roundName: map['roundName'],
      modelID: map['modelID'],
      gameID: map['gameID'],
      player1ID: map['player1ID'],
      player2ID: map['player2ID'],
      player3ID: map['player3ID'],
      player4ID: map['player4ID'],
      player1Point: map['player1Point'],
      player2Point: map['player2Point'],
      player3Point: map['player3Point'],
      player4Point: map['player4Point'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rounds.fromJson(String source) => Rounds.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rounds(roundID: $roundID, roundNumber: $roundNumber, roundName: $roundName, modelID: $modelID, gameID: $gameID, player1ID: $player1ID, player2ID: $player2ID, player3ID: $player3ID, player4ID: $player4ID, player1Point: $player1Point, player2Point: $player2Point, player3Point: $player3Point, player4Point: $player4Point)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Rounds &&
        o.roundID == roundID &&
        o.roundNumber == roundNumber &&
        o.roundName == roundName &&
        o.modelID == modelID &&
        o.gameID == gameID &&
        o.player1ID == player1ID &&
        o.player2ID == player2ID &&
        o.player3ID == player3ID &&
        o.player4ID == player4ID &&
        o.player1Point == player1Point &&
        o.player2Point == player2Point &&
        o.player3Point == player3Point &&
        o.player4Point == player4Point;
  }

  @override
  int get hashCode {
    return roundID.hashCode ^
        roundNumber.hashCode ^
        roundName.hashCode ^
        modelID.hashCode ^
        gameID.hashCode ^
        player1ID.hashCode ^
        player2ID.hashCode ^
        player3ID.hashCode ^
        player4ID.hashCode ^
        player1Point.hashCode ^
        player2Point.hashCode ^
        player3Point.hashCode ^
        player4Point.hashCode;
  }
}
