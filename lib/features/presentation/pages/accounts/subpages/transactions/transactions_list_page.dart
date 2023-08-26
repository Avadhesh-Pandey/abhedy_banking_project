import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/transactions_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/subpages/transactions/widgets/transactions_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getTransactionsRepo),
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        var data = TransactionsModel.fromJson(result.data);

        if(data.transactions==null || data.transactions!.isEmpty)
        {
          return const Text('No Record(s) Found');
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 16,bottom: 16),
            itemCount: data.transactions?.length,
            itemBuilder: (context, index) {
              return TransactionsListItemWidget(data.transactions![index]);
            });
      },
    );
  }
}
