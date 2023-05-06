'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "d7af1937b9101227f7755567216f1565",
"index.html": "d95efa0b94d2134027f7a653db2939bb",
"/": "d95efa0b94d2134027f7a653db2939bb",
"main.dart.js": "97b5854ea8d2e8181bc4cea0a801f2e6",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "86af832efadff4273333b2588d261277",
"assets/AssetManifest.json": "1dda6f5c2ed89f5bc300e253ec064722",
"assets/NOTICES": "099ce07bf5a1924ea10f10104bf4c378",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/Jug.png": "8559544b669684c9848ebb123c88f93b",
"assets/assets/images/Paper.png": "d2405b2f61f4989c7f13b88a888cae07",
"assets/assets/images/PaperBags.jpg": "ac28aab87af85b02dcc0e666ab0118ef",
"assets/assets/images/PlasticBottle.png": "b4b7a236db4a43ad3a48c1dc792a2d20",
"assets/assets/images/testimage.jpg": "5587f44bc5596f471483ff35a6b0fc83",
"assets/assets/images/Mail.png": "65c7cd903a84171655d5038f302d21ae",
"assets/assets/images/PlasticCups.jpg": "9777baad9a1673ffa175e92e369e22bf",
"assets/assets/images/GlassBottle.png": "913b7948846c6c4003c689777b494ae7",
"assets/assets/images/FoodBox.png": "d665a8d84ddc22c3ff9fc44d59e4b6ac",
"assets/assets/images/Aluminum.png": "4cd8f46f2f867c79471fd25cca7f0ee8",
"assets/assets/images/Boxes.png": "205c6ba370b9aa8dcd5fbb08eeb683fb",
"assets/assets/images/testimage3.jpg": "5f13557f1e813987e4d3c7324824fb2e",
"assets/assets/images/testimage2.jpg": "9154c062a36184d370927693c0f29c2e",
"assets/assets/images/logo.jpg": "5a08de62000162d150acacb29b0c3170",
"assets/assets/images/testimage4.jpg": "08b1316a0571ade9d1b5bbc335ee88ce",
"assets/assets/images/Cans.png": "4768e6be1744961cfc7279c23540d5c9",
"assets/assets/images/Batteries.png": "a5acf3410b9371f5c5048922cfca12e4",
"assets/assets/images/Cardboard.png": "3fa5e0ecbeee98550774457851c11e0b",
"assets/assets/images/FoodCans.png": "0f7a96400bca1a2a3b96aedff618a043",
"assets/assets/images/Balloons.png": "3edf9157dafbf3ade6613ec4b65e0c5d",
"assets/assets/images/BerryBaskets.png": "1398dcdb09c5c40f365c83ffdaca27d0",
"assets/assets/images/Chopsticks.png": "c3dca67415d661a1a428457c514abd28",
"assets/assets/images/Jars.png": "b856be85704068a1665cbdb3f5b05e99",
"assets/assets/images/PaperCups.png": "208d482188dedecb9ccd7d4cbae094e4",
"assets/assets/recyclepedia_logo.jpg": "5a08de62000162d150acacb29b0c3170",
"assets/assets/gsu.jpg": "0f3ac3a4ef274daa5fd1e945e5be7382",
"assets/assets/warren.jpg": "69901ab61a6bad1a73012e017410a55c",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
