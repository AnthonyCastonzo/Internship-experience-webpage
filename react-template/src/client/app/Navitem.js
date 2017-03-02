import React from 'react';
import {render} from 'react-dom';

class Navitem extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			active:false
		}

	}
  	makeActive() {
  		this.setState ({active:true})
  	}
  	makeInactive() {
		this.setState ({active:false})

  }
  render () {
  	if (this.state.active === true){
  		var isActive = 'active'
  	}
  	else {
  		var isActive =''
  	}
    return (
			<h4 onMouseOver={this.makeActive.bind(this)} onMouseLeave={this.makeInactive.bind(this)} className={'title '+ isActive} id='h'>{this.props.name}</h4>
    	)
  }
}

export default Navitem