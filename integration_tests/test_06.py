import requests
from abstract_test import  *

class Test_User_Page(FsConnectionAdminWeb):
    def test_User_Page(self):
        self.connection = self.instance()
        self.connection.loginRequest("arao_test","arao")
        r = self.connection.getRequest("","user")
        assert r is not None and r.status_code == 200
        assert "User Dashboard" in r.text
        assert "arao_test" in r.text
        assert "Total Confirmed cases" in r.text
        