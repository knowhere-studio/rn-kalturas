package com.rnkalturas

import android.widget.FrameLayout
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactMethod
import com.kaltura.playersdk.PlayerViewController

class RnKalturasModule(reactContext: ReactApplicationContext) : RnKalturaPlayerView() {

  override fun getName(): String {
    return "RnKalturas"
  }
}
