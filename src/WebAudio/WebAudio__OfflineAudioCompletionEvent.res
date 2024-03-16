type t = WebAudio__Types.offlineAudioCompletionEvent
type options = {renderedBuffer?: WebAudio__Types.audioBuffer}

@new external make: (string, ~options: options=?) => t = "OfflineAudioCompletionEvent"
@get external getRenderedBuffer: t => WebAudio__Types.audioBuffer = "renderedBuffer"
