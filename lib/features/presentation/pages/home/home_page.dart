import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getHomeRepo),
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        var data = HomeDataModel.fromJson(result.data);
        return Align(
          alignment: Alignment.topCenter,
          child: Card(
            color: kPrimaryColour,
            margin: EdgeInsets.only(right: 24.w, left: 24.w, top: 24.h, bottom: 24.h),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/ic_user.svg',
                        color: Colors.white70,
                        height: 20,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Expanded(
                        child: Text(
                          data.home?.name ?? '',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          padding:  EdgeInsets.only(right: 10.w, left: 10.w),
                          margin: EdgeInsets.only(left: 16.w),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white70,
                              ),
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            data.home?.currency ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ))
                    ],
                  ),
                  Divider(
                    height: 32.h,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Account no : ",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      children: [
                        TextSpan(
                          text: data.home?.accountNumber ?? '',
                          style: TextStyle(
                            letterSpacing: 5,
                            fontSize: 14.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text:
                          "${data.home?.address?.buildingNumber ?? ''} ${data.home?.address?.streetName ?? ''}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white70,
                        letterSpacing: 5,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "\n${data.home?.address?.townName ?? ''}, ${data.home?.address?.postCode ?? ''}",
                          style: TextStyle(
                            letterSpacing: 5,
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: "\n${data.home?.address?.country ?? ''}",
                          style: TextStyle(
                            letterSpacing: 5,
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "${data.home?.balance.toString()}",
                      style: TextStyle(
                          fontSize: 26.sp, color: Colors.white, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "  ${data.home?.currency ?? ''}",
                          style: TextStyle(
                              fontSize: 10.sp, color: Colors.white70, letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // return ListView.builder(
        //     itemCount: repositories.length,
        //     itemBuilder: (context, index) {
        //       final repository = repositories[index];
        //
        //       return Text(repository['name'] ?? '');
        //     });
      },
    );
  }
}
