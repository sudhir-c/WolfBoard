import 'package:realm/realm.dart';

//part 'schemas.l.dart';
part 'schemas.g.dart';

@RealmModel()
class _UserInfo {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  bool isComplete = false;
  late String summary;
  @MapTo('owner_id')
  late String ownerId;
  //MY CHANGES
  late String name;
  late String email;

  late String periodOneCourse;
  late String periodTwoCourse;
  late String periodThreeCourse;
  late String periodFourCourse;
  late String periodFiveCourse;
  late String periodSixCourse;

  late String periodOneTeacher;
  late String periodTwoTeacher;
  late String periodThreeTeacher;
  late String periodFourTeacher;
  late String periodFiveTeacher;
  late String periodSixTeacher;

  late String scheduleUploaded;
  //late bool consentToShareData;
}
