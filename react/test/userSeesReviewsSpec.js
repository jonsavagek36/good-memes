import Reviews from '../src/components/Reviews';
import Review from '../src/components/Review';

describe('Meme Reviews', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('reviews/reviewsIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the meme show page', () => {
    beforeEach(() => {
      wrapper = mount(
        <Reviews />
      );
    });

    it('has the meme and reviews of said meme', done => {
      setTimeout(() => {
        let pageText = wrapper.text();
        console.log(pageText)
        expect(pageText).toMatch('SO FUEGS BRO');
        expect(pageText).toMatch('♨️♨️♨️♨️♨️');

        done();
      },0)
    });

    it('should render a Review component', () => {
      setTimeout(() => {
        expect(wrapper.find(Review)).to.have.length(1);
        done();
      },0)
    });

    it('should render Review component with init states of 0', () => {
      setTimeout(() => {
        expect(wrapper.find({ props: 'reviews' })).to.have.length(1);
      },0)
    });

    it('should render an Upvote component', () => {
      setTimeout(() => {
        expect(wrapper.find(Upvote)).to.have.length(1);
        done();
      },0)
    });

    it('should render an Downvote component', () => {
      setTimeout(() => {
        expect(wrapper.find(Downvote)).to.have.length(1);
        done();
      },0)
    });
  });

  describe('handling of voting', () => {
    beforeEach(() => {
      wrapper = mount(
        <Reviews />
      );
    });

    it('should be invoked when function assigned to onClick in Upvote is exec', () => {
      setTimeout(() => {
        expect(wrapper.find(Upvote)).props().onClick();
        expect(Review.prototype.handleUpvote).toHaveBeenCalled();
      },0)
    });

    it('should be invoked when function assigned to onClick in Downvote is exec', () => {
      setTimeout(() => {
        expect(wrapper.find(Downvote)).props().onClick();
        expect(Review.prototype.handleDownvote).toHaveBeenCalled();
      },0)
    });
  });
});
