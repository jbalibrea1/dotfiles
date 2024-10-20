#!/bin/bash

# Obtener el volumen actual
#current_volume=$(pactl list sinks | grep 'Volume:' | sed -n '3p' | awk '{print $5}' | tr -d '%')
# Obtener el volumen actual del dispositivo de audio deseado (por ejemplo, "HyperX 7.1 Audio Analog Stereo")
current_volume=$(pactl list sinks | grep 'Description: HyperX 7.1 Audio Analog Stereo' -A 10 | grep 'Volume:' | awk '{print $5}' | tr -d '%' | head -n 1)

# Obtener el volumen deseado (si no se proporciona, usar un incremento predeterminado)
desired_volume=$(($current_volume + ${1:-5}))

# Limitar el volumen al 100%
if [ $desired_volume -gt 100 ]; then
    desired_volume=100
fi

# Establecer el volumen
pactl set-sink-volume 0 "${desired_volume}%"
