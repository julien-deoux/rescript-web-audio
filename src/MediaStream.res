type mediaStream
type mediaStreamTrack

module MediaStream = {
  @new external make: unit => mediaStream = "MediaStream"
  @new external fromMediaStream: mediaStream => mediaStream = "MediaStream"
  @new external fromMediaStreamTracks: array<mediaStreamTrack> => mediaStream = "MediaStream"
  @get external getActive: mediaStream => bool = "active"
  @get external getId: mediaStream => string = "id"
  @send external addTrack: (mediaStream, mediaStreamTrack) => unit = "addTrack"
  @send external clone: mediaStream => mediaStream = "clone"
  @send external getAudioTracks: mediaStream => array<mediaStreamTrack> = "getAudioTracks"
  @send external getTrackById: (mediaStream, string) => option<mediaStreamTrack> = "getTrackById"
  @send external getTracks: mediaStream => array<mediaStreamTrack> = "getTracks"
  @send external getVideoTracks: mediaStream => array<mediaStreamTrack> = "getVideoTracks"
  @send external removeTrack: (mediaStream, mediaStreamTrack) => unit = "removeTrack"
  @send
  external onAddtrack: (mediaStream, @as("addTrack") _, Dom.trackEvent => unit) => unit =
    "addEventListener"
  @send
  external onRemoveTrack: (mediaStream, @as("removeTrack") _, Dom.trackEvent => unit) => unit =
    "addEventListener"
}
