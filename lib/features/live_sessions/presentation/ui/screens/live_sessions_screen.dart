import 'package:doublem/core/extensions/date_time.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_bloc.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_event.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_state.dart';
import 'package:doublem/features/live_sessions/presentation/ui/widgets/live_session_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveSessionsScreen extends StatelessWidget {
  final int courseId;
  static const String path = '/live-sessions';
  const LiveSessionsScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<LiveSessionsBloc>()
            ..add(LoadAllLiveSessionsEvent(courseId: courseId)),
      child: Scaffold(
        appBar: AppBar(title: Text(context.translations.liveSessions)),
        body: BlocBuilder<LiveSessionsBloc, LiveSessionsState>(
          builder: (context, state) {
            if (state is LiveSessionsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is LiveSessionsLoaded) {
              if (state.sessions.isEmpty) {
                return Center(
                  child: Text(context.translations.noLiveSessionsYet),
                );
              }
              return ListView.builder(
                itemCount: state.sessions.length,
                itemBuilder: (context, index) {
                  final session = state.sessions[index];
                  return Card(
                    margin: EdgeInsets.all(12.w),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.title,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            session.description,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: 12.h),
                          DetailRow(
                            icon: Icons.calendar_today,
                            label: context.translations.date,
                            value: session.sessionDate.formattedDate,
                          ),
                          DetailRow(
                            icon: Icons.access_time,
                            label: context.translations.time,
                            value:
                                '${session.startTime.formattedTime} - ${session.endTime.formattedTime}',
                          ),
                          DetailRow(
                            icon: Icons.people,
                            label: context.translations.capacity,
                            value:
                                '${session.bookedSeatsCount}/${session.capacity} ${context.translations.seats}',
                          ),
                          DetailRow(
                            icon: Icons.person,
                            label: context.translations.teacher,
                            value: session.teacherId,
                          ),
                          DetailRow(
                            icon: Icons.link,
                            label: context.translations.meetingUrl,
                            value: session.meetingUrl,
                          ),
                          if (session.isCancelled)
                            DetailRow(
                              icon: Icons.cancel,
                              label: context.translations.status,
                              value: context.translations.cancelled,
                              isWarning: true,
                            ),
                          SizedBox(height: 12.h),
                          Builder(
                            builder: (context) {
                              final sessionEnd = DateTime(
                                session.sessionDate.year,
                                session.sessionDate.month,
                                session.sessionDate.day,
                                session.endTime.hour,
                                session.endTime.minute,
                                session.endTime.second,
                              );
                              final hasEnded = DateTime.now().isAfter(
                                sessionEnd,
                              );
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: hasEnded
                                      ? null
                                      : () async {
                                          final rawUrl = session.meetingUrl
                                              .trim();
                                          if (rawUrl.isEmpty) {
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Meeting URL is not available',
                                                  ),
                                                ),
                                              );
                                            }
                                            return;
                                          }
                                          final url = rawUrl.startsWith('http')
                                              ? Uri.parse(rawUrl)
                                              : Uri.parse('https://$rawUrl');
                                          try {
                                            await launchUrl(
                                              url,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          } catch (e) {
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Failed to open URL: $e',
                                                  ),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                  child: Text(
                                    hasEnded
                                        ? context.translations.ended
                                        : context.translations.join,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is LiveSessionsError) {
              return Center(child: Text(state.message));
            }

            return Center(child: Text(context.translations.noLiveSessionsYet));
          },
        ),
      ),
    );
  }
}
