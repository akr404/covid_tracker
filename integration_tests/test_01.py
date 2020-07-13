import sys
import os
import json
import requests
import re
import subprocess
from abstract_test import  *

class Test_User_Register(FsConnectionAdminWeb):
    def test_User_Register(self):
        self.connection = self.instance()
        r = self.connection.registerRequest("arao_test","arao", "user")
        assert r is not None and r.status_code == 200
        assert "Registration Successful!!" in r.text

