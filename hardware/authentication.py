from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes
import base64

class key:
    adminmessage = b"admin"
    usermessage = b"user"

    def Generatekey():
        private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=2048,
            backend=default_backend()
        )
        public_key = private_key.public_key()

        privatepem = private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        )

        publicpem = public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        )

        with open('./authentication/private_key.pem', 'wb') as f:
            f.write(privatepem)
        
        with open('./authentication/public_key.pem', 'wb') as f:
            f.write(publicpem)

    def UserEncryptMessage():
        with open("./authentication/public_key.pem", "rb") as key_file:
            public_key = serialization.load_pem_public_key(
                key_file.read(),
                backend=default_backend()
            )

        encrypted = public_key.encrypt(
            key.normalmessage,
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
                )
            )
        encrypted = base64.b64encode(encrypted)
        with open('./authentication/userencrypt.txt', 'wb') as f:
            f.write(encrypted)

    def AdminEncryptMessage():
        with open("./authentication/public_key.pem", "rb") as key_file:
            public_key = serialization.load_pem_public_key(
                key_file.read(),
                backend=default_backend()
            )

        encrypted = public_key.encrypt(
            key.adminmessage,
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
                )
            )
        encrypted = base64.b64encode(encrypted)
        with open('./authentication/adminencrypt.txt', 'wb') as f:
            f.write(encrypted)

    def DecryptMessage(messagetext):
        #with open('./authentication/userencrypt.txt', 'r') as f:
            #messagetext = f.read()
        original_message = ""
        encrypted = base64.b64decode(messagetext)
        with open("./authentication/private_key.pem", "rb") as key_file:
            private_key = serialization.load_pem_private_key(
                key_file.read(),
                password=None,
                backend=default_backend()
            )
        try:
            original_message = private_key.decrypt(
                encrypted,
                padding.OAEP(
                    mgf=padding.MGF1(algorithm=hashes.SHA256()),
                    algorithm=hashes.SHA256(),
                    label=None
                    )
                )
        except:
            print("Invalid Key !!!!!!!")
            pass

        return original_message
