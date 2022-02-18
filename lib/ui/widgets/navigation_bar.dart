import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:developer' as dev;

class NavigationBar extends StatelessWidget {
  final Function? onPressLogOut;
  final Function? onPressSearchTextField;
  final String description1;
  final String description2;
  final String image;
  @Deprecated('if onPressLogOut is set, will show it, if not, not')
  final bool showLogout;
  final bool showSearchTextField;
  @Deprecated('this is now translated with MaterialLocalizations')
  final String? hintSearchResource;
  @Deprecated('if titleText is set, will show it, if not, not')
  final bool showTitle;
  final String titleText;

  /// in the IconButton Widget it is not required the tooltip
  /// but it is highly recommended to set it
  final List<IconButton>? iconButtonList;

  const NavigationBar({
    Key? key,
    required this.description1,
    required this.description2,
    required this.image,
    this.titleText = '',
    this.showTitle = false,
    this.hintSearchResource,
    this.showSearchTextField = false,
    this.showLogout = false,
    this.onPressLogOut,
    this.onPressSearchTextField,
    this.iconButtonList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: <ResponsiveGridCol>[
        // 1st Column Title
        ResponsiveGridCol(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            height: (titleText.isNotEmpty) ? 80 : 0,
            alignment: Alignment.centerLeft,
            child: Text(
              titleText,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(fontSize: 26),
            ),
          ),
          xl: 4,
          lg: 4,
          md: 3,
          sm: 12,
          xs: 12,
        ),
        // 2nd Column Search
        ResponsiveGridCol(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            height: 80,
            child: CenterColumn(
              hintSearchResource:
              MaterialLocalizations.of(context).searchFieldLabel,
              showSearchTextField: showSearchTextField,
              onPressSearchTextField: onPressSearchTextField ?? () {},
            ),
          ),
          xl: 4,
          lg: 4,
          md: 4,
          sm: 12,
          xs: 12,
        ),

        ResponsiveGridCol(
          // 3rd Column User
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: CircleAvatar(
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    radius: 25.0,
                    child: ClipOval(
                      child: Image.network(
                        image,
                        errorBuilder: (_, __, ___) {
                          dev.log('NavigationBar: User Image not found',
                              name: 'PACKAGE-MES_COMMON');
                          return Container();
                        },
                        fit: BoxFit.scaleDown,
                        width: 60.0,
                        height: 60.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        description1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.overline!.color),
                      ),
                      Text(
                        description2,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.overline!.color),
                      ),
                    ],
                  ),
                ),
                ..._getIconButtonList(),
                SizedBox(
                  // height: 80,
                  child: (onPressLogOut != null)
                      ? IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => onPressLogOut!(),
                  )
                      : Container(),
                ),
              ],
            ),
          ),
          xl: 4,
          lg: 4,
          md: 5,
          sm: 12,
          xs: 12,
        ),
      ],
    );
  }

  List<Widget> _getIconButtonList() {
    if (iconButtonList == null) {
      return <Widget>[Container()];
    }

    if (iconButtonList!.length < 3) {
      return iconButtonList!;
    } else {
      return <Widget>[
        PopupMenuButton<IconButton>(
          itemBuilder: (BuildContext context) {
            return iconButtonList!.map((IconButton choice) {
              return PopupMenuItem<IconButton>(
                  value: choice,
                  child: TextButton(
                    onPressed: choice.onPressed,
                    child: Row(
                      children: <Widget>[choice, Text(choice.tooltip ?? '')],
                    ),
                  ));
            }).toList();
          },
        )
      ];
    }
  }
}

class CenterColumn extends StatefulWidget {
  final bool showSearchTextField;
  final Function onPressSearchTextField;
  final String hintSearchResource;

  const CenterColumn(
      {Key? key,
        required this.showSearchTextField,
        required this.onPressSearchTextField,
        required this.hintSearchResource})
      : super(key: key);

  @override
  _CenterColumnState createState() => _CenterColumnState();
}

class _CenterColumnState extends State<CenterColumn> {
  TextEditingController _textEditingSearchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return (widget.showSearchTextField)
        ? Center(
      child: TextField(
          textAlign: TextAlign.center,
          maxLength: 200,
          controller: _textEditingSearchController,
          onEditingComplete: () => widget
              .onPressSearchTextField(_textEditingSearchController.text),
          decoration: InputDecoration(
              filled: true,
              //fillColor: Theme.of(context).backgroundColor,
              border: const OutlineInputBorder(
                  borderSide:
                  BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(6.0)),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary)),
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: _searchText.isNotEmpty
                  ? ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: _textEditingSearchController.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              )
                  : null,
              counterText: '',
              hintText: widget.hintSearchResource)),
    )
        : Container();
  }

  @override
  void initState() {
    super.initState();
    _textEditingSearchController = TextEditingController();
    _textEditingSearchController.addListener(() {
      setState(() {
        _searchText = _textEditingSearchController.text;
      });
    });
  }
}
