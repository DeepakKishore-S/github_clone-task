import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/features/porject/model/commit_data/commit_data.dart';
import 'package:github_clone/features/porject/model_view/bloc/branch_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:intl/intl.dart';

class BranchBodyWidget extends HookWidget {
  BranchBodyWidget({super.key});
  List<CommitData> commits = [];
  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    commits = context.read<BranchBloc>().commitData;
    // }, [key]);
    return context.read<BranchBloc>().commitData.isEmpty
        ? const Text("NO COMMITS")
        : Container(
            // height: MediaQuery.of(context).size.height *  0.65,
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: commits.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.folder_rounded,
                            color: Color(0xFFE0B800),
                            size: 35,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      commits[index].commit!.message ?? "",
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: AppTextStyle.headerText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy hh:mm a').format(
                                        DateTime.parse(commits[index]
                                                .commit!
                                                .committer!
                                                .date!)
                                            .toLocal()),
                                    style: AppTextStyle.subHeaderText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(65, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person_add_outlined,
                            size: 14,
                            color: Colors.green,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Text(
                              commits[index].commit!.committer!.name!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.secondayTextColor,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(38, 0, 0, 0),
                    )
                  ],
                );
              },
            ),
          );
  }
}
