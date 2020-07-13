import sys
import os
import json
import requests
import re
import subprocess
from abstract_test import  *

class Test_User_Login(FsConnectionAdminWeb):
    def test_User_Register(self):
        self.connection = self.instance()
        r = self.connection.loginRequest("arao_test","arao")
        assert r is not None and r.status_code == 200
        assert "User Dashboard" in r.text
        assert "arao_test" in r.text
        assert "Total Confirmed cases" in r.text
