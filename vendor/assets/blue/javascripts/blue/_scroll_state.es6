class ScrollState {
  constructor(currentScrollTop, lastScrollTop) {
    this.currentScrollTop = currentScrollTop;
    this.lastScrollTop = lastScrollTop;
    this.delta = 50;
  }

  hasScrolledDown() {
    return this.currentScrollTop > this.lastScrollTop;
  }

  hasPassedTheElement(elementHeight) {
    return this.currentScrollTop > elementHeight;
  }

  isAtTheTop() {
    return this.currentScrollTop == 0;
  }

  hasntScrolledEnough() {
    return Math.abs(this.lastScrollTop - this.currentScrollTop) <= this.delta;
  }
}
