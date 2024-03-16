type t = WebAudio__Types.mediaStreamAudioDestinationNode
type options = {
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new
external make: (WebAudio__Types.audioContext, ~options: options=?) => t =
  "MediaStreamAudioDestinationNode"
@get external getStream: t => MediaStream.mediaStream = "stream"
@set external setStream: (t, MediaStream.mediaStream) => unit = "stream"
