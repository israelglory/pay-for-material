part of 'assessment_bloc.dart';

@immutable
abstract class AssessmentEvent {}

class GetAssessmentEvent extends AssessmentEvent {
  final String status;
  GetAssessmentEvent({required this.status});
}

class GetSingleAssessmentEvent extends AssessmentEvent {
  final String assessmentId;
  GetSingleAssessmentEvent({required this.assessmentId});
}

class CreateAssessmentEvent extends AssessmentEvent {
  final CreateAssessmentParam param;
  CreateAssessmentEvent({required this.param});
}

class UpdateAssessmentEvent extends AssessmentEvent {
  final String assessmentId;
  final UpdateAssessmentParam param;
  UpdateAssessmentEvent({
    required this.assessmentId,
    required this.param,
  });
}

class InviteStudentByEmailEvent extends AssessmentEvent {
  final String assessmentId, email;
  InviteStudentByEmailEvent({required this.assessmentId, required this.email});
}

class GetSharableIdEvent extends AssessmentEvent {
  final String assessmentId;
  GetSharableIdEvent({required this.assessmentId});
}

///Studnet Events
///
class GetStudentAssessmentEvent extends AssessmentEvent {
  final String state;
  GetStudentAssessmentEvent({required this.state});
}

class GetSingleStudentAssessmentEvent extends AssessmentEvent {
  final String assessmentId;
  GetSingleStudentAssessmentEvent({required this.assessmentId});
}
