import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//import 'package:insur_mobile/config/environment.dart';
//import 'package:insur_mobile/widgets/toast.dart';
//   late GraphQLClient _httpClient;
//   late GraphQLClient _websocketClient;

final _url = 'https://graphql.bitquery.io';

final _client = GraphQLClient(

  link: HttpLink('https://graphql.bitquery.io'),
  cache: GraphQLCache(),
);


final _webSocketLink = WebSocketLink(
    url: _url,
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: const Duration(minutes: 5),
    ));

final _websocket = GraphQLClient(

  link: HttpLink('https://graphql.bitquery.io'),
  cache: GraphQLCache(),
);
// class InsurGraph {
//   static final InsurGraph _graph = InsurGraph._internal();
//
//   factory InsurGraph() => _graph;
//   InsurGraph._internal();

  Future<QueryResult> query(Map<String, dynamic> variables, String queryText, BuildContext context) async {
    final options = QueryOptions(document: gql(queryText), variables: variables);
    final response = await _client.query(options);
    //if (response.hasException) _toastException(response.exception, context);
    return response;
  }

  Future<QueryResult> mutate(Map<String, dynamic> variables, String mutationText, BuildContext context) async {
    final options = MutationOptions(document: gql(mutationText), variables: variables);
    final response = await _client.mutate(options);
    //if (response.hasException) _toastException(response.exception, context);
    _client.cache.store.reset();
    return response;
  }

  Stream<FetchResult> subscribe(String subscription,
      {String operationName, Map<String, dynamic> variables}) {
    var _stream = _websocketClient.subscribe(Operation(
        documentNode: gql(subscription),
        variables: variables,
        operationName: operationName));
    return _stream;
  }
  // static _toastException(OperationException exception, BuildContext context) {
  //   final fToast = FToast()..init(context);
  //   print(exception.linkException.toString());
  //   fToast.showToast(
  //       child: MyToast(
  //         msg: exception.graphqlErrors.isEmpty ? exception.linkException.toString() : exception.graphqlErrors.first.message,
  //         backgroundColor: Colors.red,
  //       ),
  //       toastDuration: Duration(seconds: 4));
  // }


// }
// class GraphQLService {
//   late HttpLink _httpLink;
//   late WebSocketLink _webSocketLink;
//   InMemoryCache cache = InMemoryCache();
//   late GraphQLClient _httpClient;
//   late GraphQLClient _websocketClient;
//   void setupClient(
//       {@required String httpLink, @required String webSocketLink}) {
//     /*final AuthLink authLink = AuthLink(
//       getToken: () => token
//     );*/
//
//     _httpLink = HttpLink(
//       uri: httpLink,
//     );
//     _webSocketLink = WebSocketLink(
//         url: webSocketLink,
//         config: SocketClientConfig(
//           autoReconnect: true,
//           inactivityTimeout: const Duration(minutes: 5),
//         ));
//
//     //Link httpLink = authLink.concat(_httpLink);
//     //Link webSocketLink = authLink.concat(_webSocketLink);
//
//     _httpClient = GraphQLClient(link: _httpLink, cache: cache);
//     _websocketClient = GraphQLClient(link: _webSocketLink, cache: cache);
//   }
//
//   Future<QueryResult> query(String query, {Map<String, dynamic> variables}) {
//     return _httpClient
//         .query(QueryOptions(documentNode: gql(query), variables: variables));
//   }
//
//   Future<QueryResult> mutate(String mutation,
//       {Map<String, dynamic> variables}) {
//     return _httpClient.mutate(
//         MutationOptions(documentNode: gql(mutation), variables: variables));
//   }
//
//   Stream<FetchResult> subscribe(String subscription,
//       {String operationName, Map<String, dynamic> variables}) {
//     var _stream = _websocketClient.subscribe(Operation(
//         documentNode: gql(subscription),
//         variables: variables,
//         operationName: operationName));
//     return _stream;
//   }
// }

//
//
//
//
//
//
