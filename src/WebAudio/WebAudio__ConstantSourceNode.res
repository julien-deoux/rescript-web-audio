type t = WebAudio__Types.constantSourceNode
type options = {offset?: float}

include WebAudio__AudioNode.Impl({
  type t = t
})
include WebAudio__AudioScheduledSourceNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "ConstantSourceNode"
@get external getOffset: t => WebAudio__Types.audioParam = "offset"
