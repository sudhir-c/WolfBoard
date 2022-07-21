// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bugSchema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class bugSchema extends _Bug with RealmEntity, RealmObject {
  bugSchema(
    ObjectId id,
    String bugmessage,
    String email,
  ) {
    // if (!_defaultsSet) {
    //   _defaultsSet = RealmObject.setDefaults<user_info>({
    //     'isComplete': false,
    //   });
    // }
    RealmObject.set(this, '_id', id);
    RealmObject.set(this, 'bugmessage', bugmessage);
    RealmObject.set(this, 'email', email);
  }
  bugSchema._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, '_id') as ObjectId;

  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  @override
  String get bugmessage =>
      RealmObject.get<String>(this, 'bugmessage') as String;

  @override
  set bugmessage(String value) => RealmObject.set(this, 'bugmessage', value);

  @override
  String get email => RealmObject.get<String>(this, 'email') as String;

  @override
  set email(String value) => RealmObject.set(this, 'email', value);

  @override
  Stream<RealmObjectChanges<bugSchema>> get changes =>
      RealmObject.getChanges<bugSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObject.registerFactory(bugSchema._);
    return SchemaObject(bugSchema, 'bugSchema', [
      SchemaProperty('_id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('bugmessage', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
    ]);
  }
}
