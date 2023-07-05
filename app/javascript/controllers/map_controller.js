import { Controller } from "@hotwired/stimulus"
// import { useWindowResize } from 'stimulus-use'
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    status: Number,
    url: String
  }

  static targets = ["map", "containerNotif", "message1", "message2", "message3"]

  connect() {
    this.initMessages()
    mapboxgl.accessToken = this.mapTarget.dataset.mapApiKeyValue
    this.mapTarget.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/dark-v11',
      zoom: 1
    })
    this.#addMarkersToMap()
    this.#focusMapOnMarker()
    if (this.statusValue == 3) {
      this.fetchRoute(2, 1)
    } else if (this.statusValue == 2) {
      this.fetchRoute(1, 0)
    }
  }

  initMessages() {
    if (this.statusValue === 1) {
    } else if (this.statusValue === 2) {
      this.addMessage1()
      this.addMessage2()
    } else if (this.statusValue === 3) {
      this.addMessage1()
      this.addMessage2()
      this.addMessage3()
    }
  }

  addMessage1() {
    this.message1Target.classList.remove("d-none")

  }
  addMessage2() {
    this.message2Target.classList.remove("d-none")
  }
  addMessage3() {
    this.message3Target.classList.remove("d-none")
  }

  displayMarker2() {
    const marker = this.markersValue[1]
    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
    const mapMarker = new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.mapTarget.map);
    this.mapTarget.map.flyTo({
      center: [marker.lng, marker.lat],
      zoom: 15,
      padding: 70,
      duration: 0
    });
    this.fetchRoute(1, 0)
  }

  displayMarker3() {
    const marker = this.markersValue[2]
    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
    const mapMarker = new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.mapTarget.map);
    this.mapTarget.map.flyTo({
      center: [marker.lng, marker.lat],
      zoom: 15,
      padding: 70,
      duration: 0
    });
    this.fetchRoute(2, 1)
  }


  #addMarkersToMap() {
    const coordinates = [];
    const markers = this.markersValue.slice(0, this.statusValue)
    markers.forEach((marker, index) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.mapTarget.map);
      coordinates.push([marker.lng, marker.lat]);
    });
  }

  #focusMapOnMarker() {
    const marker = this.markersValue[this.statusValue-1];
    this.mapTarget.map.flyTo({
      center: [marker.lng, marker.lat],
      zoom: 15,
      padding: 70,
      duration: 0
    });
  }

  fetchRoute(start, end) {
    const startMarker = this.markersValue[start];
    const endMarker = this.markersValue[end];
    const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${startMarker.lng},${startMarker.lat};${endMarker.lng},${endMarker.lat}?geometries=geojson&access_token=${this.mapTarget.dataset.mapApiKeyValue}`;

    fetch(url)
      .then(response => response.json())
      .then(data => {
        const route = data.routes[0];
        const coordinates = route.geometry.coordinates;

        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: coordinates
          }
        };

        // if the route already exists on the map, we'll reset it using setData
        if (this.mapTarget.map.getSource('route')) {
          this.mapTarget.map.getSource('route').setData(geojson);
        }
        // otherwise, we'll make a new request
        else {
          this.mapTarget.map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: geojson
            },
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': 'rgb(239, 11, 190)',
              'line-width': 5,
              'line-opacity': 0.75
            }
          });
        }
      })
      .catch(error => {
        console.error('Error fetching route:', error);
      });
  }

}
