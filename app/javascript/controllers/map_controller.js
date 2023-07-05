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
    this.fetchWithToken(this.urlValue, {})
    document.querySelector('.step-2').addEventListener('click', this.handleClick.bind(this))
    document.querySelector('.step-3').addEventListener('click', this.handleClick.bind(this))
  }


  handleClick(event) {
    setTimeout(() => {
      this.#refreshMap();
    }, 500);
  }

  fetchWithToken(url, options) {
    options.credentials = "same-origin";

    return fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        this.#addMarkersToMap(data)
        this.#focusMapOnMarker(data)
      })
      .catch((error) => console.log(error))
  }

  #refreshMap() {
    this.#removeMarkersFromMap()
    this.#removeItineraryLine()
    this.fetchWithToken(this.urlValue, {})
  }


  #removeMarkersFromMap() {
    const mapMarkers = this.element.querySelectorAll('.mapboxgl-marker');
    mapMarkers.forEach(marker => {
      marker.remove();
    });
  }

  #addMarkersToMap(data) {
    const coordinates = [];

    data.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
      coordinates.push([marker.lng, marker.lat]);
    })
    this.drawItineraryLine(coordinates);
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

  drawItineraryLine(coordinates) {
    const geojson = {
      type: 'FeatureCollection',
      features: [
        {
          type: 'Feature',
          geometry: {
            type: 'LineString',
            coordinates: coordinates,
          },
        },
      ],
    };

    this.map.addSource('itinerary', {
      type: 'geojson',
      data: geojson,
    });

    this.map.addLayer({
      id: 'itinerary-line',
      type: 'line',
      source: 'itinerary',
      layout: {
        'line-join': 'round',
        'line-cap': 'round',
      },
      paint: {
        'line-color': 'rgb(239, 11, 190)',
        'line-width': 3,
      },
    });
  }

  #removeItineraryLine() {
    if (this.map.getSource('itinerary')) {
      this.map.removeLayer('itinerary-line');
      this.map.removeSource('itinerary');
    }
  }
}
