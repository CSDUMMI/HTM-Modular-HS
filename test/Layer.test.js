const Layer = require('../src/Layer');


describe('Layer Objects', () => {
  test('Build an Array of Neurons.', () => {
      /*
      Each Element should have these fields:
      {
        threshold: 0,
        value: 0,
        inputs: {
          fromPrevious:[], //Array of [Index,threshold,using]
          fromThis:[],
          fromNext:[]
        }
        filled with these standards.
      */
      let n_array = Layer.buildNeurons(10);
      for(n in n_array) {
          expect(n).toEqual({
            threshold: 0,
            value: 0,
            inputs: {
              fromPrevious:[],
              fromThis:[],
              fromNext:[]
            }
          });
      }
  });
});
