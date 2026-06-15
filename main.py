import sys, os, requests
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QTimer, QObject, Signal, Slot

from time import strftime, localtime
from psutil import sensors_battery

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)




class Backend(QObject):
    timeUpdated = Signal(str)
    dayUpdated = Signal(str)
    forecastReceived = Signal(str)
    nameDroneUpdated = Signal(str)
    batteryUpdated = Signal(int)
    currentBatteryCharge = Signal(int)

    def __init__(self):
        super().__init__()

        # Define timer
        self.timer = QTimer()
        self.timer.setInterval(1000) 
        self.timer.timeout.connect(self.update_time)
        self.timer.start()


    def update_time(self):
        curr_time = strftime("%H:%M", localtime())
        self.timeUpdated.emit(curr_time)

        curr_day = strftime("%a", localtime())
        self.dayUpdated.emit(curr_day)

    def update_drone_name(self):
        self.drone_name = 'Drone Alpha x1'
        self.nameDroneUpdated.emit(self.drone_name)
    
    def update_battery(self):
        self._battery_level = 70
        self.batteryUpdated.emit(self._battery_level)

    def battery_level(self):
        battery = sensors_battery()
        if battery is not None:
            self.currentBatteryCharge.emit(int(battery.percent))
        else:
            self.currentBatteryCharge.emit(0)

    def receive_forecast(self):
        # Coordinates for Tel Aviv
        LATITUDE = 32.0853
        LONGITUDE = 34.7818
        URL = "https://api.open-meteo.com/v1/forecast"

        # Define parameters matching Open-Meteo specification
        params = {
            "latitude": LATITUDE,
            "longitude": LONGITUDE,
            "current": "temperature_2m", # air temperature measured 2 meters above the ground.
            "temperature_unit": "celsius" # temperature unit
        }

        try:
            response = requests.get(URL, params=params)
            response.raise_for_status()
            data = response.json()
            
            # Extract current temperature
            current_temp = data["current"]["temperature_2m"]
            self.forecastReceived.emit(f"{current_temp}°C")
            
        except requests.exceptions as e:
            print(f"Error fetching data: {e}")



engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
backend = Backend()
engine.rootObjects()[0].setProperty('backend', backend)

backend.update_time()
backend.receive_forecast()
backend.update_drone_name()
backend.update_battery()
backend.battery_level()

sys.exit(app.exec())


