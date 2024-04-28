type t = MediaStream__Types.mediaStream

@new external make: unit => t = "MediaStream"
@new external fromMediaStream: t => t = "MediaStream"
@new external fromMediaStreamTracks: array<MediaStream__Types.mediaStreamTrack> => t = "MediaStream"
@get external getActive: t => bool = "active"
@get external getId: t => string = "id"
@send external addTrack: (t, MediaStream__Types.mediaStreamTrack) => unit = "addTrack"
@send external clone: t => t = "clone"
@send external getAudioTracks: t => array<MediaStream__Types.mediaStreamTrack> = "getAudioTracks"
@send
external getTrackById: (t, string) => option<MediaStream__Types.mediaStreamTrack> = "getTrackById"
@send external getTracks: t => array<MediaStream__Types.mediaStreamTrack> = "getTracks"
@send external getVideoTracks: t => array<MediaStream__Types.mediaStreamTrack> = "getVideoTracks"
@send external removeTrack: (t, MediaStream__Types.mediaStreamTrack) => unit = "removeTrack"
@send
external onAddtrack: (t, @as("addTrack") _, Dom.trackEvent => unit) => unit = "addEventListener"
@send
external onRemoveTrack: (t, @as("removeTrack") _, Dom.trackEvent => unit) => unit =
  "addEventListener"
