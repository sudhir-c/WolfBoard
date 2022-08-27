import 'package:realm/realm.dart';
import '../realm/schemas.dart';

class UserInfoModel {
  final ObjectId id;
  final bool isComplete;
  final String summary;
  final user_info u;
  final String name;
  final String email;
  final String periodOneCourse;
  final String periodTwoCourse;
  final String periodThreeCourse;
  final String periodFourCourse;
  final String periodFiveCourse;
  final String periodSixCourse;
  final String periodOneTeacher;
  final String periodTwoTeacher;
  final String periodThreeTeacher;
  final String periodFourTeacher;
  final String periodFiveTeacher;
  final String periodSixTeacher;
  final String scheduleUploaded;

  const UserInfoModel._(
      this.id,
      this.isComplete,
      this.summary,
      this.u,
      this.name,
      this.email,
      this.periodOneCourse,
      this.periodTwoCourse,
      this.periodThreeCourse,
      this.periodFourCourse,
      this.periodFiveCourse,
      this.periodSixCourse,
      this.periodOneTeacher,
      this.periodTwoTeacher,
      this.periodThreeTeacher,
      this.periodFourTeacher,
      this.periodFiveTeacher,
      this.periodSixTeacher,
      this.scheduleUploaded);

  UserInfoModel(user_info u)
      : this._(
            u.id,
            u.isComplete,
            u.summary,
            u,
            u.name,
            u.email,
            u.periodOneCourse,
            u.periodTwoCourse,
            u.periodThreeCourse,
            u.periodFourCourse,
            u.periodFiveCourse,
            u.periodSixCourse,
            u.periodOneTeacher,
            u.periodTwoTeacher,
            u.periodThreeTeacher,
            u.periodFourTeacher,
            u.periodFiveTeacher,
            u.periodSixTeacher,
            u.scheduleUploaded);
}
