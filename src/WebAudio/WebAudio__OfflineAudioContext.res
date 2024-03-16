type t = WebAudio__Types.offlineAudioContext
type options = {
  numberOfChannels: int,
  length: float,
  sampleRate: float,
}

include WebAudio__BaseAudioContext.Impl({
  type t = t
})

@new external make: options => t = "OfflineAudioContext"
@get external getLength: t => float = "length"
@send external suspend: (t, float) => promise<unit> = "suspend"
@send external startRendering: t => promise<WebAudio__Types.audioBuffer> = "startRendering"
