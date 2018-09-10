class SDR {
    constructor(size,act) {
        this.active = act;
        this.size = size;
    }
    add(other) {
        this.active += other.active;
        this.size += other.size;
    }
}

module.exports = SDR;