type t = WebAudio__Types.audioBuffer
type options = {
  length: int,
  sampleRate: float,
  numberOfChannels?: int,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

@new external make: options => t = "AudioBuffer"
@get external getSampleRate: t => float = "sampleRate"
@get external getLength: t => int = "length"
@get external getDuration: t => float = "duration"
@get external getNumberOfChannels: t => int = "numberOfChannels"
@send external getChannelData: (t, int) => RescriptCore.Float32Array.t = "getChannelData"
@send
external copyFromChannel: (t, RescriptCore.Float32Array.t, int, ~startInChannel: int=?) => unit =
  "copyFromChannel"
@send
external copyToChannel: (t, RescriptCore.Float32Array.t, int, ~startInChannel: int=?) => unit =
  "copyToChannel"
