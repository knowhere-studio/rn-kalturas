import {
  HostComponent,
  requireNativeComponent,
  StyleProp,
  ViewStyle,
} from 'react-native';

export const RNKalturaPlayerView: HostComponent<{
  style?: StyleProp<ViewStyle>;
}> = requireNativeComponent('RNKalturaView');
