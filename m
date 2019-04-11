Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619A6C10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21E4A2084D
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CSRAM4G5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfDKJnz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 05:43:55 -0400
Received: from mail-eopbgr20066.outbound.protection.outlook.com ([40.107.2.66]:12214
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbfDKJnz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Apr 2019 05:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mrneInbIAf4aOzQCK5b5ZYdNaCBGAYDdG+9KSoeR2A=;
 b=CSRAM4G52wHP53kfFppSKLWvgLZNIaGjuO5XGuBy7YZjTBEbRtb35het+VhEhb5QRttKX+KpxZDTeY9WwiZSEuhF21W9PcUqsUNzuY283JV1gcKiNsKXMPHXWCYhL9NZZske+s4D4xf5OfG8h4cIs3t2vDCFBfPchEd4p6fdug8=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3117.eurprd04.prod.outlook.com (10.170.229.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Thu, 11 Apr 2019 09:43:51 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::2c55:3ad5:63a9:77a2]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::2c55:3ad5:63a9:77a2%3]) with mapi id 15.20.1771.021; Thu, 11 Apr 2019
 09:43:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: Why there is a refcnt check when we change configfs
 property
Thread-Topic: [EXT] Re: Why there is a refcnt check when we change configfs
 property
Thread-Index: AdTpLGh1VL7L01/0R/2ANZXQil7QIgADMemAAF+87QAABsmugADBPl6wAJwYSwAAAIa+wA==
Date:   Thu, 11 Apr 2019 09:43:51 +0000
Message-ID: <VI1PR04MB53278B8F18FBCC3544C04A4B8B2F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <VI1PR04MB5327CD7017881B1F0D70730A8B560@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87tvfghh5u.fsf@linux.intel.com>
 <VI1PR04MB5327F6BA759FD5B0FDADC71C8B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com>
 <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <17c2afd6-0390-d3e7-eae1-718234aeca6f@gmail.com>
