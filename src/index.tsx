import { NativeModules } from 'react-native';

type RnKalturasType = {
  multiply(a: number, b: number): Promise<number>;
};

const { RnKalturas } = NativeModules;

export default RnKalturas as RnKalturasType;
