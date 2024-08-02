#!/usr/bin/python3

import json
import sys
import subprocess

with open(sys.argv[1], 'r') as config:
    config_json = json.load(config)
    outbounds = config_json["outbounds"][0]
    inbounds = config_json["inbounds"]
    print(
        f"Domain: {outbounds['settings']['vnext'][0]['address']}:{outbounds['settings']['vnext'][0]['port']}")
    print(
        f"User ID: {outbounds['settings']['vnext'][0]['users'][0]['id']}", end="\n")
    print("Proxies:")
    for idx, _ in enumerate(inbounds):
        space = "\u0020"*4
        match inbounds[idx]["protocol"]:
            case "socks":
                print(
                    f"{space}{idx}: socks5://{inbounds[idx]['listen']}:{inbounds[idx]['port']}")
            case "http":
                print(
                    f"{space}{idx}: http://{inbounds[idx]['listen']}:{inbounds[idx]['port']}")
            case _:
                pass
    
    # TODO: proxy must be added
    # cURL_latency_measurement = ["curl",
    #                             "--socks5", "127.0.0.1:10808",
    #                             "-w", "%{time_total}",
    #                             "-s", "youtube.com",
    #                             "-o", "/dev/null"]
    # latency = subprocess.run(cURL_latency_measurement,
    #                          capture_output=True, check=True).stdout
    # latency = int(float(latency) * 1000)
    # print(f"Latency: {latency}ms")
