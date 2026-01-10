import 'package:flutter/material.dart';
import 'package:seave/core/widget/custom_fav_icon.dart';
import 'package:seave/feature/details/presentation/widget/back_arrow.dart';

class CustomSliverAppBarDetailsView extends StatelessWidget {
  const CustomSliverAppBarDetailsView({super.key, required this.imagesList});
  final List<String> imagesList;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 318,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: _ChaletImagesPageView(imagesList: imagesList),
      ),
      actions: const [
        Padding(padding: EdgeInsets.only(right: 8), child: CustomFavIcon()),
      ],
      leading: const BackArrow(),
    );
  }
}

class _ChaletImagesPageView extends StatefulWidget {
  const _ChaletImagesPageView({super.key, required this.imagesList});
  final List<String> imagesList;
  @override
  State<_ChaletImagesPageView> createState() => _ChaletImagesPageViewState();
}

class _ChaletImagesPageViewState extends State<_ChaletImagesPageView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.imagesList.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              widget.imagesList[index],
              fit: BoxFit.cover,
              cacheWidth: 600,
            );
          },
        ),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imagesList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.white54,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
