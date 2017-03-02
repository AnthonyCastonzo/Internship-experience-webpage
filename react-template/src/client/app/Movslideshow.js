import React from 'react';
import {render} from 'react-dom';
var movdata = [
{
	id: 'logan',
	imagePath: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MjkzMjczMV5BMl5BanBnXkFtZTgwNDk4NjYyMTI@._V1_UX182_CR0,0,182,268_AL_.jpg',
	imageAlt: 'Logan Poster',
	title: 'Logan',
	actionHref: 'http://www.imdb.com/title/tt3315342/?ref_=fn_al_tt_1'
},
{
	id: 'beautbeast',
	imagePath: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwNjUxMTM4NV5BMl5BanBnXkFtZTgwODExMDQzMTI@._V1_UX182_CR0,0,182,268_AL_.jpg',
	imageAlt: 'Beauty and the Beast Poster',
	title: 'Beauty and the Beast',
	actionHref: 'http://www.imdb.com/title/tt2771200/?ref_=nv_sr_1'
},
{
	id: 'legobatman',
	imagePath: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_UX182_CR0,0,182,268_AL_.jpg',
	imageAlt: 'LEGO Batman Poster',
	title: 'LEGO Batman',
	actionHref: 'http://www.imdb.com/title/tt4116284/?ref_=nv_sr_1'
},
{
	id: 'kong',
	imagePath: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwMzI5ODEwNF5BMl5BanBnXkFtZTgwNjAzNjI2MDI@._V1_UX182_CR0,0,182,268_AL_.jpg',
	imageAlt: 'Kong: Skull Island Poster',
	title: 'Kong: Skull Island',
	actionHref: 'http://www.imdb.com/title/tt3731562/?ref_=nv_sr_1'	
},
{
	id: 'powerrangers',
	imagePath: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA5MzU1NDI4NzBeQTJeQWpwZ15BbWU4MDUxMDQ0NDEy._V1_UX182_CR0,0,182,268_AL_.jpg',
	imageAlt: 'Power Rangers Poster',
	title: 'Power Rangers',
	actionHref: 'http://www.imdb.com/title/tt3717490/?ref_=nv_sr_1'

}]

class Movslideshow extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			currentSlide: 0
		}
	}
	toggleNext(){
		var slide = this.state.currentSlide
		if ((slide + 1) > (movdata.length - 1)){
			slide = 0
		}
		else{
			slide = slide + 1
		}
		this.setState({currentSlide:slide}) 
	}
	togglePrevious(){
		var slide = this.state.currentSlide
		if ((slide - 1) < 0){
			slide = movdata.length - 1
		}
		else{
			slide = slide - 1
		}
		this.setState({currentSlide:slide}) 
	}
	
	render(){
		return(
			<div className='slideshowmov'>
				<div className='posterbg'>
					<a href={movdata[this.state.currentSlide].actionHref} target='_blank'>
						<img className='poster' src={movdata[this.state.currentSlide].imagePath} width='250px'/>
					</a>
				</div>
				<button id='prevslide' onClick = {this.togglePrevious.bind(this)}>&lt;</button>
				<button id='nextslide' onClick = {this.toggleNext.bind(this)}>&gt;</button>
			</div>
			)
	}
}


export default Movslideshow