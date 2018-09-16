class Connection {
  constructor(input_index,input_layer,threshold,using) {
    this.index = input_index;
    this.layer = input_layer;
    this.threshold = threshold;
    this.using = using;
  }
  receive() {
    this.using++;
    return this.threshold < this.using ? this.layer.lastOutput[this.index] : 0;
  }
}

module.exports = Connection;
