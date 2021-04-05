import React, { createRef } from 'react';
import {
  NativeEventEmitter,
  NativeModules,
  EmitterSubscription,
  Dimensions,
} from 'react-native';
import { RNKalturaPlayerView } from './RNKalturaView';

const { ModuleWithEmitter } = NativeModules;
const PlayerRef = createRef<any>();

/** Player Event Message */
type PlayerStateMessage =
  | 'loadedmetadata'
  | 'canplay'
  | 'play'
  | 'pause'
  | 'seeking'
  | 'seeked';
type PlayerErrorMessage = any;
type PlayerFullscreenMessage = boolean;

type Props = {
  height: number;
  width: number;
  event?: (
    channel: 'PlayerState' | 'PlayerError' | 'PlayerFullscreen',
    message: any
  ) => void;
};
type State = {};

class RNKalturaPlayer extends React.PureComponent<Props, State> {
  public PlayerState: EmitterSubscription | null = null;
  public PlayerError: EmitterSubscription | null = null;
  public PlayerFullscreen: EmitterSubscription | null = null;

  public componentDidMount() {
    const { event, height, width } = this.props;
    const EventEmitter = new NativeEventEmitter(ModuleWithEmitter);

    if (event) {
      this.PlayerState = EventEmitter.addListener(
        'PlayerState',
        (message: PlayerStateMessage) => event('PlayerState', message)
      );

      this.PlayerState = EventEmitter.addListener(
        'PlayerError',
        (message: PlayerErrorMessage) => event('PlayerError', message)
      );

      this.PlayerState = EventEmitter.addListener(
        'PlayerFullscreen',
        (message: PlayerFullscreenMessage) => {
          this.handleResize(
            message ? Dimensions.get('window').height : width,
            message ? Dimensions.get('window').width : height
          );
          return event('PlayerFullscreen', message);
        }
      );
    }
  }

  private handleResize(width: number, height: number): void {
    PlayerRef.current.setNativeProps({
      style: {
        width,
        height,
      },
    });
  }

  public componentWillUnmount() {
    const EventEmitter = new NativeEventEmitter(ModuleWithEmitter);
    if (this.PlayerState && this.PlayerError && this.PlayerFullscreen) {
      EventEmitter.removeSubscription(this.PlayerState);
      EventEmitter.removeSubscription(this.PlayerError);
      EventEmitter.removeSubscription(this.PlayerFullscreen);
    }
  }

  render() {
    const { height, width } = this.props;
    return <RNKalturaPlayerView ref={PlayerRef} style={{ height, width }} />;
  }
}

export default RNKalturaPlayer;
