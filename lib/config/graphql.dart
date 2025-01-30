import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final HttpLink httpLink = HttpLink('https://java-gem-backend-production.up.railway.app/graphql');
  return GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );
});
