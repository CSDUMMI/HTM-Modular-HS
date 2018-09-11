class SDR {
    constructor(size,act) {
        this.active = act;
        this.size = size;
    }
    static add(sdr1,sdr2) {
        return new SDR( sdr1.size + sdr2.size,
                        sdr1.active + sdr2.active);
    }
}

module.exports = SDR;
