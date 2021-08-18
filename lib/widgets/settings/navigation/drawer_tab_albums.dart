import 'package:aves/model/filters/album.dart';
import 'package:aves/model/source/collection_source.dart';
import 'package:aves/theme/icons.dart';
import 'package:aves/widgets/common/extensions/build_context.dart';
import 'package:aves/widgets/drawer/tile.dart';
import 'package:aves/widgets/filter_grids/album_pick.dart';
import 'package:aves/widgets/settings/navigation/drawer_editor_banner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerAlbumTab extends StatefulWidget {
  final List<String> items;

  const DrawerAlbumTab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _DrawerAlbumTabState createState() => _DrawerAlbumTabState();
}

class _DrawerAlbumTabState extends State<DrawerAlbumTab> {
  @override
  Widget build(BuildContext context) {
    final source = context.read<CollectionSource>();
    return Column(
      children: [
        const DrawerEditorBanner(),
        const Divider(height: 0),
        Flexible(
          child: ReorderableListView.builder(
            itemBuilder: (context, index) {
              final album = widget.items[index];
              final filter = AlbumFilter(album, source.getAlbumDisplayName(context, album));
              return ListTile(
                key: ValueKey(album),
                leading: DrawerFilterIcon(filter: filter),
                title: DrawerFilterTitle(filter: filter),
                trailing: IconButton(
                  icon: const Icon(AIcons.clear),
                  onPressed: () {
                    setState(() => widget.items.remove(album));
                  },
                  tooltip: context.l10n.removeTooltip,
                ),
              );
            },
            itemCount: widget.items.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex -= 1;
                widget.items.insert(newIndex, widget.items.removeAt(oldIndex));
              });
            },
            shrinkWrap: true,
          ),
        ),
        const Divider(height: 0),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () async {
            final source = context.read<CollectionSource>();
            final album = await Navigator.push(
              context,
              MaterialPageRoute<String>(
                settings: const RouteSettings(name: AlbumPickPage.routeName),
                builder: (context) => AlbumPickPage(source: source, moveType: null),
              ),
            );

            if (album == null || album.isEmpty) return;

            setState(() {
              widget.items.add(album);
            });
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Theme.of(context).accentColor)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          icon: const Icon(AIcons.add),
          label: Text(context.l10n.settingsNavigationDrawerAddAlbum),
        )
      ],
    );
  }
}