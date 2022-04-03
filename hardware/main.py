import time
import cv2
import json 
import pyzbar.pyzbar as pyzbar
import RPi.GPIO as GPIO

from datetime import datetime 
from authentication import key
from firebase import fb 

boxinfo = {"1":"20", "2":"21"}


#Get Current System time
def currenttime():
    time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    return time 

#def image():

#Convert QR code data to string format 
def convertjson(barcodeData):
    newdata = "" 
    jsondata = ""
    #print("This is QR code Raw Data: " + str(barcodeData))
    for line in barcodeData.splitlines():
        updateline = line.replace(" ", "")
        if "}" in updateline:
            newdata = newdata[:-1]
            newdata += updateline
        else:
            newdata = newdata + updateline + ","
    try:
        #print(newdata)
        jsondata = json.loads(newdata)

    except Exception as e:
        print(e)
        pass

    return jsondata

#Update item collection/return timestamp 
def UpdateFBData(store, box,field,value):
    fb.updatedata(store, box,field,value)

#Unlock box
def boxoperation(boxid):
    GPIO.setup(boxid,GPIO.OUT)
    GPIO.output(boxid,GPIO.HIGH)
    print("Action: Box Unlocked")
    time.sleep(20)
    GPIO.output(boxid,GPIO.LOW)

def keyoperation():
    key.Generatekey()
    key.UserEncryptMessage()
    key.AdminEncryptMessage()
    fb.updateuserfb()
    fb.updateadminfb()

if __name__ == '__main__':
    GPIO.setmode(GPIO.BCM)
    status = 0 
    fb.init()
    font = cv2.FONT_HERSHEY_SIMPLEX 
    #Declare Image 
    cap = cv2.VideoCapture(0)  # 0: use CSI camera,1：use USB camera
    cap.set(3,480) # set Width
    cap.set(4,360) # set Height
    if(not cap.isOpened()):
        print("No camera detected")
    
    while(True):
        # Read Image
        ret, img = cap.read()   
        img_ROI_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Image decode
        barcodes = pyzbar.decode(img_ROI_gray) 

        # Capture every fram as code 
        for barcode in barcodes:
            barcodeData = barcode.data.decode("utf-8")
            barcodeType = barcode.type
            text = "{} ({})".format(barcodeData, barcodeType)
            cv2.putText(img, text , (20,100),font,1,(0,255,0),4) 
            jsondata = convertjson(barcodeData)
            if jsondata["key"]:
                #print("This is json data: " + str(jsondata["key"]))
                if key.DecryptMessage(jsondata["key"]) == b"admin":
                    print("Result: Valid admin")
                    boxnumber = "box_" + str(jsondata["box"])
                    storenumber = "store_" + str(jsondata["store"])
                    if jsondata["status"] in boxinfo == "0":
                        print("Action: Register Item")
                        boxid = int(boxinfo[jsondata["box"]])
                        UpdateFBData(storenumber, boxnumber, "collect_time", "")
                        UpdateFBData(storenumber, boxnumber, "return_time", "")
                        UpdateFBData(storenumber, boxnumber, "return_time", "")
                        UpdateFBData(storenumber, boxnumber, "status", "")
                        UpdateFBData(storenumber, boxnumber, "borrowed_user", "")
                        #image()
                        #boxoperation(boxid)
                        keyoperation()
                        status = 1
                    
                    else:
                        print("No valid status number")
                        status = 1

                elif key.DecryptMessage(jsondata["key"]) == b"user":
                    print("Result: Valid user")
                    if jsondata["box"] in boxinfo:
                        boxid = int(boxinfo[jsondata["box"]])
                        currtime = currenttime()
                        boxnumber = "box_" + str(jsondata["box"])
                        storenumber = "store_" + str(jsondata["store"])
                        if jsondata["status"] == "1":
                            print("Action: Borrow Item")
                            UpdateFBData(storenumber, boxnumber, "collect_time", currtime)
                            UpdateFBData(storenumber, boxnumber, "return_time", " ")
                            UpdateFBData(storenumber, boxnumber, "status", "absent")
                            UpdateFBData(storenumber, boxnumber, "borrowed_user", str(jsondata["username"]))
                            #image()
                            #boxoperation(boxid)
                            keyoperation()
                            print("Action: Key updated")
                            status = 1

                        elif jsondata["status"] == "2":
                            print("Action: Return Item")
                            UpdateFBData(storenumber, boxnumber, "return_time", currtime)
                            UpdateFBData(storenumber, boxnumber, "status", "present")
                            #image()
                            #boxoperation(boxid)
                            keyoperation()
                            print("Action: Key updated")
                            status = 1
                        else:
                            print("Error: Invalid status number!!!")
                            
                    else:
                        print("Error: Invalid box number!!!")             

                else:
                    print("Error: Please Use A Valid QR code!!!")  
            else:
                print("Error: Please Use A Valid QR code!!!")
        
        if status == 1:
            status = 0
            time.sleep(3)

        # show 
        #cv2.imshow('img_ROI', img_ROI_gray)
        cv2.imshow('image', img)
        if (cv2.waitKey(1)) == ord('q'):
            break
        # sleep 0.5 seconds to improve image quality 
        time.sleep(0.5)

    # Release Resource 
    cap.release()
    cv2.destroyAllWindows() 