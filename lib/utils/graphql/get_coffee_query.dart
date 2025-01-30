
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:javagem/config/graphql.dart';

final getCoffeeQueryProvider = FutureProvider<QueryResult>((ref) async {
  final client = ref.watch(graphQLClientProvider);
  const String query = r'''
    query {
      coffees {
        id
        name
        price
        description
        image
      }
    }
  ''';

  final QueryOptions options = QueryOptions(
    document: gql(query),
  );

  return client.query(options);
});