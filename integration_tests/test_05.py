import requests
from abstract_test import  *

class Test_Admin_Page(FsConnectionAdminWeb):
    def test_Admin_Page(self):
        self.connection = self.instance()
        self.connection.loginRequest("arao_admin_test","arao_admin")
        r = self.connection.getRequest("","user")
        assert r is not None and r.status_code == 200
        assert "Admin Dashboard" in r.text
        assert "arao_admin_test" in r.text
        assert "Total Confirmed cases" in r.text

