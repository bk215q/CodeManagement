import os  # os package is used to create ,delete files/folder


# methods w/o args
# def create_folder():
#     os.mkdir("C:\\Users\\bishals\\development\\robot-python\\ExternalFiles\\TestingWorld")
#
#
# def create_sub_folder():
#     os.mkdir("C:\\Users\\bishals\\development\\robot-python\\ExternalFiles\\TestingWorld\\TestingWorldIndia")


# methods with args
def create_folder(foldername):
    os.mkdir("C:\\Users\\bishals\\development\\robot-python\\ExternalFiles\\" + foldername)


def create_sub_folder(subfoldername):
    os.mkdir("C:\\Users\\bishals\\development\\robot-python\\ExternalFiles\\TestingWorld\\" + subfoldername)


def concatenate_two_values(val1, val2):
    val3 = val1 + " " + val2
    return val3
