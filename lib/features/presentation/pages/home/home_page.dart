import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/home_model.dart';
import 'package:flutter/material.dart';
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
        // List? repositories = result.data?['home']?['name'];

        // if (model == null) {
        //   return const Text('No repositories');
        // }

        return Align(
          alignment: Alignment.topCenter,
          child: Card(
            color: kPrimaryColour,
            margin: const EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 24),
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
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          data.home?.name ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white70,
                              ),
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            data.home?.currency ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ))
                    ],
                  ),
                  const Divider(
                    height: 32,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Account no : ",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      children: [
                        TextSpan(
                          text: data.home?.accountNumber ?? '',
                          style: const TextStyle(
                            letterSpacing: 5,
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text:
                          "${data.home?.address?.buildingNumber ?? ''} ${data.home?.address?.streetName ?? ''}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        letterSpacing: 5,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "\n${data.home?.address?.townName ?? ''}, ${data.home?.address?.postCode ?? ''}",
                          style: const TextStyle(
                            letterSpacing: 5,
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: "\n${data.home?.address?.country ?? ''}",
                          style: const TextStyle(
                            letterSpacing: 5,
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "${data.home?.balance.toString()}",
                      style: const TextStyle(
                          fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "  ${data.home?.currency ?? ''}",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white70, letterSpacing: 2),
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
