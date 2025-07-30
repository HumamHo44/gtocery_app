class CategoryModel {
  final String iconPath;
  final String title;
  final void Function() onTap;

  CategoryModel({
    required this.iconPath,
    required this.title,
    required this.onTap,
  });
}
