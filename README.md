# React Native Bridge for Kaltura's Native SDKs


Installation
```
# Yarn
yarn add https://github.com/knowhere-studio/rn-kalturas.git

# npm
npm i https://github.com/knowhere-studio/rn-kalturas.git --save
```

---

### Android

**Step 1:**Add the StreamAMG maven repository to the list of repositories in Project `build.gradle`

```
allprojects {
    repositories {
        ...
        maven {
            url "https://api.bitbucket.org/2.0/repositories/sukdev/kaltura-android-sdk/src/releases"
        }
    }
}
```

**Step 2:** Add the dependency information in Module `/app/build.gradle`
```
implementation 'com.streamamg:playersdk:2.7.3'
```

If you are not using AndroidX in your app, you should exclude the following module to avoid incompatibilities:

```
implementation 'com.streamamg:playersdk:2.7.3', {
    exclude group: 'androidx.core', module: 'core'
    exclude group: 'androidx.media', module:'media'
}
```

---

### iOS


**Step 1** Install KalturaPlayerSDKStreamamg. your Podfile should look like this:


```

pod 'KalturaPlayerSDKStreamamg', :git => 'https://bitbucket.org/sukdev/kaltura-ios-sdk/src/master/', :branch => 'master'
# This will auto install google-cast-sdk
```

**Step 2** Open a terminal window and run:
```
cd ${project_root}/ios
pod install
```

**Step 3** Next you need to go to the Target Build Settings and disable Bitcode:
```
Enable Bitcode -> No
```

**Step 4** Go to your Info.plist file and add a new dictionary named:

```
NSAppTransportSecurity
```
---

# Usage

```
import RNKalturaPlayer from 'rn-kalturas';

const Player = () => (
    /**
    *
    * {width} video width (required)
    * {height} video height (required)
    * {event} event listener
    */
    <RNKalturaPlayer width={200} height={100}/>
)
```

### Events
1. PlayerState `message = 'loadedmetadata' | 'canplay' | 'play' | 'pause' | 'seeking' | 'seeked'`
2. PlayerError
3. PlayerFullscreen `message = true | false`


