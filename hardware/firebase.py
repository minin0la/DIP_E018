import firebase_admin
from firebase_admin import credentials, initialize_app, storage, firestore

class fb:

    def init():
        cred = credentials.Certificate("./key/firebase.json")
        firebase_admin.initialize_app(cred)
        initialize_app(cred, {'storageBucket': 'dip-ee018.appspot.com'})

    def updateuserfb():
        db = firestore.client()
        with open('./authentication/userencrypt.txt', 'r') as f:
            encrypted = f.read()
        db.collection("Key").document("user").update({"value": str(encrypted)})

    def updateadminfb():
        db = firestore.client()
        with open('./authentication/adminencrypt.txt', 'r') as f:
            encrypted = f.read()
        db.collection("Key").document("admin").update({"value": str(encrypted)})

    def updatedata(store, box,field,value):
        db = firestore.client()
        db.collection(str(store)).document(str(box)).update({str(field): str(value)})

    def uploadphoto(filename):
        bucket = storage.bucket()
        blob = bucket.blob(filename)
        blob.upload_from_filename(filename)

        return blob.public_url