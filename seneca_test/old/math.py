
def sum(msg):
    print msg["left"]+msg["right"]
    return {"data": msg["left"]+msg["right"]}

sum({"left":2, "right":3})
