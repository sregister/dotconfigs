#!/usr/bin/python

# import library
import sys

#main
def main():
    
    fibs = [] 
    a = 1
    b = 1
    sum = 0

    while a < 4000000:
        print(a)
        print('\n')
        
        if a % 2 == 0:
            sum += a

        temp = a
        a = a + b 
        b = temp

    print("sum is: " + str(sum))

if __name__ == '__main__':
    main()
