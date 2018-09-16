const Connection = require('../src/Connection');

describe('Connection Class', () => {
  let con;
  let test_layer = {
     lastOutput:[0,1,2,3,4,5,6]
  };
  test('Initilization', () => {
      con = new Connection(3,test_layer,54,53);
      expect(con.threshold).toEqual(54);
      expect(con.using).toEqual(53);
      expect(con.index).toEqual(3);
  });
  test('Receive: using++ then test for receiving', () => {
    expect(con.receive()).toEqual(0); //using++ => using == threshold
    expect(con.receive()).toEqual(3); //using++ => using > threshold
  });
});
