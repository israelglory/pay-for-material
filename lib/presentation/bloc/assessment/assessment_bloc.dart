import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pay_for_material/data/models/responses/assessment/create_assessment_response.dart';
import 'package:pay_for_material/data/models/responses/assessment/student_assessments_model.dart';
import 'package:pay_for_material/data/repos/assessment_repo.dart';

import '../../../data/models/models.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  final _assessmentRepo = AssessmentRepository();
  AssessmentBloc() : super(AssessmentInitial()) {
    on<GetAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res = await _assessmentRepo.getAssessment(status: event.status);
        if (res.success) {
          emit(
            GetAssessmentSuccess(
              assessments: res.data ?? [],
              status: event.status,
            ),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
    on<GetSingleAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res = await _assessmentRepo.getSingleAssessment(
            assessmentId: event.assessmentId);
        if (res.success) {
          emit(
            GetSingleAssessmentSuccess(assessment: res.data!),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
    on<CreateAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res = await _assessmentRepo.createAssessment(param: event.param);
        if (res.success) {
          emit(
            CreateAssessmentSuccess(assessmentResponse: res.data!),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
    on<UpdateAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res = await _assessmentRepo.updateAssessment(
            param: event.param, assessmentId: event.assessmentId);
        if (res.success) {
          emit(
            UpdateAssessmentSuccess(),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
    on<InviteStudentByEmailEvent>(
      (event, emit) async {
        emit(AssessmentLoading());
        try {
          final res = await _assessmentRepo.inviteStudent(
              email: event.email, assessmentId: event.assessmentId);
          if (res.success) {
            emit(InviteStudentByEmailSuccess());
          } else {
            emit(AssessmentError(res.message));
          }
        } catch (e) {
          emit(AssessmentError(e.toString()));
        }
      },
    );

    on<GetSharableIdEvent>(
      (event, emit) async {
        emit(AssessmentLoading());
        try {
          final res = await _assessmentRepo.getSharableId(
            assessmentId: event.assessmentId,
          );
          if (res.success) {
            emit(GetSharableIdSuccess(id: res.data ?? ''));
          } else {
            emit(AssessmentError(res.message));
          }
        } catch (e) {
          emit(AssessmentError(e.toString()));
        }
      },
    );

    ///Students BLOC
    on<GetStudentAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res =
            await _assessmentRepo.getStudentAssessments(state: event.state);
        if (res.success) {
          emit(
            GetStudentAssessmentSuccess(
              assessments: res.data ?? [],
              state: event.state,
            ),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
    on<GetSingleStudentAssessmentEvent>((event, emit) async {
      emit(AssessmentLoading());
      try {
        final res = await _assessmentRepo.getSingleStudentAssessment(
            assessmentId: event.assessmentId);
        if (res.success) {
          emit(
            GetSingleStudentAssessmentSuccess(assessment: res.data!),
          );
        } else {
          emit(AssessmentError(res.message));
        }
      } catch (e) {
        emit(AssessmentError(e.toString()));
      }
    });
  }
}
