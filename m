Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8104CC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 16:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51B092148D
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 16:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=p1hq.onmicrosoft.com header.i=@p1hq.onmicrosoft.com header.b="DRZj0CLr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730818AbfDXQ01 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 12:26:27 -0400
Received: from mail-eopbgr50083.outbound.protection.outlook.com ([40.107.5.83]:20133
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727393AbfDXQ01 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Apr 2019 12:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=p1hq.onmicrosoft.com;
 s=selector1-phaseone-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TkakwW93AUK9LLD2vmbCdK3PSNnFAE8MbxxpxyMoqI=;
 b=DRZj0CLrSWm+xYCcoa/7D8LyTMqa7PP5J4yis7Rzo0QKRwsfhn0UqweDBf/zDZelZjV1oaVpAcvf+3BGdp0BTceCE6pPTilx9uBuv2Z8I6m5b6ZV4gUBuUZJZ63grq66RAkX77bBmamXyH0ahwVq78h0t3EY2BNovYPLRx5CLFI=
Received: from DB8PR01MB6027.eurprd01.prod.exchangelabs.com (10.255.18.203) by
 DB8PR01MB5785.eurprd01.prod.exchangelabs.com (20.179.251.33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.17; Wed, 24 Apr 2019 16:26:24 +0000
Received: from DB8PR01MB6027.eurprd01.prod.exchangelabs.com
 ([fe80::b938:19d5:d32c:61ff]) by DB8PR01MB6027.eurprd01.prod.exchangelabs.com
 ([fe80::b938:19d5:d32c:61ff%3]) with mapi id 15.20.1835.010; Wed, 24 Apr 2019
 16:26:24 +0000
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mnarani@xilinx.com" <mnarani@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Use device tree to disable U1/U2 in gadget devices based on DWC3
Thread-Topic: Use device tree to disable U1/U2 in gadget devices based on DWC3
Thread-Index: AdT6t/o6VZ10LKYlSQi9SRTt4dMqzg==
Date:   Wed, 24 Apr 2019 16:26:24 +0000
Message-ID: <DB8PR01MB60273B2E42CF5FBD2E54ADCBDA3C0@DB8PR01MB6027.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cst@phaseone.com; 
x-originating-ip: [152.115.47.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7b6e36f-2cf3-4db3-8cdf-08d6c8d19806
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DB8PR01MB5785;
x-ms-traffictypediagnostic: DB8PR01MB5785:
x-microsoft-antispam-prvs: <DB8PR01MB5785B4B0A3D0C4D90311F309DA3C0@DB8PR01MB5785.eurprd01.prod.exchangelabs.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39850400004)(136003)(346002)(376002)(396003)(199004)(189003)(6916009)(7736002)(7696005)(478600001)(53936002)(68736007)(2906002)(305945005)(54906003)(256004)(186003)(3846002)(66066001)(102836004)(6116002)(26005)(52536014)(5660300002)(6436002)(25786009)(99286004)(476003)(2501003)(8676002)(4326008)(9686003)(33656002)(55016002)(6506007)(5640700003)(2351001)(66946007)(74316002)(1730700003)(66476007)(97736004)(486006)(66556008)(66446008)(8936002)(81156014)(64756008)(86362001)(76116006)(73956011)(71200400001)(316002)(81166006)(71190400001)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR01MB5785;H:DB8PR01MB6027.eurprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: phaseone.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FBm4T63J69hONV4ZeI7L1UaN2MWy5FaLg6jE3JVQfHGRdQxYdfNUku8/Dm080TPT4hUSDl5FEcJsRexTM+hmfdpeEaI5+Si11FI36LUBDZVLqrrd70SGyDACsK0f35WCUZ0LhBAdYhdcDoeTZCasMmenwxh4O2ao7cHVtv00StKR7hsMQjdNabefZo1pTpwVTlfMw0bsUkToN7/y3DQl5idZJuw+CeqPqyTWaunABdsSRhqCGRbYMKokGvcPlIgi81MW6y99W5vtGOWBpgISr+L3od1U/yCcPdpHAq1wt7+Bq8bm5APhB0szEXASHeEkIrVsIjqRutzMJg8Y8yMCXIPthz2fkEfhFglgfs8pxzB0T3mDmynMdno/jSesY8gWqvODdZVpXbVYGrnUz9hErshe3zXC3ac2SbaZcppBiFM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phaseone.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b6e36f-2cf3-4db3-8cdf-08d6c8d19806
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 16:26:24.2048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cbe5b4c6-877a-4fe4-be65-3be424dd0574
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB5785
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQmFsYmkgYW5kIG90aGVyIFVTQiBkZXZlbG9wZXJzLg0KDQpJIGFtIGRldmVsb3BpbmcgY2Ft
ZXJhIGRldmljZXMgYmFzZWQgb24gWGlsaW54IFp5bnFNUCwgdXNpbmcgdGhlIGdhZGdldCBmcmFt
ZXdvcmsgYW5kIHRoZSBidWlsZC1pbiBkd2MzIGNvcmUgb2YgdGhlIFp5bnFNUCBhcyBVU0IzIGNv
bnRyb2xsZXIgYW5kIHRoZSBidWlsZC1pbiBDaXJydXMgU0VSREVTIGFzIHBoeS4NClRlc3Rpbmcg
d2l0aCBhIG51bWJlciBvZiBob3N0cyBhbmQgV2luZG93cyA3LCBoYXMgc2hvd24gc3BvcmFkaWMg
cmVjb25uZWN0cyB3aGVuIGxlYXZpbmcgVTIvVTEsIGNhdXNlZCBieSBmYWlsaW5nIGxpbmsgdHJh
aW5pbmcsIHdoZXJlIHRoZSBob3N0IHJlc2V0cyB0aGUgYnVzLiBTb21ldGltZSBpdCBhbHNvIG1l
YW5zIGl0IHJlY29ubmVjdCB2aWEgVVNCMi4NCg0KU28gdG8gb3ZlcmNvbWUgdGhpcywgSSB3aWxs
IGxpa2UgdG8gaGF2ZSB0aGUgb3B0aW9uIGZvciBkaXNhYmxpbmcgVTEvVTIgb24gdGhlIGNvcmUg
d2hlbiB3b3JraW5nIHdpdGggdGhvc2UgaG9zdHMuDQoNCkN1cnJlbnRseSBJIGhhdmUgbWFkZSBh
IGhhY2sgaW4gZXAwLmMgIHdoZXJlIEkgcmV0dXJuIEVJTlZBTCBpbiBkd2MzX2VwMF9oYW5kbGVf
dTEgYW5kIGR3YzNfZXAwX2hhbmRsZV91MiB0b2dldGhlciB3aXRoIG5vdCBzZXR0aW5nIERXQzNf
RENUTF9BQ0NFUFRVMUVOQSBhbmQgRFdDM19EQ1RMX0FDQ0VQVFUyRU5BIGluIGR3YzNfZXAwX3Nl
dF9jb25maWcNCldpbGwgdGhvdWdoIHByZWZlciBhIHNvbHV0aW9uIHBvc3NpYmxlIHRvIHVwc3Ry
ZWFtLCBzbyB3YXMgdGhpbmtpbmcgYWJvdXQgYWRkaW5nIHR3byBkZXZpY2V0cmVlIGJpbmRpbmdz
Lg0KDQoqIHNucHMsdTFfZGlzYWJsZV9hc19nYWRnZXQ6IFdoZW4gc2V0IHRoZSBjb3JlIHdpbGwg
bm90IGVuYWJsZSBVMSBpZiByZXF1ZXN0ZWQgZnJvbSBob3N0LCBub3IgaW5pdGlhdGUgVTEuDQoq
IHNucHMsdTJfZGlzYWJsZV9hc19nYWRnZXQ6IFdoZW4gc2V0IHRoZSBjb3JlIHdpbGwgbm90IGVu
YWJsZSBVMiBpZiByZXF1ZXN0ZWQgZnJvbSBob3N0LCBub3IgaW5pdGlhdGUgVTIuDQoNCklmIHlv
dSB0aGluayB0aGlzIG1pZ2h0IGJlIHNvbWV0aGluZyB3aGljaCBjYW4gYmUgdXBzdHJlYW1lZCBJ
IHdpbGwgcHJlcGFyZSB0aGUgY29kZSBhbmQgc2VuZCBhIHBhdGNoIGZvciBkaXNjdXNzaW9uLg0K
T24gdGhlIG90aGVyIGhhbmQsIGlmIHlvdSB0aGluayB0aGF0IGRpc2FibGluZyBVMS9VMiB2aWEg
ZGV2aWNlIHRyZWUgYXMgc3VnZ2VzdGVkIHNob3VsZCBub3QgYmUgYSBmZWF0dXJlIG5vIG5lZWQg
Zm9yIG1lIHRvIHRyeSBtYWtpbmcgaXQgYSBmZWF0dXJlLg0KDQpLaW5kIHJlZ2FyZHMgLyBNZWQg
dmVubGlnIGhpbHNlbiANCg0KQ2xhdXMgU3RvdmdhYXJkIA0KRmlybXdhcmUgRGVzaWduIEVuZ2lu
ZWVyIA0KUGhhc2UgT25lDQo=
