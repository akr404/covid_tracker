import requests
from abstract_test import  *

class Test_Admin_Graph(FsConnectionAdminWeb):
    def test_Admin_Graph(self):
        self.connection = self.instance()
        self.connection.loginRequest("arao_admin_test","arao_admin")
        r = self.connection.getRequest("","maps_india")
        assert r is not None and r.status_code == 200
        assert "Admin Dashboard" in r.text
        assert "arao_admin_test" in r.text
        assert "https://upload.wikimedia.org/wikipedia/commons/3/38/CSIR_Corona_Combat_Mission.png" in r.text
        assert "https://datawrapper.dwcdn.net/eKajF/3/" in r.text
        assert "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/India_COVID-19_cases_density_map.svg/800px-India_COVID-19_cases_density_map.svg.png" in r.text
        
        