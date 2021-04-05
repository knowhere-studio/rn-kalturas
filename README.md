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