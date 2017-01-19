import App from 'components/app';
import Mainpage from 'components/Mainpage';
import { shallow } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('App', () => {
  let wrapper;
  describe('shallow rendered component', () => {
    beforeEach(() => {
      spyOn(App.prototype, 'handleClick').and.callThrough();
      wrapper = shallow(<App
                        />);
    });
    it('should should have the specified inital state', () => {
      expect(wrapper.state()).toEqual({ memes: this.state.data.memes });
    });

    it('should render a Mainpage Component', () => {
      expect(wrapper.find(Mainpage)).toBePresent();
    });

    it('should render the Mainpage Component with specific props before initial click', () => {
      expect(wrapper.find(Mainpage).props()).toEqual({
        image: "https://i.imgflip.com/1bij.jpg",
        name: 'One Does Not Simply'
      });
    });

    describe('handleClick', () => {
      it('should be invoked when the function assigned to the onClick propety of the Mainpage props is executed', () => {
        wrapper.find(Mainpage).props().onClick();
        expect(App.prototype.handleClick).toHaveBeenCalled();
      });

      it('should change the the meme props to another meme', () => {
        wrapper.find(Mainpage).props().onClick();
        expect(wrapper.state()).toNotEqual({ randMeme: this.state.data.memes[0] });
      });
    });
  })
});
