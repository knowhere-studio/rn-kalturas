package com.rnkalturas

import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.widget.FrameLayout
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.common.MapBuilder
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.kaltura.playersdk.KPPlayerConfig
import com.kaltura.playersdk.PlayerViewController

open class RnKalturaPlayerView : ViewGroupManager<FrameLayout>() {
  private val frameLayout: FrameLayout? = null
  private val ServerUrl = "https://cdnapisec.kaltura.com"
  private val uiConfId = "47413073"
  private val partnerId = "3286493"
  private val mPlayer: PlayerViewController;

  override fun getName(): String {
    return "RNKalturaView"
  }

  private val COMMAND_PLAY_VIDEO = 1
  private val COMMAND_PAUSE_VIDEO = 2
  private val COMMAND_SEEK_TO = 3;
  private val COMMAND_TOGGLE_FULL_SCREEN = 4;

  override fun createViewInstance(reactContext: ThemedReactContext): FrameLayout {
    val inflater = reactContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
    val frameLayout = inflater.inflate(R.layout.fragment_kaltura_player, null) as FrameLayout
    this.mPlayerView: PlayerViewController = frameLayout.findViewById(R.id.player)
    this.mPlayerView.loadPlayerIntoActivity(reactContext.currentActivity)
    val config = KPPlayerConfig(ServerUrl, uiConfId, partnerId)
    config.entryId = "1_8rpp7ak3"
    mPlayerView.initWithConfiguration(config)
    return frameLayout
  }

  override fun getCommandsMap(): Map<String?, Int?>? {
    Log.d("React", " View manager getCommandsMap:")
    return MapBuilder.of(
      "play",
      COMMAND_PLAY_VIDEO,
      "pause",
      COMMAND_PAUSE_VIDEO,
      "seekTo",
      COMMAND_SEEK_TO,
      "toggleFullscreen",
      COMMAND_TOGGLE_FULL_SCREEN
    )
  }

  override fun receiveCommand(root: FrameLayout, commandId: String?, args: ReadableArray?) {
    super.receiveCommand(root, commandId, args)
    Log.d("React", "HELLO");
    when (commandId) {
      "play" -> {
        Log.d("React", "LOOOGGGG");
        return;
      };
      "pause" -> {
        Log.d("React", "LOOOGGGG-232");
        return;
      };
      "seekTo" -> {
        Log.d("React", "LOOOGGGG-2323");
        return;
      };
      "toggleFullscreen" -> {
        Log.d("React", "LOOOGGGG-23232")
      }
    }
  }

  override fun onCatalystInstanceDestroy() {
    super.onCatalystInstanceDestroy()
  }
}
