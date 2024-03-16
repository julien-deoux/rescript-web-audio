module Impl = (
  T: {
    type t
  },
) => {
  @send external start: (T.t, ~when_: float=?) => unit = "start"
  @send external stop: (T.t, ~when_: float=?) => unit = "stop"
  @send external onEnded: (T.t, @as("ended") _, Dom.event => unit) => unit = "addEventListener"
}
