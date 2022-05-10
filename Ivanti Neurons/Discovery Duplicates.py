from math import floor
from collections import Counter
import requests
import json

TenantID = input('Enter the Tenant ID: ')
Bearer = input('Enter the Bearer Token: ')
Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
DiscURL = 'https://uks-prd-apim.ivanticloud.com/disco/discoveredassets?dataRequest={"notNullColumns":[["AgentIdentity","ScannedByAgentId"]],"nullColumns":[],"selected":[],"deselected":[],"trackDeselectedFilters":false,"skip":0,"take":200,"inFilters":[],"notInFilters":[],"tenantId":"' + TenantID + '"}'
DiscQuery = requests.get(DiscURL, headers=Header)
if str(DiscQuery) == '<Response [401]>':
    print(str(DiscQuery), ' returned. Check Landscape, Tenant ID, and Token and try again.')
else:
    DiscData = json.loads(DiscQuery.text)
    DiscList = dict()
    for device in DiscData['records']:
        DiscList[device['id']] = device['deviceName']
    if DiscData['totalCount'] > 200:
        print('Total Records: ', DiscData['totalCount'])
        DiscCount = floor(DiscData['totalCount']/200)
        print('Number of pages: ', DiscCount)
        if DiscCount == 1:
            for i in range(1, DiscCount):
                DiscStepURL = 'https://uks-prd-apim.ivanticloud.com/disco/discoveredassets?dataRequest={"notNullColumns":[["AgentIdentity","ScannedByAgentId"]],"nullColumns":[],"selected":[],"deselected":[],"trackDeselectedFilters":false,"skip":200,"take":200,"inFilters":[],"notInFilters":[],"tenantId":"' + TenantID + '"}'
                DiscStepQuery = requests.get(DiscStepURL, headers=Header)
                if str(DiscStepQuery) == '<Response [401]>':
                    Bearer = input('Bearer Token expired, please enter a fresh one:')
                    Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                    DiscStepQuery = requests.get(DiscStepURL, headers=Header)
                DiscStepData = json.loads(DiscStepQuery.text)
                for device in DiscStepData['records']:
                    DiscList[device['id']] = device['deviceName']
        else:
            for i in range(1, DiscCount+1):
                DiscStepURL = 'https://uks-prd-apim.ivanticloud.com/disco/discoveredassets?dataRequest={"notNullColumns":[["AgentIdentity","ScannedByAgentId"]],"nullColumns":[],"selected":[],"deselected":[],"trackDeselectedFilters":false,"skip":' + str(i*200) + ',"take":200,"inFilters":[],"notInFilters":[],"tenantId":"' + TenantID + '"}'
                DiscStepQuery = requests.get(DiscStepURL, headers=Header)
                if str(DiscStepQuery) == '<Response [401]>':
                    Bearer = input('Bearer Token expired, please enter a fresh one:')
                    Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                    DiscStepQuery = requests.get(DiscStepURL, headers=Header)
                DiscStepData = json.loads(DiscStepQuery.text)
                for device in DiscStepData['records']:
                    DiscList[device['id']] = device['deviceName']
    print('Devices Gathered, creating file.')
    DiscCounter = Counter(DiscList.values())
    DiscFile = open("Discovered-Devices-Duplicates.txt", "w")  
    for device in DiscCounter.keys():
        if DiscCounter[device] > 1:
            DiscFile.write(device + ': ' + str(DiscCounter[device]) + '\n')
            for agent in DiscList.keys():
                if DiscList[agent] == device:
                    print('Querying: ', agent)
                    DevCheckURL = "https://ukuprd-sfc.ivanticloud.com/api/discovery/v1/device?$filter=DiscoveryId eq '" + agent + "'"
                    DevCheckQuery = requests.get(DevCheckURL, headers=Header)
                    if str(DevCheckQuery) == '<Response [401]>':
                        Bearer = input('Bearer Token expired, please enter a fresh one:')
                        Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                        DevCheckQueryQuery = requests.get(DevCheckURL, headers=Header)
                    DevCheckData = json.loads(DevCheckQuery.text)
                    if DevCheckData['@odata.count'] == 0:
                        Present = ' Blank'
                    else:
                        Present = ' Present'
                    DiscFile.write('---' + agent + Present + '\n')
    DiscFile.close()
    print('Done')
    