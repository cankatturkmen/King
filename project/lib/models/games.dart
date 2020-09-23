import 'dart:convert';

class Games {
  int gameID;
  DateTime gameDate;

  Games({
    this.gameID,
    this.gameDate,
  });

  Games copyWith({
    int gameID,
    DateTime gameDate,
  }) {
    return Games(
      gameID: gameID ?? this.gameID,
      gameDate: gameDate ?? this.gameDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gameID': gameID,
      'gameDate': gameDate?.millisecondsSinceEpoch,
    };
  }

  factory Games.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

// degisiklik gerekebilir

    return Games(
      gameID: map['gameID'],
      gameDate: DateTime.fromMillisecondsSinceEpoch(map['gameDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Games.fromJson(String source) => Games.fromMap(json.decode(source));

  @override
  String toString() => 'Games(gameID: $gameID, gameDate: $gameDate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Games && o.gameID == gameID && o.gameDate == gameDate;
  }

  @override
  int get hashCode => gameID.hashCode ^ gameDate.hashCode;
}
