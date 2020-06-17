class SlidingItem{
  SlidingItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final  sampleItems = <SlidingItem>[
  new SlidingItem(title: 'ruaruarua',category: 'rua',imageUrl: 'images/slidings/1.png'),
  new SlidingItem(title: 'ruaruarua',category: 'rua',imageUrl: 'images/slidings/2.png'),
  new SlidingItem(title: 'ruaruarua',category: 'rua',imageUrl: 'images/slidings/3.png'),
];