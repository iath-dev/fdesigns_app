import 'package:fdesigns_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> children;
  final bool? dotsTop;
  final Color? primaryColor;
  final Color? secondaryColor;
  final double? primarySize;
  final double? secondarySize;
  final BoxShape? shape;

  const SlideShow(
      {super.key,
      required this.children,
      this.primaryColor,
      this.secondaryColor,
      this.dotsTop,
      this.primarySize,
      this.secondarySize,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(children),
      child: Builder(builder: (context) {
        Provider.of<SliderModel>(context)
          ..children = children
          ..primaryColor = primaryColor ?? Theme.of(context).colorScheme.primary
          ..secondaryColor = secondaryColor ?? Colors.blueGrey
          ..dotsTop = dotsTop ?? false
          ..primarySize = primarySize ?? 16
          ..secondarySize = secondarySize ?? 12
          ..shape = shape ?? BoxShape.circle;

        return const _SlideShowContent();
      }),
    );
  }
}

class _SlideShowContent extends StatefulWidget {
  const _SlideShowContent({
    super.key,
  });

  @override
  State<_SlideShowContent> createState() => _SlideShowContentState();
}

class _SlideShowContentState extends State<_SlideShowContent> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final provider = Provider.of<SliderModel>(context, listen: false);

      if (controller.page != null) {
        provider.currentPage = controller.page!;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderModel>(context);
    final children = provider.children;
    final dotsTop = provider.dotsTop;

    return Center(
      child: Column(
        children: [
          if (dotsTop) _Dots(size: children.length),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: children.length,
              itemBuilder: (context, index) => _Slide(child: children[index]),
            ),
          ),
          if (!dotsTop) _Dots(size: children.length),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;

  const _Slide({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: child);
  }
}

class _Dots extends StatelessWidget {
  final int size;

  const _Dots({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(size, (index) => _Dot(index: index)),
        ));
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderModel>(context, listen: true);

    final active = provider.currentPage.round() == index;
    final shape = provider.shape;

    final primary = provider.primaryColor;
    final secondary = provider.secondaryColor;
    final primarySize = provider.primarySize;
    final secondarySize = provider.secondarySize;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? primarySize : secondarySize,
      height: active ? primarySize : secondarySize,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration:
          BoxDecoration(color: active ? primary : secondary, shape: shape),
    );
  }
}
