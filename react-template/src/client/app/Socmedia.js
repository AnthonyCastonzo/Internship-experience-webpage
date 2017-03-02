import React from 'react';
import {render} from 'react-dom';

class Socmedia extends React.Component {
    
    constructor(props){
      super(props)
      this.state = {twitDisplayed:false, instaDisplayed:false}
    }

  	popComment(event){
      if (event.target.id === 'twit'){
        this.setState({twitDisplayed:true})
      }
  		else if (event.target.id === 'insta'){
        this.setState({instaDisplayed:true})        
      }
        
  	}
  	popNoComment(event){
      if (event.target.id === 'twit'){
        this.setState({twitDisplayed:false})
      }
      else if (event.target.id === 'insta'){
        this.setState({instaDisplayed:false})        
      }
  	}
  	render(){
  		if (this.state.twitDisplayed === true){
  			var isDisplayedTwit = 'appear'
  		}
  		else{
  			var isDisplayedTwit = ''
  		}
      if (this.state.instaDisplayed === true){
        var isDisplayedInsta = 'appear'
      }
      else{
        var isDisplayedInsta = ''
      }

  	return(
    <div>
      <div  className='category'>
        <h2 id='socmed'>Social Media</h2>
      </div>
      <div className='smicons'>			
    		<div id='twitter' className='socialmedia'>
  			<a href='https://twitter.com/AnthonyCastonzo?lang=en' target='_blank'>
  			<img  onMouseOver={this.popComment.bind(this)} onMouseLeave={this.popNoComment.bind(this)} id='twit' src="https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300" alt='Twitter' width="100" height="100"/>
  			</a>
  			<div className={'mediacomment ' + isDisplayedTwit}><p>Check out my Twitter!</p></div>
  		</div>
  		<div id='instagram' className='socialmedia'>
  			<a href='https://www.instagram.com/mr._poop_iii/' target='_blank'>
  			<img  onMouseOver={this.popComment.bind(this)} onMouseLeave={this.popNoComment.bind(this)} id='insta' src="https://lh3.googleusercontent.com/aYbdIM1abwyVSUZLDKoE0CDZGRhlkpsaPOg9tNnBktUQYsXflwknnOn2Ge1Yr7rImGk=w300" alt="Instagram" width="100" height="100"/>
  			</a>
  			<div className={'mediacomment ' + isDisplayedInsta}><p>Check out my Instagram!</p></div>
    		</div>
      </div>
    </div>
  		)
  	}
}
export default Socmedia