import React from 'react';
import {render} from 'react-dom';
import Navitem from './Navitem';

class Nav extends React.Component {
  render () {
  	var items = ['Home', 'Social Media', 'Charles', 'Movies', 'TV','Video Games', 'Contact']

  	var navitems = items.map(function(item){
  		return 	<Navitem name={item} />
  	})
  	    
  	   return (
      <div>
        <div id='intro'>
        <h1>Welcome to the Anthony Castonzo Webpage</h1>
        </div>
        <div className="nav-component">
          <div id='menu'>
            {navitems}
          </div>
        </div>
      </div>
      )
  }
}

export default Nav