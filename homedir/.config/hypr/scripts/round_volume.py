#/bin/env python

import subprocess


output = subprocess.getoutput(['amixer', 'get', 'Master'])
end = output.find('%')
start = output[:end].rfind('[')
current = output[start + 1:end]
rounded_volume = round(int(current), -1)
subprocess.run(
    ['amixer', 'sset', 'Master', f'{rounded_volume}%'],
    stdout=subprocess.PIPE,
)

