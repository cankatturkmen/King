import 'dart:convert';

class Players {
  int playerID;
  String playerName;
  int playerPoint;
  int gameID;

  Players({
    this.playerID,
    this.playerName,
    this.playerPoint,
    this.gameID,
  });

  Players copyWith({
    int playerID,
    String playerName,
    int playerPoint,
    int gameID,
  }) {
    return Players(
      playerID: playerID ?? this.playerID,
      playerName: playerName ?? this.playerName,
      playerPoint: playerPoint ?? this.playerPoint,
      gameID: gameID ?? this.gameID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerID': playerID,
      'playerName': playerName,
      'playerPoint': playerPoint,
      'gameID': gameID,
    };
  }

  factory Players.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Players(
      playerID: map['playerID'],
      playerName: map['playerName'],
      playerPoint: map['playerPoint'],
      gameID: map['gameID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Players.fromJson(String source) =>
      Players.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Players(playerID: $playerID, playerName: $playerName, playerPoint: $playerPoint, gameID: $gameID)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Players &&
        o.playerID == playerID &&
        o.playerName == playerName &&
        o.playerPoint == playerPoint &&
        o.gameID == gameID;
  }

  @override
  int get hashCode {
    return playerID.hashCode ^
        playerName.hashCode ^
        playerPoint.hashCode ^
        gameID.hashCode;
  }
}
