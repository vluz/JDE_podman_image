import hashlib
import random
import getpass


def generate(passphrase):
    salt_len = 12
    h = hashlib.new(algorithm)
    salt = ("%0" + str(salt_len) + "x") % random.getrandbits(4 * salt_len)
    epass = str.encode(passphrase, encoding="utf-8")
    esalt = str.encode(salt, encoding="ascii")
    h.update(epass + esalt)
    return ":".join((algorithm, salt, h.hexdigest()))


passphrase = getpass.getpass("Enter New Password:")
passphrase_control = getpass.getpass("Reenter New Password:")

algorithm = "sha1"

if passphrase == passphrase_control:
    print("Password Hash:", generate(passphrase))
else:
    print("Entered passwords do not match. Exiting.")
