import 'dart:convert';

class Modes {
  int modeID;
  String modeName;
  int modePoint;
  String modeImg;
  Modes({
    this.modeName,
    this.modePoint,
    this.modeImg,
  });
  Modes.withID({
    this.modeID,
    this.modeName,
    this.modePoint,
    this.modeImg,
  });

  Modes copyWith({
    int modeID,
    String modeName,
    int modePoint,
    String modeImg,
  }) {
    return Modes.withID(
      modeID: modeID ?? this.modeID,
      modeName: modeName ?? this.modeName,
      modePoint: modePoint ?? this.modePoint,
      modeImg: modeImg ?? this.modeImg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'modeID': modeID,
      'modeName': modeName,
      'modePoint': modePoint,
      'modeImg': modeImg,
    };
  }

  factory Modes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Modes.withID(
      modeID: map['modeID'],
      modeName: map['modeName'],
      modePoint: map['modePoint'],
      modeImg: map['modeImg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Modes.fromJson(String source) => Modes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Modes(modeID: $modeID, modeName: $modeName, modePoint: $modePoint, modeImg: $modeImg)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Modes &&
        o.modeID == modeID &&
        o.modeName == modeName &&
        o.modePoint == modePoint &&
        o.modeImg == modeImg;
  }

  @override
  int get hashCode {
    return modeID.hashCode ^
        modeName.hashCode ^
        modePoint.hashCode ^
        modeImg.hashCode;
  }
}
