/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UPCCommon].[dbo].[ApplicationUpdater]
  WHERE Hash IN (0x437172bc7ad484a401453e2913ed2113e1858bfa, 0xa2751d031ca94798602f91a47e0c7f760f2dbce6, 0x746c73341798947e26daead367705cc7736d4c25, 0x72dacd5aa1694be2ea81baf0a41b9e520abf89a3, 0x3350a7cd68c28988ebd8904f8d2352ffbc1a136b, 0xb3709b6b40a7cc42cd050f81c9172f28f0720d17, 0x27f6d364a9d7764f41d4b72dce03bdc2e9cc9331, 0x32bbe63a7c5fc049d87d3b67bf6399e202a4bb2e, 0x62ca8a6043ac259689e2fd4fa7c2c58210eb9a75, 0x0051957b3df37a353acb519c1e7eeaed564f7141, 0xee58c8d0b11b6820f335b97b51f84d42c06f900b, 0x0cfdfbe47e31af6e0b3de6f399b1fa9b240e51e3, 0x0930ae4b561e7edf723b4605fb8e2cb75b715c65, 0xf0360a421fad1a86953e39ff4519c47e99b5ac42, 0xb1924ef65e486f822f1ebc9cab9fd4c7ff263e7d, 0xc37bb6b38037da6c145bc962efae642848f31ab8, 0xd0b4f6e756090bf9135f9758576ac2390c5e15a2, 0x867960b371985213dfe0a36f6963639493f65ece, 0xa23fc67105ec50931f0deb227245cbccf63f6140, 0x1b5d31edf8964b87a3fdbff943742b1c58a2bf6d, 0x87edb7ef1f3292310b9038a646c6645ace3024ea)

SELECT *
  FROM [UPCCommon].[dbo].[ApplicationUpdater]
  WHERE ApplicationUpdaterName like '%msi%'

  SELECT *
  FROM UPCCommon.dbo.ApplicationFileName AFN JOIN [UPCCommon].[dbo].[ApplicationFileDetail] AFD ON AFD.FileNameID = AFN.FileNameID
  WHERE SHA1 = 0xD980569044FB8CF6C0998C0C600392F85CE2CB02 