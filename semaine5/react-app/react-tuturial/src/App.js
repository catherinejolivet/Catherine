import React, { Component } from 'react';
import Web3 from "web3";
import './App.css';
import SceneOuverte from "./abis/SceneOuverte.json";

class App extends Component {
  constructor(props){
    super(props)
    this.state = {
      web3: null,
      account: "",
      sceneOuverte: "",
      tour: "",
      ArtisteActuel: "",
      loading: true
    }
    //this.passerArtiste = this.passerArtiste.bind(this);
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
         <img src="./logo.svg" className="App-logo" alt="logo"/>
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
      </div>
    );
  }
}
export default App;
