import React from 'react';
import {render} from 'react-dom';
import Nav from './Nav'
import Socmedia from './Socmedia'
import Movslideshow from './Movslideshow'

class App extends React.Component {

  render () {
    return (
    	<div>
    		<Nav />
    	</div>
    	)
  }
}

render(<App/>, document.getElementById('app'));

class App2 extends React.Component {
  render () {
    return (
    		<Socmedia />
    	)
  }
}

render(<App2/>, document.getElementById('app2'));

class App3 extends React.Component {
	render(){
		return(
			<Movslideshow />
			)
	}
}

render(<App3/>, document.getElementById('app3'));