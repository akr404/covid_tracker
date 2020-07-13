import sys
import os
import json
import requests
import re
import subprocess
from abstract_test import  *

class Test_Admin_Login(FsConnectionAdminWeb):
    def test_Admin_Register(self):
        self.connection = self.instance()
        r = self.connection.loginRequest("arao_admin_test","arao_admin")
        assert r is not None and r.status_code == 200
        assert "Admin Dashboard" in r.text
        assert "arao_admin_test" in r.text
        assert "Total Confirmed cases" in r.text
