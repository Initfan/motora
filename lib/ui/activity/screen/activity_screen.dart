import 'package:flutter/material.dart';
import 'package:motora/ui/activity/view_models/activity_view_model.dart';
import 'package:motora/ui/activity/widget/activity_filters.dart';
import 'package:motora/ui/activity/widget/activity_list.dart';
import 'package:motora/ui/activity/widget/activity_summary.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivitiyScreen();
}

class _ActivitiyScreen extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ActivityViewModel>().load(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      body: SafeArea(
        child: Consumer<ActivityViewModel>(
          builder: (context, model, child) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  sliver: SliverToBoxAdapter(child: _buildHeader()),
                ),

                model.state.isLoading || model.state.activities == null
                    ? SliverToBoxAdapter()
                    : SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                        sliver: SliverToBoxAdapter(
                          child: model.state.activities!.isEmpty
                              ? SizedBox()
                              : ActivitySummary(
                                  activities: model.state.activities!,
                                ),
                        ),
                      ),

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: ActivityFilters(model: model),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
                  sliver: SliverToBoxAdapter(child: ActivityList(model: model)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aktivitas',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Riwayat aktivitas narik kamu',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F6),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 20,
            color: AppColors.dark,
          ),
        ),
      ],
    );
  }
}
