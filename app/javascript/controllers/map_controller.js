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

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/dark-v11',
      zoom: 1
    })
    this.fetchMarkers()
    // this.#addMarkersToMap()
    // this.#focusMapOnMarker()
  }

  fetchMarkers() {
    fetch(this.urlValue)
      .then(response => response.json())
      .then((data) => {
        this.#addMarkersToMap(data)
        this.#focusMapOnMarker(data)
      })
      .catch((error) => console.log(error))
  }

  refreshMap() {
    this.#removeMarkersFromMap()
    this.fetchMarkers()
  }


  #removeMarkersFromMap() {
    const mapMarkers = this.element.querySelectorAll('.mapboxgl-marker');
    mapMarkers.forEach(marker => {
      marker.remove();
    });
  }

  #addMarkersToMap(data) {
    data.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #focusMapOnMarker(data) {
    const marker = data[data.length - 1];
    this.map.flyTo({
      center: [marker.lng, marker.lat],
      zoom: 15,
      padding: 70,
      duration: 0
    });
  }
}
