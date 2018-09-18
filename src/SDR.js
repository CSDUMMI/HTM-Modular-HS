class SDR {
    constructor(size,act) {
        this.active = act;
        this.size = size;
    }
    static add(sdr1,sdr2) {
        return new SDR( sdr1.size + sdr2.size,
                        sdr1.active + sdr2.active);
    }
    static moreActiveThen(sdr1,sdr2) {
      //Rule sdr1.size = sdr2.size & sdr1.active > sdr2.active
      return sdr1.size == sdr2.size && sdr1.active > sdr2.active;
    }
    concatenate(other) {
      //Place other at the end of this SDR
      this.size += other.size;
      this.active += other.active;
    }
}

module.exports = SDR;
