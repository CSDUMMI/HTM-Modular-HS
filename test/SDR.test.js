const SDR = require('../src/SDR');


describe('SDR Class', () => {
    test ('Add Rule: n+n and w+w',() => {
        expect(SDR.add( new SDR(2,1),
                        new SDR(3,2)))
                        .toEqual(new SDR(5,3));
    })
});
