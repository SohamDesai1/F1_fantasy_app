'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "155d7be1cefca541fc6096888a95c2bc",
"version.json": "281c5c875c5b5aa08d839f46f24b31ed",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"flutter_bootstrap.js": "526940e44f80b1c36c886cdd47b0e602",
"manifest.json": "906fc433ff2f17c2c8af10ca573ca807",
"index.html": "924e12d6bcb7e0caa0a59ed2142a82e9",
"/": "924e12d6bcb7e0caa0a59ed2142a82e9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "a48ca9e5bcc89fccac32592416234257",
"assets/fonts/MaterialIcons-Regular.otf": "771fbec50217a359e3d021da3e3e8348",
"assets/NOTICES": "47e38f05beba8b662aaf54d13ffbf922",
"assets/AssetManifest.bin": "349f47933358b7898063386c8679185f",
"assets/FontManifest.json": "1c3a33ddfe39d3d0337bd44396f1e651",
"assets/assets/tracks/Australia.svg": "0cce50a369024a2bf4e186dc5c002bf7",
"assets/assets/tracks/Yas%2520Marina.svg": "d1c9dfc06973e7cb732ad72c331568c2",
"assets/assets/tracks/Baku.svg": "d0f20d2d34fb23e86e1eb97d9aa8db0b",
"assets/assets/tracks/Brazil.svg": "f52f4ae021d0397b027fc6637590de70",
"assets/assets/tracks/Canada.svg": "4e72b6bd9ca23e1e71230df579073963",
"assets/assets/tracks/Hungaroring.svg": "458d22ff1fe3c63dcba383a33799985b",
"assets/assets/tracks/Singapore.svg": "6c71f329321563fc77881c0e8b1e7230",
"assets/assets/tracks/Mexico.svg": "ed6de79e126259ce90a7c5103f8aadbe",
"assets/assets/tracks/Spain.svg": "e92a31eb781e78c14a35fac9ee67a56a",
"assets/assets/tracks/Qatar.png": "3eb3a5955987a3bdf22b1d1a522b3015",
"assets/assets/tracks/China.svg": "8036b3f6349e1a96d2312071858c54ef",
"assets/assets/tracks/Madring.svg": "810775e5d90167c8592b7567e73ab992",
"assets/assets/tracks/Japan.svg": "2179792cbdb1c9cd231d838539d8ad11",
"assets/assets/tracks/Zandvoort.svg": "7b2823a56af57cd8cad45b03412a3046",
"assets/assets/tracks/Monaco.svg": "fcba0f34ad9665173f366f418ac1cb57",
"assets/assets/tracks/Spa.svg": "dc06fea1b696aa3115cad92d6adeeff7",
"assets/assets/tracks/Imola.png": "9d8c2ad2bf8adb5aefe3dde03fac8cd0",
"assets/assets/tracks/Bahrain.svg": "141b68f81c85b723cf0c676f4225284a",
"assets/assets/tracks/Jeddah.png": "52fae4a31c9b527467c7f2706c931364",
"assets/assets/tracks/Monza.svg": "59ec64191f193282e501ff547be025d8",
"assets/assets/tracks/Austria.svg": "ebfbe1216912448cc8d060ae31a47e67",
"assets/assets/tracks/Las%2520Vegas.png": "378ea9d4049a659ed3c5f65e15ac6cad",
"assets/assets/tracks/Americas.svg": "208ecb8f8c9d612ac591678decb85413",
"assets/assets/tracks/Miami.png": "840b366d01491a91ede2f11cb954eb6b",
"assets/assets/tracks/British.svg": "64fcd50df07ebd864d0d1fbde1d2377a",
"assets/assets/fonts/Formula1-Regular.otf": "b72680c35f35a822866155df26898abd",
"assets/assets/fonts/Formula1-Bold.otf": "5aad4311a9958e26c0218486a704d74e",
"assets/assets/fonts/Formula1-Wide.otf": "3e58b17fee834adbdf02c64dce0f3b35",
"assets/assets/images/max.png": "0aa1158c3721c8ac310c09fdc3ff987e",
"assets/assets/images/uk.svg": "47c4ebddb5e7f2cb4857092c45b061ae",
"assets/assets/images/oscar.png": "d88cb1db724ae8b51742b5c3db10b193",
"assets/assets/images/lando.png": "7b6d8112b671a370d6c2ce12091f7f36",
"assets/assets/logo.png": "102ed6659950002aa9b96b8c985323eb",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "905ce0adb7ebffe28501a4f636d9b8bf",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
