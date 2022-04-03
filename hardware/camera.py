from picamera import PiCamera
import time 

class camera:

    def CapturePhoto(box, id):
        camera = PiCamera()
        time.sleep(2)
        camera.capture("/home/pi/Pictures/img.jpg" + str(box) + str(id))
        photo = "/home/pi/Pictures/img.jpg" + str(box) + str(id)
        return photo 
