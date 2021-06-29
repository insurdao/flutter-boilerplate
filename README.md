# insur



## Architecture

See simple state article in the resources section.
The widgets that listen to the state and rebuild on a change are generally called builder widgets.
We can hide futures behind a ValueNotifier, but can be done with streams as well.

If the UI needs to listen to state that’s in a ValueNotifier, then you should use a ValueListenableBuilder widget. The long name is rather unfortunate because it’s job is quite simple. Just rebuild a little section of the UI with the new value.




- getit: to access the state
- config.dart: it contains all we need in most of the application.
- base.dart: all we need for our state framework :)
- every page is a class that contains effect, reducer and state, and we
- register pages in the app.dart
- so from any component can access other pages state we also can have a global common state
- views access 'page' using getit
- state only function is 'apply' to change for a new copy of the state, that is
    in the 'value' variable from the
- access to database, API, etc... only in effect.
- effects, reducers and actions only contain functions, but the state is indeed
    a class, once it's the only part that we need to keep data in the memory.
    Following this pattern we go for a more functional approach.
- to change the state we have ONLY one function, 'apply', and business logic is
    concentrated only on reducers.


## Graphql

Use the [graphqlbin](https://www.graphqlbin.com/v2/new) to play. You can point
to https://graphql.bitquery.io .


* [graphql](https://pub.dev/packages/graphql) - dart graphql client

## File Structure


* config:
  - boot.dart: all the initalizations needed when the application starts


## Resources

* [simple-state](https://medium.com/flutter-community/flutter-state-management-for-minimalists-4c71a2f2f0c1)
* [graphql-tutorial](https://medium.com/@v.ditsyak/ultimate-toolchain-to-work-with-graphql-in-flutter-13aef79c6484)
* [null-guide](https://codewithandrea.com/videos/dart-null-safety-ultimate-guide-non-nullable-types/)
