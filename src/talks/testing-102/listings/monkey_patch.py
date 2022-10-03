from module import cat


def speak(self):
    return "Hi, everybody!"


cat.speak = speak
