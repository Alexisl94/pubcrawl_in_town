import { Controller } from "@hotwired/stimulus"
// import { useWindowResize } from 'stimulus-use'
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    status: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/dark-v11',
      zoom: 1
    })
    this.#addMarkersToMap()
    this.#focusMapOnMarker()
  }

  addNextMarkerToMap() {
    const marker = this.markersValue[this.statusValue-1]
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html
    new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    this.#focusMapOnMarker()
  }

  #addMarkersToMap() {
    this.markersValue.slice(0, this.statusValue).forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }


  #focusMapOnMarker() {
    const marker = this.markersValue[this.statusValue-1];
    this.map.flyTo({
      center: [marker.lng, marker.lat],
      zoom: 15,
      padding: 70,
      duration: 0
    });
  }
}
