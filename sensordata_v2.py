import time
from pyModbusTCP.client import ModbusClient
from numpy.random import randint

IP_ADDRESS = "127.0.0.1"
PORT = "502"
request_time_interval = 10      # time between Modbus/TCP requests in seconds
number_registers = 4
start_register = 0
start_value = 1
end_value = 10
value_steps = 2                 # next random value: last_value +/- value_steps
last_random_list = []           # for saving the last random values


def get_random_list():
    values = []
    if len(last_random_list) == 0:
        # get random values between start_value and end_value
        values = list(randint(start_value, end_value + 1, number_registers))
    else:
        for v in last_random_list:
            upper_bound = v + value_steps
            if upper_bound > end_value:
                upper_bound = end_value
            lower_bound = v - value_steps
            if lower_bound < start_value:
                lower_bound = start_value
            # get random value between start_value and end_value
            new_value = randint(lower_bound, upper_bound + 1, 1)
            values.append(new_value[0])
    return values


# connect to Modbus Client
c = ModbusClient(host=IP_ADDRESS, port=PORT, auto_open=True, auto_close=True)

while True:
    random_list = get_random_list()

    if number_registers == 1:
        # write to a single register
        if c.write_single_register(start_register, random_list[0]):
            print("Write the value " + str(random_list[0]) + " to register " + str(start_register))
        else:
            print("Write error")
    else:
        # write to multiple registers
        if c.write_multiple_registers(start_register, random_list):
            print("Write the values " + str(random_list) + " to registers " + str(list(range(start_register, start_register + number_registers))))
        else:
            print("Write error")

    # safe the random values
    last_random_list = random_list

    # wait some time
    time.sleep(request_time_interval)
