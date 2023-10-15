import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SketchBooksRecord extends FirestoreRecord {
  SketchBooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "scenes" field.
  List<String>? _scenes;
  List<String> get scenes => _scenes ?? const [];
  bool hasScenes() => _scenes != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _scenes = getDataList(snapshotData['scenes']);
    _images = getDataList(snapshotData['images']);
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SketchBooks');

  static Stream<SketchBooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SketchBooksRecord.fromSnapshot(s));

  static Future<SketchBooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SketchBooksRecord.fromSnapshot(s));

  static SketchBooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SketchBooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SketchBooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SketchBooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SketchBooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SketchBooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSketchBooksRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class SketchBooksRecordDocumentEquality implements Equality<SketchBooksRecord> {
  const SketchBooksRecordDocumentEquality();

  @override
  bool equals(SketchBooksRecord? e1, SketchBooksRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.scenes, e2?.scenes) &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.name == e2?.name;
  }

  @override
  int hash(SketchBooksRecord? e) =>
      const ListEquality().hash([e?.scenes, e?.images, e?.name]);

  @override
  bool isValidKey(Object? o) => o is SketchBooksRecord;
}
