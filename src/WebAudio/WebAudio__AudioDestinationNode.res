type t = WebAudio__Types.audioDestinationNode

include WebAudio__AudioNode.Impl({
  type t = t
})

@get external getMaxChannelCount: t => float = "maxChannelCount"
@set external setMaxChannelCount: (t, float) => unit = "maxChannelCount"
