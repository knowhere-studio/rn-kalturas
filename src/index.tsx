import React, { createRef } from 'react';
import {
  NativeEventEmitter,
  NativeModules,
  EmitterSubscription,
  Dimensions,
  Text,
  // Button,
  // UIManager,
  // findNodeHandle,
  requireNativeComponent,
} from 'react-native';
// import { RNKalturaPlayerView } from './RNKalturaView';

const { ModuleWithEmitter } = NativeModules;
const PlayerRef = createRef<any>();

const Player = requireNativeComponent('RNKalturasPlayer');

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

  public ref: any;

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

  // public componentWillUnmount() {
  //   const EventEmitter = new NativeEventEmitter(ModuleWithEmitter);
  //   if (this.PlayerState && this.PlayerError && this.PlayerFullscreen) {
  //     EventEmitter.removeSubscription(this.PlayerState);
  //     EventEmitter.removeSubscription(this.PlayerError);
  //     EventEmitter.removeSubscription(this.PlayerFullscreen);
  //   }
  // }

  // public printRef(): void {
  //   UIManager.dispatchViewManagerCommand(
  //     findNodeHandle(this.ref.current),
  //     UIManager.getViewManagerConfig('RNKalturaView').Commands.play,
  //     undefined
  //   );
  // }

  render() {
    // const { height, width } = this.props;
    return (
      <>
        <Text
        // style={{ fontSize: 14, marginBottom: 20 }}
        // onPress={() =>  NativeModules.HelloWorld.ShowMessage("Awesome!its working!", 0.5)}
        >
          TEST TEST
        </Text>
        {/* <RNKalturaPlayerView
          ref={(ref) => (this.ref = ref)}
          style={{ height, width }}
          // ServerUrl="https://cdnapisec.kaltura.com"
          // PartnerId="47413073"
          // UiConfId="3286493"
        /> */}

        {/* @ts-ignore */}
        <Player
          // {/* @ts-ignore */}
          ServerUrl="https://cdnapisec.kaltura.com"
          PartnerId="47413073"
          UiConfId="3286493"
          style={{ flex: 1 }}
        />
      </>
    );
  }
}

export default RNKalturaPlayer;
export const RnKalturasController: {
  play: () => void;
  pause: () => void;
} = NativeModules.RnKalturas;
