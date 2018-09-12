const SDR = require('./SDR');
class Layer {
  constructor(size,previous,next) {
    //previous:= previous layer
    //next:= next layer
    this.previous = previous;
    this.next = next;
    this.lastOutput = new SDR(size,0);
    this.size = size;
    this.neurons = Layer.buildNeurons(size);
  }
  static buildNeurons(size) {
    let neurons = [];
    neurons.length = size;
    for(let i in neurons) {
      i = {
        threshold: 0,
        value: 0,
        inputs: {
          fromPrevious:[], //Array of [Index,threshold,using]
          fromThis:[],
          fromNext:[]
        }
      };
    }
    return neurons;
  }
}
module.exports = Layer;
