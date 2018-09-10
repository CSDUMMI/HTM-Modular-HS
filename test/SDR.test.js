const SDR = require('../src/SDR');


describe('SDR Class', () => {
    let s1 = new SDR(8,4);
    let s2 = new SDR(4,2);
    test ('Add Rule: n+n and w+w',() => {
        s1.add(s2);
        expect(s1.active).toEqual(6);
        expect(s1.size).toEqual(12);
    })
});