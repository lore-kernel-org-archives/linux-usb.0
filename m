Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A46C282CE
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 07:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6D420880
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 07:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="d8lYWMss"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfDHHAo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 03:00:44 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:54501
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfDHHAo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Apr 2019 03:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqDeyUOm+b1PUviVVYuW9fRp/U6FXm0GsJoLgQ60dMo=;
 b=d8lYWMssYiGwTuYhisH0A2z2iPwGhNck9oiMUHjInLT89E3iVm/8lSLOhnaq8dIiXk187YBwMH685k7HfEftrKFwYaN+pfeZOMRI+F+EbWw0pBH8K3I6280kQQxjwDOgSf0zFPnxdA3RMJP5OwyASUYvJQCv40hIaf0tNtPQUrc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5053.eurprd04.prod.outlook.com (20.177.50.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Mon, 8 Apr 2019 07:00:39 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::2c55:3ad5:63a9:77a2]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::2c55:3ad5:63a9:77a2%3]) with mapi id 15.20.1771.021; Mon, 8 Apr 2019
 07:00:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Why there is a refcnt check when we change configfs property
Thread-Topic: Why there is a refcnt check when we change configfs property
Thread-Index: AdTpLGh1VL7L01/0R/2ANZXQil7QIgADMemAAF+87QAABsmugADBPl6w
Date:   Mon, 8 Apr 2019 07:00:39 +0000
Message-ID: <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <VI1PR04MB5327CD7017881B1F0D70730A8B560@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87tvfghh5u.fsf@linux.intel.com>
 <VI1PR04MB5327F6BA759FD5B0FDADC71C8B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com>
In-Reply-To: <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f45cb1bd-3fac-4a64-9849-08d6bbefe8f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5053;
x-ms-traffictypediagnostic: VI1PR04MB5053:
x-microsoft-antispam-prvs: <VI1PR04MB505359A090F6A9D83ACFAC968B2C0@VI1PR04MB5053.eurprd04.prod.outlook.com>
x-forefront-prvs: 0001227049
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(44832011)(68736007)(86362001)(14454004)(26005)(486006)(76176011)(11346002)(476003)(8676002)(446003)(81156014)(81166006)(256004)(6506007)(102836004)(478600001)(8936002)(93886005)(66066001)(186003)(71200400001)(71190400001)(52536014)(53936002)(6246003)(33656002)(110136005)(9686003)(106356001)(97736004)(6436002)(6116002)(5660300002)(7696005)(305945005)(55016002)(7736002)(2906002)(99286004)(105586002)(4326008)(74316002)(25786009)(229853002)(316002)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5053;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qDvGZzN4F6JSWPLwxcJggNTBnxV9DGTkY2xt5lsAYxcxYlQN/A8Zv3UPzYhz9pcEVGK9UMGtzr0Y0wuWDvLXzYHxRfFnJUulTwIT/M6zp5J4PmnvBIF4P04OnBZSTSp28EG5HTRM9gA3BkwEOWNTVktCcQZkYSdu4EqT2jpGVraCKWXNst9MClunB6gjTCYmqr1sVviIn4e06VexnR/m1mjX/YTIz/Sa0l0N2SD9la6VaMliR3R8nPWvuQgCNkXGJGh8n8c+VKMxBCT0oZRvj5OSAn4ciQ5MygyES0isvN2w+pGSIGH6TRoca0ItMY2MbbkjzmhZuPOoVKvr+aCyaR63XPnuBf+oHTAjJ2cuyf/pMthcV0T4N2F8sIzmvCUZ1GNp4fyp3rL5Qrbl0qGBFAju3qjwyl9zMBJHLY12skg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45cb1bd-3fac-4a64-9849-08d6bbefe8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2019 07:00:39.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5053
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+DQo+ID4gQW5kcnplaiwgd291bGQgeW91IHRlbGwgdXMgd2h5IHlvdSBpbnRyb2R1Y2Ug
cmVmY250IGZvciBkcml2ZXIncw0KPiA+IGNvbmZpZ2ZzIG9wdHM/IEFuZCB3aHkgaXQgaXMgbmVl
ZGVkIHRvIGp1ZGdlIGZvciAic3RvcmUiIG9wZXJhdGlvbj8NCj4gPg0KPiANCj4gVGhlIHJlYXNv
biBpcyB0aGF0IGEgZnVuY3Rpb24gY2FuIGJlIGxpbmtlZCB0byBtb3JlIHRoYW4gb25lIGNvbmZp
Z3VyYXRpb24uIEltYWdpbmUNCj4gdGhpcyBzZXF1ZW5jZTogeW91IGNyZWF0ZSBhIGZ1bmN0aW9u
LCBzZXQgaXRzIHBhcmFtZXRlcnMgYW5kIHRoZW4gY3JlYXRlIGENCj4gY29uZmlndXJhdGlvbi4g
VGhlbiB5b3UgZGVjbGFyZSAiSSB3YW50IHRoaXMgZnVuY3Rpb24gaW4gbXkgY29uZmlndXJhdGlv
biIuIFlvdSBjYW4NCj4gZGVjaWRlIHRoYXQgeW91IHdhbnQgdGhhdCBwYXJ0aWN1bGFyIGZ1bmN0
aW9uIGluc3RhbmNlIGJlY2F1c2UgeW91IGFscmVhZHkga25vdw0KPiBob3cgaXQgaXMgY29uZmln
dXJlZCBhbmQgYXJlIGZpbmUgd2l0aCB0aGF0IHN0YXRlLiBUaGluayBvZiBpdCBhcyBhIGNvbnRy
YWN0IGJldHdlZW4NCj4gdGhlIGZ1bmN0aW9uIGFuZCB0aGUgY29uZmlndXJhdGlvbi4NCj4gDQo+
IE5vdywgc3VwcG9zZSBzb21lIG90aGVyIGNvbmZpZ3VyYXRpb24gaXMgY3JlYXRlZCBhbmQgaW4g
dGhhdCBjb25maWd1cmF0aW9uIGEgc2ltaWxhcg0KPiBmdW5jdGlvbiBpcyBuZWVkZWQuIFRoZSBj
cmVhdG9yIG9mIHRoYXQgb3RoZXIgY29uZmlndXJhdGlvbiBtaWdodCBiZSB0ZW1wdGVkIHRvDQo+
IG1vZGlmeSB0aGUgZXhpc3RpbmcgYW5kIGFscmVhZHkgdXNlZCBmdW5jdGlvbiAobGlua2VkIHRv
IGEgY29uZmlndXJhdGlvbiksIHRodXMNCj4gYnJlYWtpbmcgdGhlIGNvbnRyYWN0IGJldHdlZW4g
dGhlIGZ1bmN0aW9uIGFuZCB0aGUgZmlyc3QgY29uZmlndXJhdGlvbi4NCg0KVGhhbmtzLCBBbmRy
emVqLg0KDQpCdXQgd2UgZGVzaWduZWQgInN0b3JlIiBlbnRyeSBmb3IgZnVuY3Rpb24gZHJpdmVy
cywgd2UgY2FuJ3QgdXNlIGl0IG5vdy4NCklzIGl0IHBvc3NpYmxlIGxldCB0aGUgcGFyYW1ldGVy
cyBwZXIgZnVuY3Rpb24gZGV2aWNlIGluc3RlYWQgb2YgZnVuY3Rpb24gZHJpdmVyPw0KT3IgbGlr
ZSBtb2R1bGUgcGFyYW1ldGVycywgbGV0IHRoZSB1c2VyIGNoYW5nZSBvbmUgdGltZSBhdCBsZWFz
dC4NCg0KUGV0ZXINCg==
