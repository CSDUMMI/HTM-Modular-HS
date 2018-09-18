const SDR = require('../src/SDR');


describe('SDR Class', () => {
    test ('Add Rule: n+n and w+w',() => {
        expect(SDR.add( new SDR(2,1),
                        new SDR(3,2)))
                        .toEqual(new SDR(5,3));
    });

    test ('More Active then if: n = n and w > w', () => {
      expect(SDR.moreActiveThen(new SDR(2,2),
                                new SDR(2,1)))
                                .toEqual(true);
    });

    test ('Concatenate two SDRs directly on the SDR instance', () => {
      let sdr1 = new SDR(7,3);
      let sdr2 = new SDR(6,2);
      sdr1.concatenate(sdr2);
      expect(sdr1).toEqual(new SDR(13,5));
    })
});
