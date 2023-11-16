import folium
from streamlit_folium import folium_static
import streamlit as st

# Create a Streamlit app
st.title("Sumatra Map Dashboard")
st.write("Enter the latitude and longitude coordinates below:")

# Create input fields for latitude and longitude
#2.01      100.456
lat = st.number_input("2.01")
lon = st.number_input("100.456")

# Create a Folium map centered on the input coordinates
m = folium.Map(location=[lat, lon], zoom_start=10)

# Add a marker to the map at the input coordinates
folium.Marker([lat, lon]).add_to(m)

# Display the map in the Streamlit app
folium_static(m)