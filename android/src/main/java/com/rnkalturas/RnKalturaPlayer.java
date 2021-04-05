package com.rnkalturas;

import android.content.Context;
import android.content.pm.ActivityInfo;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;

import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.kaltura.playersdk.KPPlayerConfig;
import com.kaltura.playersdk.PlayerViewController;
import com.kaltura.playersdk.events.KPEventListener;
import com.kaltura.playersdk.events.KPlayerState;
import com.kaltura.playersdk.types.KPError;


public class RnKalturaPlayer extends ViewGroupManager<FrameLayout> {
  private FrameLayout frameLayout = null;
  private String ServerUrl = "https://cdnapisec.kaltura.com";
  private String uiConfId = "47413073";
  private String partnerId = "3286493";

  @NonNull
  @Override
  public String getName() {
    return "RNKalturaView";
  }

  @NonNull
  @Override
  protected FrameLayout createViewInstance(@NonNull ThemedReactContext reactContext) {
    LayoutInflater inflater = (LayoutInflater)reactContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    FrameLayout frameLayout = (FrameLayout) inflater.inflate(R.layout.fragment_kaltura_player, null);

    PlayerViewController mPlayerView = frameLayout.findViewById(R.id.player);
    mPlayerView.loadPlayerIntoActivity(reactContext.getCurrentActivity());

    KPPlayerConfig config = new KPPlayerConfig(ServerUrl, uiConfId, partnerId);
    config.setEntryId("1_8rpp7ak3");
    mPlayerView.initWithConfiguration(config);
    mPlayerView.addEventListener(new KPEventListener() {
      @Override
      public void onKPlayerStateChanged(PlayerViewController playerViewController, KPlayerState state) {
        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("PlayerState", state.toString());
        Log.v("TAG", "STATE onKPlayerStateChanged");
      }

      @Override
      public void onKPlayerError(PlayerViewController playerViewController, KPError error) {
        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("PlayerError", error.toString());
        Log.v("TAG", "STATE onKPlayerError");
      }

      @Override
      public void onKPlayerPlayheadUpdate(PlayerViewController playerViewController, float currentTime) {
        Log.v("TAG", "STATE onKPlayerPlayheadUpdate");
      }

      @Override
      public void onKPlayerFullScreenToggeled(PlayerViewController playerViewController, boolean isFullScreen) {
        if (isFullScreen) {
          reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("PlayerFullscreen", isFullScreen);
          reactContext.getCurrentActivity().getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
          reactContext.getCurrentActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
          return;
        }

        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("PlayerFullscreen", isFullScreen);
        reactContext.getCurrentActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        reactContext.getCurrentActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        Log.v("TAG", "STATE onKPlayerFullScreenToggeled");
      }
    });

    return frameLayout;
  }

  @Override
  public void onCatalystInstanceDestroy() {
    super.onCatalystInstanceDestroy();
  }
}
