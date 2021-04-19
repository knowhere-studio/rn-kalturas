import {
  HostComponent,
  requireNativeComponent,
  StyleProp,
  ViewStyle,
  Platform,
} from 'react-native';

export const RNKalturaPlayerView: HostComponent<{
  style?: StyleProp<ViewStyle>;
  ServerUrl: string;
  PartnerId: string;
  UiConfId: string;
}> =
  Platform.OS === 'ios'
    ? requireNativeComponent('PlayerView')
    : requireNativeComponent('RNKalturaView');
