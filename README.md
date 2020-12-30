# Community App
A flutter app with for mobile download and mobile web with community features like a time zone translated calendar and a showcase of member created widgets that can be placed easily.

This app will (hopefully) get published to the app stores and shared among our brand, so get your name in the list.

## Contribution notice

Before you start contributing, you need to copy `.env-example` file and name the copy `.env` (**don't** delete the `.env-example`). This is mandatory for app to build and is enough to get you going, but you won't see any events in app. If you wish to contribute to events part of the app, ask admins to give you the key.

## Adding your widget to the app
The app will have a list of member user created widgets to display.  
The app will push your widget on as a new page, but you can have multiple pages.  
Your widget will have the entire screen.  
Your widget can be anything you want, get creative with a mini-app, a unique animation, or simply post a mi-card, whatever you want.  

Some guidelines and best practices to follow:
- Users must be able to go back to the listview of user widgets. You should create back buttons for ease and use Navigator.pop().
- If you need a package, add it to /lib/widgets/user_widgets/user_widgets.dart and include it in in your pull request, but it's a good idea to check to make sure that your merge won't conflict with other user widgets already submitted or the rest of the app. 
- Try to use stateful widgets, setstate and inherited widgets for state management, if you need a state management package be sure to ask.
- You can add image assets, but keep the filesize as low as possible and try to keep your entire directory under 500KB, if possible. You are able to load network images. If you have a large dataset, you'll need to load that dynamically.

### Steps to add your widget to the app
You need do the following to add your widget to the project
1. Fork the repo, clone your fork, and checkout a new branch
   1. Fork a copy of the repo at https://github.com/Flutter-Buddies/App on your github account
   2. Clone your forked repo to your development environment 
   3. (optional) Checkout a custom "feature" branch (username? widget name?) 
   - If you need more help with this process, check out our [community contributing guidelines](https://github.com/Flutter-Buddies/README/blob/main/CONTRIBUTING.md) or ask for assistance.
2. Create your widget file or files in a separate folder under a new directory at /lib/widgets/user_widgets/ 
   - Your directory path should be /lib/widgets/user_widgets/<your_dir>/ (you can have any number of dirs in yours)
   - You don't need to create a main(), just extend a Widget type class that returns any Widget type.
   - See /lib/widgets/user_widgets/example.dart for reference.
3. Add `part of user_widgets;` to the top of your main widget file that you want to hook into the project. 
   - See /lib/widgets/user_widgets/example.dart for reference.
4. Extend and define a custom WidgetInfo class from 'widget_info.dart in your widget file.
   - This class needs a unique name from the other user's WidgetInfo extended classes. 
   - See /lib/widgets/user_widgets/example.dart for reference.
5. Add your project to user_widgets.dart 
   1. Add `part <path_to>/<your_file>.dart;` for your main file to the list of parts in /lib/widgets/user_widgets/user_widgets.dart.
   2. Instantiate your widget info class. Example: `ExampleInfo info = ExampleInfo();` and add it to the list `widgetInfoList`
   - If you add a package to this file, make sure to include pubspec.yaml and why you need it in your pull request.
6. Push your code to your forked repo and use github to create a pull request describing your widget and anything that is needed to know to merge the code.
   - Check out the [community contributing guidelines](https://github.com/Flutter-Buddies/README/blob/main/CONTRIBUTING.md) for assistance.
   - If your PR is approved, your code will be merged, if not you may need to change something, we'll let you know. 
