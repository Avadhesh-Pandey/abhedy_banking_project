import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/accounts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/widgets/accounts_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAccountRepo),
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        var data = AccountsModel.fromJson(result.data);

        if (data.accounts == null || data.accounts!.isEmpty) {
          return const Text('No Record(s) Found');
        }

        return ListView.builder(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            itemCount: data.accounts?.length,
            itemBuilder: (context, index) {
              return AccountsListItemWidget(data.accounts![index]);
            });
      },
    );
  }
}
