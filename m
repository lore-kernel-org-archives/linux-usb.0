Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D7FC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0996C20645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gAoDBdxB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="rYCwGxf/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfDSSxO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:14 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37874 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727526AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8E368C0BBB;
        Fri, 19 Apr 2019 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673090; bh=CZz1oOjo2ubLfuhbH7HzE1RDYKomNQTzI3bDoDGt+nw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gAoDBdxBkX9AF78ZTzBLF8fgyATSItqT3drSVxrfuetjZIcsmWqC7rJJiRp8tXsDL
         kV5QHgl8n2+4+XFlzEmGNBmplvel6kKjg6uRY02kJdOJW0+kiFxHct4MuR1JUDIX5x
         Wvg/nWsVmW3y2pdA/klWe7eyuUfE+0z4XNY2f6lmS2FFQuxIkoNtxVq5TBF4b65Yuu
         wSSIrVsmBtfNmhHujP2aVp1UvDhpGK/cKIegOu7zphFYCOhnSNmJCHRnfxtY62fNUa
         O50I0m9n3LtIH1DXOWRUEPxNWz8cYqqpVczObX8RZT6iNdcXqvC85L4W9hGhCbI0Xc
         1AzQxeQ7MQWJw==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9A74AA005D;
        Fri, 19 Apr 2019 11:24:51 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:51 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZz1oOjo2ubLfuhbH7HzE1RDYKomNQTzI3bDoDGt+nw=;
 b=rYCwGxf/jtFWRmgwoBHPRAxx+bmIL+2GMNmlsOS6ucq/+KxZ3DYTy/c+8GcpkZFvvlrUlitX+DIAUrRy8UBl0f6mBReSTWBwA6jaEivmNJct063Kh//gC0vIn0WvHLq60irs80cSTeDA8+h5B9vahW8dyJsRLzJtviPcxRsOaUk=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:24:49 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:24:49 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Topic: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Index: AQHU9qJ/tHbivSmPyUKJBC/Mf5HbVQ==
Date:   Fri, 19 Apr 2019 11:24:48 +0000
Message-ID:
 <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::36) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1481e60a-d3b2-4233-2d9b-08d6c4b9a140
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383C424B5602F08E3929044A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zMOjqsEI1JxzOahOJk9PUTn3/YsmcelWoBjjDmYedWGheGx5BHQzSp5UDi3iJ4BVjEC+e1vZI02Z4c+6NAPd0FwPCD2a4O3uK2IgOGJINpf8+9YM1t/Z198hrMpXkPkFQi+sfNTSnXqJgcw3G9mE/iBLFLfX5cer4U4RHXU2Q6cnWVe7z1NQ3mLSdprBo5HYTd9C53gzru6WQh1SCj+u6leGJcfXncKbJA6CG8ypiY8uqTbQwK+JWoTEFE75cyQ1ENE+AYlb8xDzAUDtq8FVeeTMGvq31Sd6OGIbiLUlGexB+leWeck6eg9/lw9A5kEt5Bj6CD7VgKhvFvWjkBzdASnvJJZBas9DDL9OLwCAiIZCPAVLsyHOQXvsV2OB6hLuPnJpbayemUX9FgWZA1NDLcfhcFkdcC79TE0CRhO2frE=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1481e60a-d3b2-4233-2d9b-08d6c4b9a140
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:48.8467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2383
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419112448.PYV3i97yBSX1S_y5EIn3Xxm4jYZX6ireBEQ9-nrfXpE@z>

