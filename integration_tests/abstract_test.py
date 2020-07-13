import time
import threading
import json
import requests
import os


class FsConnectionAdminWeb():
    __singleton_lock = threading.Lock()
    __singleton_instance = None

    @classmethod
    def instance(cls):
        if not cls.__singleton_instance:
            with cls.__singleton_lock:
                if not cls.__singleton_instance:
                    cls.__singleton_instance = cls()
        return cls.__singleton_instance

    def registerRequest(self, fs_user, fs_pass, role):
        fs_host = "localhost"
        fs_port ="5000"
        
        self.admin_api_url = "http://%s:%s/" % (fs_host, fs_port)
        adapter = requests.adapters.HTTPAdapter(max_retries=10)
        self.session = requests.Session()
        self.session.mount('http://', adapter)
        self.session.get(self.admin_api_url)

        url = self.admin_api_url + "register"
        print "Admin API URL: " + self.admin_api_url

        request = {"username": fs_user, "password": fs_pass, "role": role}
        headers = {'Content-type': 'application/x-www-form-urlencoded'}
        r = self.session.post(url, request, headers=headers)
        print "Post result: " + str(r.text)
        return r


    def loginRequest(self, fs_user, fs_pass):
        fs_host = "localhost"
        fs_port ="5000"
        
        self.admin_api_url = "http://%s:%s/" % (fs_host, fs_port)
        adapter = requests.adapters.HTTPAdapter(max_retries=10)
        self.session = requests.Session()
        self.session.mount('http://', adapter)
        self.session.get(self.admin_api_url)

        url = self.admin_api_url + "login"
        print "Admin API URL: " + self.admin_api_url
        request = {"username": fs_user, "password": fs_pass}
        headers = {'Content-type': 'application/x-www-form-urlencoded'}
        r = self.session.post(url, request, headers=headers)
        print "Post result: " + str(r.text)
        return r



    def close(self):
        if self.session:
            self.session.close()
        self.session = None
        FsConnectionAdminWeb.__singleton_instance = None
        
    

    def submitRequest(self, method, data, expectedStatus,url):
        data_json = json.dumps(data)
        r = None
        if method == "POST":
            r = self.session.post(url, data=data_json)
        elif method == "GET":
            r = self.session.get(url)
        return r if expectedStatus == 200 else None
        

    def getRequest(self, data, query, expectedStatus=200):
        url = self.admin_api_url + query
        print url 
        return self.submitRequest("GET", data, expectedStatus, url)
    
