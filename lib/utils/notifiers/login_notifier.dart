import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:javagem/config/graphql.dart';

class LoginState {
  final bool isLoading;
  final String? token;
  final Map<String, dynamic>? user;
  final String? error;

  LoginState({
    required this.isLoading,
    this.token,
    this.user,
    this.error,
  });

  LoginState copyWith({
    bool? isLoading,
    String? token,
    Map<String, dynamic>? user,
    String? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      token: token,
      user: user,
      error: error,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;
  LoginNotifier(this.ref) : super(LoginState(isLoading: false, error: null));

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final client = ref.watch(graphQLClientProvider);

    String mutation = '''
      mutation {
        login(email: "$email", password: "$password") {
          token
          user {
            id
            firstName
            lastName
            email
          }
        }
      }
    ''';

    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: {
      'email': email,
      'password': password,
    });

    try {
      final QueryResult result = await client.mutate(options);
      if (result.hasException) {
        String? errorMessage = result.exception?.graphqlErrors.elementAt(0).message;
        state = state.copyWith(
            isLoading: false,
            error: errorMessage,
            user: null,
            token: null);
      } else {
        final Map<String, dynamic> data = result.data!['login'];
        state = state.copyWith(
            isLoading: false,
            token: data['token'],
            user: data['user'],
            error: null);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

 
}

 final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
    (ref) => LoginNotifier(ref),
  );