LSBBZGRlZCBhIGRlZmF1bHQgcGFyYW0gInBvd2VyX3NhdmluZyIgdG8gZW5hYmxlIG9yDQogIGRp
c2FibGUgaGliZXJuYXRpb24gb3IgcGFydGlhbCBwb3dlciBkb3duIGZlYXR1cmVzLg0KDQotIFBy
aW50ZWQgaGliZXJuYXRpb24gcGFyYW0gaW4gaHdfcGFyYW1zX3Nob3cgYW5kDQogIHBvd2VyX3Nh
dmluZyBwYXJhbSBpbiBwYXJhbXNfc2hvdy4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9z
eWFuIDxhcnR1cnBAc3lub3BzeXMuY29tPg0KU2lnbmVkLW9mZi1ieTogTWluYXMgSGFydXR5dW55
YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9kd2MyL2NvcmUuaCAg
ICB8ICAzICsrKw0KIGRyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jIHwgIDIgKysNCiBkcml2ZXJz
L3VzYi9kd2MyL3BhcmFtcy5jICB8IDE5ICsrKysrKysrKysrKystLS0tLS0NCiAzIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MyL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQppbmRleCAz
MGJhYjg0NjNjOTYuLjkyMjE5MzNhYjY0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzIv
Y29yZS5oDQorKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuaA0KQEAgLTM3Myw2ICszNzMsOCBA
QCBlbnVtIGR3YzJfZXAwX3N0YXRlIHsNCiAgKiAgICAgICAgICAgICAgICAgICAgICBjYXNlLg0K
ICAqICAgICAgICAgICAgICAgICAgICAgIDAgLSBObyAoZGVmYXVsdCkNCiAgKiAgICAgICAgICAg
ICAgICAgICAgICAxIC0gWWVzDQorICogQHBvd2VyX3NhdmluZzoJU3BlY2lmaWVzIGlmIHBvd2Vy
IHNhdmluZyBpcyBlbmFibGVkIG9yIG5vdC4gSWYgaXQgaXMNCisgKgkJCWVuYWJsZWQgcG93ZXJf
ZG93biBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgZW5hYmxlZC4NCiAgKiBAcG93ZXJfZG93bjogICAg
ICAgICBTcGVjaWZpZXMgd2hldGhlciB0aGUgY29udHJvbGxlciBzdXBwb3J0IHBvd2VyX2Rvd24u
DQogICoJCQlJZiBwb3dlcl9kb3duIGlzIGVuYWJsZWQsIHRoZSBjb250cm9sbGVyIHdpbGwgZW50
ZXINCiAgKgkJCXBvd2VyX2Rvd24gaW4gYm90aCBwZXJpcGhlcmFsIGFuZCBob3N0IG1vZGUgd2hl
bg0KQEAgLTQ2OSw2ICs0NzEsNyBAQCBzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyB7DQogCWJvb2wg
dWZyYW1lX3NjaGVkOw0KIAlib29sIGV4dGVybmFsX2lkX3Bpbl9jdGw7DQogDQorCXVuc2lnbmVk
IGludCBwb3dlcl9zYXZpbmc6MTsNCiAJaW50IHBvd2VyX2Rvd247DQogI2RlZmluZSBEV0MyX1BP
V0VSX0RPV05fUEFSQU1fTk9ORQkJMA0KICNkZWZpbmUgRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BB
UlRJQUwJCTENCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2RlYnVnZnMuYyBiL2RyaXZl
cnMvdXNiL2R3YzIvZGVidWdmcy5jDQppbmRleCA3ZjYyZjRjZGMyNjUuLjhiMjdjZjBiNjgyYiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jDQorKysgYi9kcml2ZXJzL3Vz
Yi9kd2MyL2RlYnVnZnMuYw0KQEAgLTY5NSw2ICs2OTUsNyBAQCBzdGF0aWMgaW50IHBhcmFtc19z
aG93KHN0cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lkICp2KQ0KIAlwcmludF9wYXJhbV9oZXgoc2Vx
LCBwLCBhaGJjZmcpOw0KIAlwcmludF9wYXJhbShzZXEsIHAsIHVmcmFtZV9zY2hlZCk7DQogCXBy
aW50X3BhcmFtKHNlcSwgcCwgZXh0ZXJuYWxfaWRfcGluX2N0bCk7DQorCXByaW50X3BhcmFtKHNl
cSwgcCwgcG93ZXJfc2F2aW5nKTsNCiAJcHJpbnRfcGFyYW0oc2VxLCBwLCBwb3dlcl9kb3duKTsN
CiAJcHJpbnRfcGFyYW0oc2VxLCBwLCBscG0pOw0KIAlwcmludF9wYXJhbShzZXEsIHAsIGxwbV9j
bG9ja19nYXRpbmcpOw0KQEAgLTc0Niw2ICs3NDcsNyBAQCBzdGF0aWMgaW50IGh3X3BhcmFtc19z
aG93KHN0cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lkICp2KQ0KIAlwcmludF9wYXJhbShzZXEsIGh3
LCBudW1fZGV2X3BlcmlvX2luX2VwKTsNCiAJcHJpbnRfcGFyYW0oc2VxLCBodywgdG90YWxfZmlm
b19zaXplKTsNCiAJcHJpbnRfcGFyYW0oc2VxLCBodywgcG93ZXJfb3B0aW1pemVkKTsNCisJcHJp
bnRfcGFyYW0oc2VxLCBodywgaGliZXJuYXRpb24pOw0KIAlwcmludF9wYXJhbShzZXEsIGh3LCB1
dG1pX3BoeV9kYXRhX3dpZHRoKTsNCiAJcHJpbnRfcGFyYW1faGV4KHNlcSwgaHcsIHNucHNpZCk7
DQogCXByaW50X3BhcmFtX2hleChzZXEsIGh3LCBkZXZfZXBfZGlycyk7DQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMNCmlu
ZGV4IDI0ZmY1ZjIxY2IyNS4uZDdjYzMzNmFhMWI3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMi9wYXJhbXMuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYw0KQEAgLTI2Mywx
MiArMjYzLDE4IEBAIHN0YXRpYyB2b2lkIGR3YzJfc2V0X3BhcmFtX3Bvd2VyX2Rvd24oc3RydWN0
IGR3YzJfaHNvdGcgKmhzb3RnKQ0KIHsNCiAJaW50IHZhbDsNCiANCi0JaWYgKGhzb3RnLT5od19w
YXJhbXMuaGliZXJuYXRpb24pDQotCQl2YWwgPSAyOw0KLQllbHNlIGlmIChoc290Zy0+aHdfcGFy
YW1zLnBvd2VyX29wdGltaXplZCkNCi0JCXZhbCA9IDE7DQotCWVsc2UNCi0JCXZhbCA9IDA7DQor
CWlmICghaHNvdGctPnBhcmFtcy5wb3dlcl9zYXZpbmcpIHsNCisJCXZhbCA9IERXQzJfUE9XRVJf
RE9XTl9QQVJBTV9OT05FOw0KKwkJZGV2X2RiZyhoc290Zy0+ZGV2LCAiJXM6IFBvd2VyIHNhdmlu
ZyBpcyBkaXNhYmxlZC5cbiIsDQorCQkJX19mdW5jX18pOw0KKwl9IGVsc2Ugew0KKwkJaWYgKGhz
b3RnLT5od19wYXJhbXMuaGliZXJuYXRpb24pDQorCQkJdmFsID0gRFdDMl9QT1dFUl9ET1dOX1BB
UkFNX0hJQkVSTkFUSU9OOw0KKwkJZWxzZSBpZiAoaHNvdGctPmh3X3BhcmFtcy5wb3dlcl9vcHRp
bWl6ZWQpDQorCQkJdmFsID0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUw7DQorCQllbHNl
DQorCQkJdmFsID0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX05PTkU7DQorCX0NCiANCiAJaHNvdGct
PnBhcmFtcy5wb3dlcl9kb3duID0gdmFsOw0KIH0NCkBAIC0yOTAsNiArMjk2LDcgQEAgc3RhdGlj
IHZvaWQgZHdjMl9zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0K
IAlkd2MyX3NldF9wYXJhbV9waHlfdHlwZShoc290Zyk7DQogCWR3YzJfc2V0X3BhcmFtX3NwZWVk
KGhzb3RnKTsNCiAJZHdjMl9zZXRfcGFyYW1fcGh5X3V0bWlfd2lkdGgoaHNvdGcpOw0KKwlwLT5w
b3dlcl9zYXZpbmcgPSB0cnVlOw0KIAlkd2MyX3NldF9wYXJhbV9wb3dlcl9kb3duKGhzb3RnKTsN
CiAJcC0+cGh5X3VscGlfZGRyID0gZmFsc2U7DQogCXAtPnBoeV91bHBpX2V4dF92YnVzID0gZmFs
c2U7DQotLSANCjIuMTEuMA0KDQo=
