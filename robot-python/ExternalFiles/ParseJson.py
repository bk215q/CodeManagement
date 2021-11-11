import json
import requests
import jsonpath

dict1 = '{"k1":"val1","k2":"val2"}'
json_result = json.loads(dict1)  # json.loads() method is used to parse the dictionary as json
print(json_result)  # o/p :- {'k1': 'val1', 'k2': 'val2'}
print(json_result['k1'])  # o/p :- val1

# trigger the API
API = 'https://reqres.in/api/users?page=2'
API_Response = requests.get(API)
print(API_Response.text)  # o/p :- {"page":2,"per_page":6,"total":12,"total_pages":2,"data":[{"id":7,
# "email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson",
# "avatar":"https://reqres.in/img/faces/7-image.jpg"},{"id":8,"email":"lindsay.ferguson@reqres.in",
# "first_name":"Lindsay","last_name":"Ferguson","avatar":"https://reqres.in/img/faces/8-image.jpg"},{"id":9,
# "email":"tobias.funke@reqres.in","first_name":"Tobias","last_name":"Funke",
# "avatar":"https://reqres.in/img/faces/9-image.jpg"},{"id":10,"email":"byron.fields@reqres.in","first_name":"Byron",
# "last_name":"Fields","avatar":"https://reqres.in/img/faces/10-image.jpg"},{"id":11,
# "email":"george.edwards@reqres.in","first_name":"George","last_name":"Edwards",
# "avatar":"https://reqres.in/img/faces/11-image.jpg"},{"id":12,"email":"rachel.howell@reqres.in",
# "first_name":"Rachel","last_name":"Howell","avatar":"https://reqres.in/img/faces/12-image.jpg"}],"support":{
# "url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are
# appreciated!"}}

# check status code of the API
assert API_Response.status_code == 200

# Parse API response to JSON format
API_JSON_Response = json.loads(API_Response.text)
print(API_JSON_Response)  # o/p :- {'page': 2, 'per_page': 6, 'total': 12, 'total_pages': 2, 'data': [{'id': 7, 'email':
# 'michael.lawson@reqres.in', 'first_name': 'Michael', 'last_name': 'Lawson', 'avatar':
# 'https://reqres.in/img/faces/7-image.jpg'}, {'id': 8, 'email': 'lindsay.ferguson@reqres.in', 'first_name':
# 'Lindsay', 'last_name': 'Ferguson', 'avatar': 'https://reqres.in/img/faces/8-image.jpg'}, {'id': 9,
# 'email': 'tobias.funke@reqres.in', 'first_name': 'Tobias', 'last_name': 'Funke', 'avatar':
# 'https://reqres.in/img/faces/9-image.jpg'}, {'id': 10, 'email': 'byron.fields@reqres.in', 'first_name': 'Byron',
# 'last_name': 'Fields', 'avatar': 'https://reqres.in/img/faces/10-image.jpg'}, {'id': 11,
# 'email': 'george.edwards@reqres.in', 'first_name': 'George', 'last_name': 'Edwards', 'avatar':
# 'https://reqres.in/img/faces/11-image.jpg'}, {'id': 12, 'email': 'rachel.howell@reqres.in', 'first_name': 'Rachel',
# 'last_name': 'Howell', 'avatar': 'https://reqres.in/img/faces/12-image.jpg'}], 'support': {'url':
# 'https://reqres.in/#support-heading', 'text': 'To keep ReqRes free, contributions towards server costs are
# appreciated!'}}

# Apply json path
# Fetch the total value from API _JSON_Response
x = jsonpath.jsonpath(API_JSON_Response, 'total')
print(x)  # value of total key from the API_JSON_Response o/p :- [12]

# Fetch first element in the data array from API _JSON_Response
y = jsonpath.jsonpath(API_JSON_Response, 'data[0].first_name')  # o/p :- ['Michael']
print(y)

# Fetch all the first_name in the data key from API _JSON_Response
for val in API_JSON_Response['data']:
    print(val['first_name'])  # o/p :- Michael
                                    # Lindsay
                                    # Tobias
                                    # Byron
                                    # George
                                    # Rachel
#Fetch last name from in data key from API_JSON_Response
for val in API_JSON_Response['data']:
    print('Last Name : '+val['last_name']) # o/p :- Last Name : Lawson
                                                    # Last Name : Ferguson
                                                    # Last Name : Funke
                                                    # Last Name : Fields
                                                    # Last Name : Edwards
                                                    # Last Name : Howell
