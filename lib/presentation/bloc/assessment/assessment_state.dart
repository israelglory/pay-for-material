part of 'assessment_bloc.dart';

@immutable
abstract class AssessmentState {}

class AssessmentInitial extends AssessmentState {}

class AssessmentLoading extends AssessmentState {}

class AssessmentError extends AssessmentState {
  final String error;
  AssessmentError(this.error);
}

class GetAssessmentSuccess extends AssessmentState {
  final List<Assessment> assessments;
  final String status;
  GetAssessmentSuccess({
    required this.assessments,
    required this.status,
  });
}

class GetSingleAssessmentSuccess extends AssessmentState {
  final SingleAssessment assessment;

  GetSingleAssessmentSuccess({
    required this.assessment,
  });
}

class UpdateAssessmentSuccess extends AssessmentState {}

class CreateAssessmentSuccess extends AssessmentState {
  final CreateAssessmentResponse assessmentResponse;
  CreateAssessmentSuccess({
    required this.assessmentResponse,
  });
}

class InviteStudentByEmailSuccess extends AssessmentState {}

class GetSharableIdSuccess extends AssessmentState {
  final String id;
  GetSharableIdSuccess({required this.id});
}

///Students States
class GetStudentAssessmentSuccess extends AssessmentState {
  final List<StudentAssessments> assessments;
  final String state;
  GetStudentAssessmentSuccess({
    required this.assessments,
    required this.state,
  });
}

class GetSingleStudentAssessmentSuccess extends AssessmentState {
  final SingleAssessment assessment;

  GetSingleStudentAssessmentSuccess({
    required this.assessment,
  });
}
