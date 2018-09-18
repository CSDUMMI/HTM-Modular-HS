const Connection = require('../src/Connection');

describe('Connection Class', () => {

  let con;

  class TestSegment {
    fired() {
      console.log("Neuron Fired");
    }
  }

  class TestNeuron {
    constructor() {
      this.lastActivation = 0;
      this.segments = [new TestSegment()];
    }
  }

  let tNeuron1 = new TestNeuron();
  tNeuron1.lastActivation = 1;
  let tNeuron2 = new TestNeuron();

  con = new Connection(tNeuron1,tNeuron2,0,0,2,1);
  test('Initilization', () => {
      expect(con.threshold).toEqual(2);
      expect(con.using).toEqual(1);
  });
  test('Receive: using++ then test for receiving', () => {
    expect(con.receive(tNeuron1)).toEqual(0);//using++ => 2
    expect(con.receive(tNeuron2)).toEqual(1);//using++ => 3
    expect(() => con.receive()).toThrow();
  });
});
