

mp = {
    -1: [True, True],
    0: [False, False],
    1: [False, True],
}

MultOut1 = [-1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
MultOut2 = [-1, -1, -1, 0, 0, 0, 1, 1, 1, -1, -1, -1, 0, 0, 0, 1, 1, 1, -1, -1, -1, 0, 0, 0, 1, 1, 1]
# MultOut1 = [-1,-1,-1,0,0,0,1,1,1]
# MultOut2 = [-1,0,1,-1,0,1,-1,0,1]
n = len(MultOut1)

MultOut1_bit1 = "0ns 0.9v 1ns 0.9v"
MultOut1_bit0 = "0ns 0.9v 1ns 0.9v"
MultOut2_bit1 = "0ns 0.9v 1ns 0.9v"
MultOut2_bit0 = "0ns 0.9v 1ns 0.9v"
t2 = True
t3 = True
t5 = True
t6 = True
t = 1

for i in range(n):
    c1 = MultOut1[i]
    c2 = MultOut2[i]

    if mp.get(c1)[0] != t2:
        if t2:
            MultOut1_bit1 += " " + str(t) + "ns 0.9v" + " " + str(t + 0.025) + "ns 0.0v"
        else:
            MultOut1_bit1 += " " + str(t) + "ns 0.0v" + " " + str(t + 0.025) + "ns 0.9v"
        t2 = not t2

    if mp.get(c1)[1] != t3:
        if t3:
            MultOut1_bit0 += " " + str(t) + "ns 0.9v" + " " + str(t + 0.025) + "ns 0.0v"
        else:
            MultOut1_bit0 += " " + str(t) + "ns 0.0v" + " " + str(t + 0.025) + "ns 0.9v"
        t3 = not t3

    if mp.get(c2)[0] != t5:
        if t5:
            MultOut2_bit1 += " " + str(t) + "ns 0.9v" + " " + str(t + 0.025) + "ns 0.0v"
        else:
            MultOut2_bit1 += " " + str(t) + "ns 0.0v" + " " + str(t + 0.025) + "ns 0.9v"
        t5 = not t5
    
    if mp.get(c2)[1] != t6:
        if t6:
            MultOut2_bit0 += " " + str(t) + "ns 0.9v" + " " + str(t + 0.025) + "ns 0.0v"
        else:
            MultOut2_bit0 += " " + str(t) + "ns 0.0v" + " " + str(t + 0.025) + "ns 0.9v"
        t6 = not t6


    t+= 5

print(MultOut1_bit1)
print(MultOut1_bit0)
print(MultOut2_bit1)
print(MultOut2_bit0)