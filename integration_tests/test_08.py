import requests
from abstract_test import  *

class Test_Admin_Graph(FsConnectionAdminWeb):
    def test_Admin_Graph(self):
        self.connection = self.instance()
        self.connection.loginRequest("arao_admin_test","arao_admin")
        r = self.connection.getRequest("","graphs_india")
        assert r is not None and r.status_code == 200
        assert "Admin Dashboard" in r.text
        assert "arao_admin_test" in r.text
        assert "chartContainer" in r.text