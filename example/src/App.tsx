import * as React from 'react';

import { Dimensions, StyleSheet, View } from 'react-native';
import RNKalturaPlayer from 'rn-kalturas';

export default function App() {
  return (
    <View style={styles.container}>
      <RNKalturaPlayer
        height={200}
        width={Dimensions.get('window').width}
        event={(_e, m) => console.log(_e, m)}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
