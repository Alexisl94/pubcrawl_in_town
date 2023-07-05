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
}
