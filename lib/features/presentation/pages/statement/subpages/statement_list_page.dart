import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/statements_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/statement_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/widgets/statement_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StatementListPage extends StatelessWidget {
  StatementListPage({super.key});
  final Map<int,List<Statements>> statementMap={};

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getStatementsRepo),
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        var data = StatementsModel.fromJson(result.data);

        if(data.statements==null || data.statements!.isEmpty)
        {
          return const Text('No Record(s) Found');
        }

        for (var element in data.statements!) {
          var dt=DateTime.parse(fixDateFormatError(element.date??""));
          var list=statementMap[dt.year]??[];
          list.add(element);
          statementMap[dt.year]=list;
        }

        return StreamBuilder(
            stream: financialYearChanged.stream,
            initialData: 2023,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData)
                {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 16,bottom: 16),
                      itemCount: statementMap[snapshot.data]!.length,
                      itemBuilder: (context, index) {
                        return StatementListItemWidget(statementMap[snapshot.data]![index]);
                      });
                }
              return const Text('No Record(s) Found');
            }
        );
      },
    );
  }

  String fixDateFormatError(String date)
  {
    var dateSplit=date.split("-");
    if(dateSplit[1].length==1 || dateSplit[2].length==1)
    {
      if(dateSplit[1].length==1)
      {
        dateSplit[1]="0${dateSplit[1]}";
      }
      if(dateSplit[2].length==1)
      {
        dateSplit[2]="0${dateSplit[2]}";
      }
      date=dateSplit.join("-");
    }
    return date;
  }
}
