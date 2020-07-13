import requests
from abstract_test import  *

class Test_User_Graph(FsConnectionAdminWeb):
    def test_User_Graph(self):
        self.connection = self.instance()
        self.connection.loginRequest("arao_test","arao")
        r = self.connection.getRequest("","graphs_india")
        assert r is not None and r.status_code == 200
        assert "User Dashboard" in r.text
        assert "arao_test" in r.text
        assert "chartContainer" in r.text