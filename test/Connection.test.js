const Connection = require('../src/Connection');

describe('Connection Class', () => {
  let con;
  let test_layer = {
     lastOutput:[0,1,2,3,4,5,6]
  };
  test('Initilization', () => {
      con = new Connection(3,test_layer,54,53);
      expect(con.receive()).toEqual(0); //using++ => using == threshold
      expect(con.receive()).toEqual(3); //using++ => using > threshold
  });
});
