type t = WebAudio__Types.mediaElementAudioSourceNode
type options = {
  mediaElement: Dom.htmlMediaElement,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new
external make: (WebAudio__Types.audioContext, ~options: options) => t =
  "MediaElementAudioSourceNode"
@get external getMediaElement: t => Dom.htmlMediaElement = "mediaElement"
