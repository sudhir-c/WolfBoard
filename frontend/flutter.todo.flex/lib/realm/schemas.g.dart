// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class user_info extends _UserInfo with RealmEntity, RealmObject {
  static var _defaultsSet = false;

  user_info(
    ObjectId id,
    String summary,
    String ownerId,
    String name,
    String email,
    String periodOneCourse,
    String periodTwoCourse,
    String periodThreeCourse,
    String periodFourCourse,
    String periodFiveCourse,
    String periodSixCourse,
    String periodOneTeacher,
    String periodTwoTeacher,
    String periodThreeTeacher,
    String periodFourTeacher,
    String periodFiveTeacher,
    String periodSixTeacher,
    String scheduleUploaded, {
    bool isComplete = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObject.setDefaults<user_info>({
        'isComplete': false,
      });
    }
    RealmObject.set(this, '_id', id);
    RealmObject.set(this, 'isComplete', isComplete);
    RealmObject.set(this, 'summary', summary);
    RealmObject.set(this, 'owner_id', ownerId);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'email', email);
    RealmObject.set(this, 'periodOneCourse', periodOneCourse);
    RealmObject.set(this, 'periodTwoCourse', periodTwoCourse);
    RealmObject.set(this, 'periodThreeCourse', periodThreeCourse);
    RealmObject.set(this, 'periodFourCourse', periodFourCourse);
    RealmObject.set(this, 'periodFiveCourse', periodFiveCourse);
    RealmObject.set(this, 'periodSixCourse', periodSixCourse);
    RealmObject.set(this, 'periodOneTeacher', periodOneTeacher);
    RealmObject.set(this, 'periodTwoTeacher', periodTwoTeacher);
    RealmObject.set(this, 'periodThreeTeacher', periodThreeTeacher);
    RealmObject.set(this, 'periodFourTeacher', periodFourTeacher);
    RealmObject.set(this, 'periodFiveTeacher', periodFiveTeacher);
    RealmObject.set(this, 'periodSixTeacher', periodSixTeacher);
    RealmObject.set(this, 'scheduleUploaded', scheduleUploaded);
  }

  user_info._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, '_id') as ObjectId;

  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  @override
  bool get isComplete => RealmObject.get<bool>(this, 'isComplete') as bool;

  @override
  set isComplete(bool value) => RealmObject.set(this, 'isComplete', value);

  @override
  String get summary => RealmObject.get<String>(this, 'summary') as String;

  @override
  set summary(String value) => RealmObject.set(this, 'summary', value);

  @override
  String get ownerId => RealmObject.get<String>(this, 'owner_id') as String;

  @override
  set ownerId(String value) => RealmObject.set(this, 'owner_id', value);

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;

  @override
  set name(String value) => RealmObject.set(this, 'summary', value);

  @override
  String get email => RealmObject.get<String>(this, 'email') as String;

  @override
  set email(String value) => RealmObject.set(this, 'email', value);

  @override
  String get periodOneCourse =>
      RealmObject.get<String>(this, 'periodOneCourse') as String;

  @override
  set periodOneCourse(String value) =>
      RealmObject.set(this, 'periodOneCourse', value);

  @override
  String get periodTwoCourse =>
      RealmObject.get<String>(this, 'periodTwoCourse') as String;

  @override
  set periodTwoCourse(String value) =>
      RealmObject.set(this, 'periodTwoCourse', value);

  @override
  String get periodThreeCourse =>
      RealmObject.get<String>(this, 'periodThreeCourse') as String;

  @override
  set periodThreeCourse(String value) =>
      RealmObject.set(this, 'periodThreeCourse', value);

  @override
  String get periodFourCourse =>
      RealmObject.get<String>(this, 'periodFourCourse') as String;

  @override
  set periodFourCourse(String value) =>
      RealmObject.set(this, 'periodFourCourse', value);

  @override
  String get periodFiveCourse =>
      RealmObject.get<String>(this, 'periodFiveCourse') as String;

  @override
  set periodFiveCourse(String value) =>
      RealmObject.set(this, 'periodFiveCourse', value);

  @override
  String get periodSixCourse =>
      RealmObject.get<String>(this, 'periodSixCourse') as String;

  @override
  set periodSixCourse(String value) =>
      RealmObject.set(this, 'periodSixCourse', value);

  @override
  String get periodOneTeacher =>
      RealmObject.get<String>(this, 'periodOneTeacher') as String;

  @override
  set periodOneTeacher(String value) =>
      RealmObject.set(this, 'periodOneTeacher', value);

  @override
  String get periodTwoTeacher =>
      RealmObject.get<String>(this, 'periodTwoTeacher') as String;

  @override
  set periodTwoTeacher(String value) =>
      RealmObject.set(this, 'periodTwoTeacher', value);

  @override
  String get periodThreeTeacher =>
      RealmObject.get<String>(this, 'periodThreeTeacher') as String;

  @override
  set periodThreeTeacher(String value) =>
      RealmObject.set(this, 'periodThreeTeacher', value);

  @override
  String get periodFourTeacher =>
      RealmObject.get<String>(this, 'periodFourTeacher') as String;

  @override
  set periodFourTeacher(String value) =>
      RealmObject.set(this, 'periodFourTeacher', value);

  @override
  String get periodFiveTeacher =>
      RealmObject.get<String>(this, 'periodFiveTeacher') as String;

  @override
  set periodFiveTeacher(String value) =>
      RealmObject.set(this, 'periodFiveTeacher', value);

  @override
  String get periodSixTeacher =>
      RealmObject.get<String>(this, 'periodSixTeacher') as String;

  @override
  set periodSixTeacher(String value) =>
      RealmObject.set(this, 'periodSixTeacher', value);

  @override
  String get scheduleUploaded =>
      RealmObject.get<String>(this, 'scheduleUploaded') as String;

  @override
  set scheduleUploaded(String value) =>
      RealmObject.set(this, 'scheduleUploaded', value);

  @override
  Stream<RealmObjectChanges<user_info>> get changes =>
      RealmObject.getChanges<user_info>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObject.registerFactory(user_info._);
    return SchemaObject(user_info, 'userInfo', [
      SchemaProperty('_id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('isComplete', RealmPropertyType.bool),
      SchemaProperty('summary', RealmPropertyType.string),
      SchemaProperty('owner_id', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('periodOneCourse', RealmPropertyType.string),
      SchemaProperty('periodTwoCourse', RealmPropertyType.string),
      SchemaProperty('periodThreeCourse', RealmPropertyType.string),
      SchemaProperty('periodFourCourse', RealmPropertyType.string),
      SchemaProperty('periodFiveCourse', RealmPropertyType.string),
      SchemaProperty('periodSixCourse', RealmPropertyType.string),
      SchemaProperty('periodOneTeacher', RealmPropertyType.string),
      SchemaProperty('periodTwoTeacher', RealmPropertyType.string),
      SchemaProperty('periodThreeTeacher', RealmPropertyType.string),
      SchemaProperty('periodFourTeacher', RealmPropertyType.string),
      SchemaProperty('periodFiveTeacher', RealmPropertyType.string),
      SchemaProperty('periodSixTeacher', RealmPropertyType.string),
      SchemaProperty('scheduleUploaded', RealmPropertyType.string)
    ]);
  }
}
