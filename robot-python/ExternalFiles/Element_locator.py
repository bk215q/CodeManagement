import json
import jsonpath


def read_locator_from_json(element_name):
    f = open('C:/Users/bishals/development/robot-python/jsonFiles/Element.json', 'r')
    response = json.loads(f.read())
    locator_value = jsonpath.jsonpath(response, element_name)
    return locator_value[0]
