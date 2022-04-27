from math import floor
import requests
import json

TenantID = input('Enter the Tenant ID: ')
Bearer = input('Enter the Bearer Token: ')
Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
VulnURL = "https://nvuprd-sfc.ivanticloud.com/api/PatchContent/odata/tenantbulletins?$orderby=DevicesAffected desc,BulletinId&$top=100&$count=true&$filter=devicesAffected gt 0 and HasSupersededPatches eq false"
VulnQuery = requests.get(VulnURL, headers=Header)
if str(VulnQuery) == '<Response [401]>':
    print(str(VulnQuery), ' returned. Check Landscape, Tenant ID, and Token and try again.')
else:
    VulnData = json.loads(VulnQuery.text)
    VulnList = dict()
    for vuln in VulnData['value']:
        VulnList[vuln['BulletinId']] = vuln['DevicesAffected']
    if VulnData['@odata.count'] > 100:
        VulnCount = floor(VulnData['@odata.count']/100)
        print(VulnCount)
        for i in range(1, VulnCount):
            VulnStepURL = "https://nvuprd-sfc.ivanticloud.com/api/PatchContent/odata/tenantbulletins?$skip=" + str(i * 100) + "&$orderby=DevicesAffected desc,BulletinId&$top=100&$count=true&$filter=devicesAffected gt 0 and HasSupersededPatches eq false"
            VulnStepQuery = requests.get(VulnStepURL, headers=Header)
            if str(VulnStepQuery) == '<Response [401]>':
                Bearer = input('Bearer Token expired, please enter a fresh one:')
                Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                VulnStepQuery = requests.get(VulnStepURL, headers=Header)
            VulnStepData = json.loads(VulnStepQuery.text)
            for vuln in VulnStepData['value']:
                VulnList[vuln['BulletinId']] = vuln['DevicesAffected']
    print('Vulnerability List Complete. Gathering Devices.')
    Diff = dict()
    for bulletin in VulnList.keys():
        print('Querying ', bulletin)
        BulletinURL = "https://nvuprd-sfc.ivanticloud.com/api/PatchContent/bulletin/patches?bulletinId=" + bulletin
        BulletinQuery = requests.get(BulletinURL, headers=Header)
        if str(BulletinQuery) == '<Response [401]>':
                Bearer = input('Bearer Token expired, please enter a fresh one:')
                Header = {'Uno.TenantId': TenantID, 'Authorization': Bearer}
                BulletinQuery = requests.get(BulletinURL, headers=Header)
        BulletinData = json.loads(BulletinQuery.text)
        count = 0
        for patch in BulletinData:
            count += int(patch['DevicesAffected'])
        if count != VulnList[bulletin]:
            Diff[bulletin] = count
    for bulletin in Diff.keys():
        print("Mismatched Bullentin: " + str(bulletin) + " Main view Count: " + str(VulnList[bulletin]) + " Drilldown Count: " + str(Diff[bulletin]))