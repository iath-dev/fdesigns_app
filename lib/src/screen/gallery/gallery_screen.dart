import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => _UiModel(),
          child: const Stack(
            children: [_PrintGrid(), _BottomMenu()],
          ),
        ),
      ),
    );
  }
}

class _UiModel with ChangeNotifier {
  bool _show = true;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }

  bool get show => _show;
}

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final uiProvider = Provider.of<_UiModel>(context);

    return Positioned(
        bottom: 20,
        child: SizedBox(
          width: size.width,
          child: Align(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: uiProvider.show ? 1 : 0,
              child: BottomNav(
                actions: [
                  BottomNavButton(
                      onPress: () => Navigator.of(context).pop(),
                      icon: Icons.home),
                  BottomNavButton(onPress: () => {}, icon: Icons.search),
                  BottomNavButton(onPress: () => {}, icon: Icons.settings),
                  BottomNavButton(onPress: () => {}, icon: Icons.person),
                ],
              ),
            ),
          ),
        ));
  }
}

class _PrintGrid extends StatefulWidget {
  const _PrintGrid();

  @override
  State<_PrintGrid> createState() => _PrintGridState();
}

class _PrintGridState extends State<_PrintGrid> {
  final items = List.generate(200, (index) => (index + 1).toString());
  final ScrollController controller = ScrollController();
  double previewScroll = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final offset = controller.offset;
      final uiProvider = Provider.of<_UiModel>(context, listen: false);

      print('offset: $offset');

      if (offset < previewScroll && offset > 200) {
        uiProvider.show = true;
      } else {
        uiProvider.show = false;
      }

      previewScroll = offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      semanticChildCount: items.length,
      gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ]),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];

          return _WidgetCard(id: item);
        },
        childCount: items.length,
      ),
    );
  }
}

class _WidgetCard extends StatelessWidget {
  const _WidgetCard({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          // 'https://placehold.co/600x400/png',
          'https://www.xtrafondos.com/wallpapers/satoru-gojo-jujutsu-kaisen-6852.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Center(
              child: CircularProgressIndicator(
                  value: _getLoadingProgress(loadingProgress).toDouble()),
            );
          },
        ),
      ),
    );
  }

  int _getLoadingProgress(ImageChunkEvent loadingProgress) {
    if (loadingProgress.expectedTotalBytes != null) {
      return (loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!)
          .floor();
    }

    return 100;
  }
}
