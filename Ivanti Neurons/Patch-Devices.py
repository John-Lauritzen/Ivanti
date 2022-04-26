from math import floor
import requests
import json

TenantID = input('Enter the Tenant ID: ')
Bearer = input('Enter the Bearer Token: ')
Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
VulnURL = "https://mluprd-sfc.ivanticloud.com/api/PatchContent/odata/tenantbulletins?$orderby=DevicesAffected desc,BulletinId&$top=100&$count=true&$filter=devicesAffected gt 0 and HasSupersededPatches eq false"
VulnQuery = requests.get(VulnURL, headers=Header)
if str(VulnQuery) == '<Response [401]>':
    print(str(VulnQuery), ' returned. Check Landscape, Tenant ID, and Token and try again.')
else:
    VulnData = json.loads(VulnQuery.text)
    VulnList = list()
    for vuln in VulnData['value']:
        VulnList.append(vuln['BulletinId'])

    if VulnData['@odata.count'] > 100:
        VulnCount = floor(VulnData['@odata.count']/100)
        print(VulnCount)
        for i in range(1, VulnCount):
            VulnStepURL = "https://mluprd-sfc.ivanticloud.com/api/PatchContent/odata/tenantbulletins?$skip=" + str(i * 100) + "&$orderby=DevicesAffected desc,BulletinId&$top=100&$count=true&$filter=devicesAffected gt 0 and HasSupersededPatches eq false"
            VulnStepQuery = requests.get(VulnStepURL, headers=Header)
            if str(VulnStepQuery) == '<Response [401]>':
                Bearer = input('Bearer Token expired, please enter a fresh one:')
                Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                VulnStepQuery = requests.get(VulnStepURL, headers=Header)
            VulnStepData = json.loads(VulnStepQuery.text)
            for vuln in VulnStepData['value']:
                VulnList.append(vuln['BulletinId'])
    print('Vulnerability List Complete. Gathering Devices.')
    DeviceList = list()
    VulnRefList = list()
    VulnResultList = list()
    for bulletin in VulnList:
        print('Querying ', bulletin)
        BulletinURL = "https://mluprd-sfc.ivanticloud.com/api/PatchContent/odata/devices?BulletinId=" + bulletin + "&%24top=100"
        BulletinQuery = requests.get(BulletinURL, headers=Header)
        if str(BulletinQuery) == '<Response [401]>':
                Bearer = input('Bearer Token expired, please enter a fresh one:')
                Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                BulletinQuery = requests.get(BulletinURL, headers=Header)
        BulletinData = json.loads(BulletinQuery.text)
        print('Number of Devices: ', BulletinData['@odata.count'])
        BulletinCount = floor(BulletinData['@odata.count']/100)
        if BulletinCount > 0:
            for i in range(1, BulletinCount):
                VulnRefList.append(bulletin + str(i))
                VulnResultList.append(BulletinData['value'])
                BulletinURL = "https://mluprd-sfc.ivanticloud.com/api/PatchContent/odata/devices?BulletinId=" + bulletin + "&%24top=100&$skip=" + str(i*100)
                BulletinQuery = requests.get(BulletinURL, headers=Header)
                print('Querying batch ', str((i+1)*100))
                if str(BulletinQuery) == '<Response [401]>':
                    Bearer = input('Bearer Token expired, please enter a fresh one:')
                    Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                    BulletinQuery = requests.get(BulletinURL, headers=Header)
                BulletinData = json.loads(BulletinQuery.text)
        else:
            VulnRefList.append(bulletin)
            VulnResultList.append(BulletinData['value'])

    for i in range(len(VulnRefList)):
        print('Processing ', VulnRefList[i])
        for device in VulnResultList[i]:
                if device['Id'] not in DeviceList:
                    DeviceList.append(device['Id'])
    
    DeviceFile = open("Patch-Devices-Output.txt", "w")
    for device in DeviceList:
        DeviceFile.write(device + '\n')
    DeviceFile.close()
    print('Done')