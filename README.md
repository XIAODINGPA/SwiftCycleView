# SwiftCycleView
图片轮播

Swift4.2使用UIScrollView 实习图片轮播
轮播原理
UIScrollView对象有pagingEnable成员，如果设置为YES，那么每一个scrollView尺寸这么大的区域就会被当作一页，在滚动时会根据滚动的比例自动计算应该切换到哪一页。

无限滚动原理
要实现无限滚动，需要额外的两张图片，假设我们的图片有五张，存在images数组中，那么我们在将图片插入到scrollView中时，在第一张图片前面插入一个最后一张图片作为辅助图片，在最后一张后面插入一个第一张图片作为辅助图片。这样，当滚动到第一张前面一张时，在页面切换结束后无动画的切换scrollView的偏移量为最后一张图片（不包含最后一张后面的第一张那个辅助图片），这样就实现了由辅助图片到真实图片的过渡，之所以设置辅助图片是为了在滚动中看到那个真实图片。同理，当滚动到最后一张的后面一张时，我们吧scrollView的偏移量设置为第一张图片即可。

![image](https://github.com/XIAODINGPA/SwiftCycleView/blob/master/%E8%BD%AE%E6%92%AD%E5%9B%BE.gif)
