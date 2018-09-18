class Connection {
  constructor(first,second,first_segment,second_segment,threshold,using) {
    this.first = {
      neuron:first,
      segment:first_segment
    };
    this.second = Object.create(this.first);
    this.second.neuron = second;
    this.second.segment = second_segment;
    this.threshold = threshold;
    this.using = using;
  }

  receive(receiver) {
    this.using++;
    if(this.using > this.threshold) {
      //TODO: Place here activation function for Connection
      switch(receiver) {
        case this.first.neuron:
          return this.second.neuron.lastActivation;
          break;
        case this.second.neuron:
          return this.first.neuron.lastActivation;
          break;
        default:
          throw "Error:Connection.receive on " +
          this +
          " called with invalid argument";
      }
    } else {
      return 0;
    }
  }
}

module.exports = Connection;