In-Reply-To: <17c2afd6-0390-d3e7-eae1-718234aeca6f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bc5ed59-3528-4898-c7a4-08d6be623497
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3117;
x-ms-traffictypediagnostic: VI1PR04MB3117:
x-microsoft-antispam-prvs: <VI1PR04MB3117D41EB6893B02EA5DC1CE8B2F0@VI1PR04MB3117.eurprd04.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(53936002)(76176011)(11346002)(110136005)(86362001)(97736004)(316002)(186003)(99286004)(4326008)(229853002)(6246003)(14454004)(26005)(7696005)(68736007)(2906002)(3846002)(6506007)(25786009)(102836004)(6116002)(6436002)(93886005)(33656002)(5660300002)(476003)(8936002)(8676002)(44832011)(52536014)(486006)(256004)(446003)(81166006)(66066001)(508600001)(9686003)(105586002)(7736002)(74316002)(305945005)(55016002)(106356001)(71200400001)(71190400001)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3117;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Sr/PMmCdkCy2jULQNyCum7iEJMWy+Bp8dRutZmOODCEY8tg3d9ttRkbaUlJ8kzIbjJ2o8RyCZaNRTHhcNUnp810pTQEbsrKszOBC58DKRp2JP+9xS/a0tiXkT3ZAj2TLWvGJpFfv7LFtccRhsGX/aNGpvrsSjOzLlVbqz86lGbUrGeYCpgDtD0T6rTI6K3KVdYEYmdVrAutBFaJCGzx4fK0ng1PktthmLhzNG9FzDjUZMwpu23R7DgarDVa/DG/z0aS8hjyJNKl0/hOX4DOw57pvNrYqtosRcVTeq9D8OIJNAjMGIPZvR87SHHOZQ2DFSIsU7uWqjBZEPDTFPZCK6pff4CKIbOwkJWcvZo9J2Di6kKJmGzZZ0y9dEVWIgaynQBCarryc3+/nFZZuPl8iWdsWOP9gp9jynnMDakVu2w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc5ed59-3528-4898-c7a4-08d6be623497
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 09:43:51.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+DQo+ID4+Pg0KPiA+Pj4gQW5kcnplaiwgd291bGQgeW91IHRlbGwgdXMgd2h5IHlvdSBp
bnRyb2R1Y2UgcmVmY250IGZvciBkcml2ZXIncw0KPiA+Pj4gY29uZmlnZnMgb3B0cz8gQW5kIHdo
eSBpdCBpcyBuZWVkZWQgdG8ganVkZ2UgZm9yICJzdG9yZSIgb3BlcmF0aW9uPw0KPiA+Pj4NCj4g
Pj4NCj4gPj4gVGhlIHJlYXNvbiBpcyB0aGF0IGEgZnVuY3Rpb24gY2FuIGJlIGxpbmtlZCB0byBt
b3JlIHRoYW4gb25lDQo+ID4+IGNvbmZpZ3VyYXRpb24uIEltYWdpbmUgdGhpcyBzZXF1ZW5jZTog
eW91IGNyZWF0ZSBhIGZ1bmN0aW9uLCBzZXQgaXRzDQo+ID4+IHBhcmFtZXRlcnMgYW5kIHRoZW4g
Y3JlYXRlIGEgY29uZmlndXJhdGlvbi4gVGhlbiB5b3UgZGVjbGFyZSAiSSB3YW50DQo+ID4+IHRo
aXMgZnVuY3Rpb24gaW4gbXkgY29uZmlndXJhdGlvbiIuIFlvdSBjYW4gZGVjaWRlIHRoYXQgeW91
IHdhbnQgdGhhdA0KPiA+PiBwYXJ0aWN1bGFyIGZ1bmN0aW9uIGluc3RhbmNlIGJlY2F1c2UgeW91
IGFscmVhZHkga25vdyBob3cgaXQgaXMNCj4gPj4gY29uZmlndXJlZCBhbmQgYXJlIGZpbmUgd2l0
aCB0aGF0IHN0YXRlLiBUaGluayBvZiBpdCBhcyBhIGNvbnRyYWN0IGJldHdlZW4gdGhlDQo+IGZ1
bmN0aW9uIGFuZCB0aGUgY29uZmlndXJhdGlvbi4NCj4gPj4NCj4gPj4gTm93LCBzdXBwb3NlIHNv
bWUgb3RoZXIgY29uZmlndXJhdGlvbiBpcyBjcmVhdGVkIGFuZCBpbiB0aGF0DQo+ID4+IGNvbmZp
Z3VyYXRpb24gYSBzaW1pbGFyIGZ1bmN0aW9uIGlzIG5lZWRlZC4gVGhlIGNyZWF0b3Igb2YgdGhh
dCBvdGhlcg0KPiA+PiBjb25maWd1cmF0aW9uIG1pZ2h0IGJlIHRlbXB0ZWQgdG8gbW9kaWZ5IHRo
ZSBleGlzdGluZyBhbmQgYWxyZWFkeQ0KPiA+PiB1c2VkIGZ1bmN0aW9uIChsaW5rZWQgdG8gYSBj
b25maWd1cmF0aW9uKSwgdGh1cyBicmVha2luZyB0aGUgY29udHJhY3QgYmV0d2VlbiB0aGUNCj4g
ZnVuY3Rpb24gYW5kIHRoZSBmaXJzdCBjb25maWd1cmF0aW9uLg0KPiA+DQo+ID4gVGhhbmtzLCBB
bmRyemVqLg0KPiA+DQo+ID4gQnV0IHdlIGRlc2lnbmVkICJzdG9yZSIgZW50cnkgZm9yIGZ1bmN0
aW9uIGRyaXZlcnMsIHdlIGNhbid0IHVzZSBpdCBub3cuDQo+ID4gSXMgaXQgcG9zc2libGUgbGV0
IHRoZSBwYXJhbWV0ZXJzIHBlciBmdW5jdGlvbiBkZXZpY2UgaW5zdGVhZCBvZiBmdW5jdGlvbiBk
cml2ZXI/DQo+ID4gT3IgbGlrZSBtb2R1bGUgcGFyYW1ldGVycywgbGV0IHRoZSB1c2VyIGNoYW5n
ZSBvbmUgdGltZSBhdCBsZWFzdC4NCj4gPg0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgZGVzY3JpYmUg
eW91ciB1c2UgY2FzZT8NCj4gDQo+IEFuZHJ6ZWoNCg0KSSB3b3VsZCBsaWtlIHRvIGNoYW5nZSBw
YXJhbWV0ZXJzIGZvciBmdW5jdGlvbiBkcml2ZXIgdGhyb3VnaCBjb25maWdmcywgYmVsb3cgaXMg
dGhlIGV4YW1wbGUgZm9yIG5jbSBhbmQgZl9zb3VyY2VzaW5rIGNhc2VzLA0KdGhhbmtzLg0KDQpp
ZiBbICIkRlVOQyIgPT0gIm5jbSIgXTsgdGhlbg0KbWtkaXIgZnVuY3Rpb25zLyRGVU5DIi4wIg0K
bG4gLXMgZnVuY3Rpb25zLyRGVU5DIi4wIiBjb25maWdzL2MuMQ0KZWNobyAxMCA+IGZ1bmN0aW9u
cy9uY20uMC9xbXVsdA0KZWNobyAiMTI6YTU6Y2Y6NDI6OTI6ZmQiID4gZnVuY3Rpb25zL25jbS4w
L2hvc3RfYWRkcg0KZWNobyAiNWU6YmM6Y2E6Mjc6OTI6YjEiID4gZnVuY3Rpb25zL25jbS4wL2Rl
dl9hZGRyDQpmaQ0KDQppZiBbICIkRlVOQyIgPT0gInNzIiBdOyB0aGVuDQpjZCAvc3lzL2tlcm5l
bC9jb25maWcvdXNiX2dhZGdldA0KY2QgZzENCmVjaG8gIjB4MDUyNSIgPiBpZFZlbmRvcg0KZWNo
byAiMHhhNGEwIiA+IGlkUHJvZHVjdA0KZXhwb3J0IEZVTkM9IlNvdXJjZVNpbmsiDQpta2RpciBm
dW5jdGlvbnMvJEZVTkMiLjAiDQpsbiAtcyBmdW5jdGlvbnMvJEZVTkMiLjAiIGNvbmZpZ3MvYy4x
DQpjZCBmdW5jdGlvbnMvJEZVTkMiLjAiDQplY2hvIDEgPiBwYXR0ZXJuDQplY2hvIDEgPiBpc29j
X2ludGVydmFsDQplY2hvIDEwMjQgPiBpc29jX21heHBhY2tldA0KZWNobyAyID4gaXNvY19tdWx0
DQojaXNvY19tYXhidXJzdA0KZWNobyAxMDI0ID4gYnVsa19idWZsZW4NCmVjaG8gMTYgPiBidWxr
X3FsZW4NCmVjaG8gMTYgPiBpc29fcWxlbg0KZmkNCg0KUGV0ZXINCg==
