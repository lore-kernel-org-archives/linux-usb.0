Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E62C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3718E2084D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NdLo+VPC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="tJNMPU8G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfDLNoX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:44:23 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:41350 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbfDLNoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:44:23 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 1356B10C29EA;
        Fri, 12 Apr 2019 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076663; bh=v+9OxjaWjTsT3Sz7TqYx6KCARUL2gWv5o0BpBc79B5Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NdLo+VPCu6WocATFdq1tDI3waZQBw8wQJ+82cj0okbzKgL+T9vyPP5GoRsxJF8WI3
         tVdriBk3QGJ1Zz0VJCpk0vOM9QdnZz6Ln0m3XjbDCQUwamaupPFP168bpVRhz0Y2si
         mA7tarKS5IFPham2jCOumUSATRd/X3vOq4N90hyN2yfo4B08ynQOcLNQAJuGuROE3Y
         nTCjyo1ifPFbKLRaES0+amM8ofk2GbO7vZMY/WaMy/cuXLfwijny+hvo4y/+XXCsUg
         lRiKmCZIO3KOdcHFBvV+LTRVa5dvGw+sT/wbqBArOTsN8hiBEvEkgQXCKf0yuq8LEl
         gM0/b3ISIATHQ==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D217AA006A;
        Fri, 12 Apr 2019 13:44:22 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:44:22 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:44:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+9OxjaWjTsT3Sz7TqYx6KCARUL2gWv5o0BpBc79B5Y=;
 b=tJNMPU8GIXg8d7KRqD7RKDREtAC6fYxqFTQgS7s33uPqdL47wJ5UwCeOemF33subHpNPMErI6earpg8H3zTkqX/LPwHL/r92lUBcNbq3ATZEpWj5eAszjYXIVLYey+Jlq6J2c24cBwph1SFuF8fDPDjYY5ciE/Lsgzber4CpXXc=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0512.namprd12.prod.outlook.com (10.162.105.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Fri, 12 Apr 2019 13:44:18 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:44:18 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 06/14] usb: dwc2: Add part. power down exit from
 dwc2_conn_id_status_change().
Thread-Topic: [PATCH 06/14] usb: dwc2: Add part. power down exit from
 dwc2_conn_id_status_change().
Thread-Index: AQHU8TXTw6FMdm7vbEWwDIDxru8qeg==
Date:   Fri, 12 Apr 2019 13:44:18 +0000
Message-ID:
 <38533d799cc5cd10f6d4ca39e8423820a98ebda6.1555075928.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To SN1PR12MB2431.namprd12.prod.outlook.com (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [209.107.194.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92980a36-faeb-4791-ef8f-08d6bf4cf50d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0512;
x-ms-traffictypediagnostic: SN1PR12MB0512:
x-microsoft-antispam-prvs: <SN1PR12MB0512B91C4DA33889F0FE3833A7280@SN1PR12MB0512.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(366004)(346002)(376002)(136003)(199004)(189003)(71200400001)(14454004)(476003)(71190400001)(36756003)(68736007)(107886003)(3846002)(118296001)(6116002)(6436002)(106356001)(4326008)(105586002)(2906002)(256004)(25786009)(66066001)(81156014)(99286004)(186003)(7736002)(8676002)(26005)(53936002)(6486002)(102836004)(2501003)(386003)(6506007)(81166006)(86362001)(52116002)(6512007)(110136005)(316002)(76176011)(305945005)(97736004)(5660300002)(54906003)(486006)(446003)(11346002)(478600001)(8936002)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0512;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:3;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dDPD4Oe79fH5tLk78W8bAj3jbximvgc/jDOVQ8Qsoajz1fXlNq5s07guKtUjSDpDVBVmhG9WGlYcAmt6TvdzEk7yhaYys3/3shO48vzSd4dycAhrDqy3XP+iCEkKM75MPU5j4xD4f2qFf1tVFm0F6xSTPGMr8EYJT/pQtf9RobP+0xEydeOcZmQ3+SPECpiGGJOSd5Eyo/w87y/0p4jgrZJr4y7PmUSWSpqqgtaVirNjzZl72z10ZbyDTJlLgxCxb/8C28IME6KuFozrt0y0IxHPHBkx5NBfkK/InH4zMNfJJ5/rVRyiZbWcIUFtfxzTHS9JmZS60cnJ1ReXNWu+WzrVrIrgBtwitqzkzEzhSr4GnOb1pZiSffUSLyYVET5ofhvixgAbMYa/3h8zrNZ2hL6xpTmsZ9j1Z88W/amQqhE=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 92980a36-faeb-4791-ef8f-08d6bf4cf50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:44:18.2784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0512
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412134418.HDvJYLj7xSDGQdubnCfGqQdsj1wKml-lu9ZZkG2WuWM@z>

QmVmb3JlIGNoYW5naW5nIHRvIGNvbm5lY3RvciBCIGV4aXRpbmcgZnJvbSBQYXJ0aWFsDQpQb3dl
ciBEb3duIGlzIHJlcXVpcmVkLg0KDQotIEFkZGVkIGV4aXRpbmcgZnJvbSBQYXJ0aWFsIFBvd2Vy
IERvd24gbW9kZSB3aGVuDQogIGNvbm5lY3RvciBJRCBzdGF0dXMgY2hhbmdlcyB0byAiY29ubklk
IEIiLg0KICBCZWNhdXNlIGlmIGNvbm5lY3RvciBJRCBzdGF0dXMgY2hhbmdlZCB0byBCIGNvbm5l
Y3Rvcg0KICB3aGlsZSBjb3JlIHdhcyBpbiBwYXJ0aWFsIHBvd2VyIGRvd24gbW9kZSwgSEFORyB3
b3VsZA0KICBhY2NydWUgZnJvbSBhIHNvZnQgcmVzZXQuDQoNClNpZ25lZC1vZmYtYnk6IEFydHVy
IFBldHJvc3lhbiA8YXJ0dXJwQHN5bm9wc3lzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzIv
aGNkLmMgfCAxOCArKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZlcnMv
dXNiL2R3YzIvaGNkLmMNCmluZGV4IDgzNjc5MDJhNDdlYi4uNTQ0NTBmYTM1MmNmIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2Qu
Yw0KQEAgLTMzNDgsNiArMzM0OCw3IEBAIHN0YXRpYyB2b2lkIGR3YzJfY29ubl9pZF9zdGF0dXNf
Y2hhbmdlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCiAJCQkJCQl3Zl9vdGcpOw0KIAl1MzIg
Y291bnQgPSAwOw0KIAl1MzIgZ290Z2N0bDsNCisJdTMyIHBjZ2NjdGw7DQogCXVuc2lnbmVkIGxv
bmcgZmxhZ3M7DQogDQogCWRldl9kYmcoaHNvdGctPmRldiwgIiVzKClcbiIsIF9fZnVuY19fKTsN
CkBAIC0zMzg3LDYgKzMzODgsMjMgQEAgc3RhdGljIHZvaWQgZHdjMl9jb25uX2lkX3N0YXR1c19j
aGFuZ2Uoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KIAkJaWYgKGNvdW50ID4gMjUwKQ0KIAkJ
CWRldl9lcnIoaHNvdGctPmRldiwNCiAJCQkJIkNvbm5lY3Rpb24gaWQgc3RhdHVzIGNoYW5nZSB0
aW1lZCBvdXRcbiIpOw0KKw0KKwkJaWYgKGhzb3RnLT5wYXJhbXMucG93ZXJfZG93biA9PQ0KKwkJ
ICAgIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9QQVJUSUFMICYmDQorCQkgICAgaHNvdGctPmx4X3N0
YXRlID09IERXQzJfTDIpIHsNCisJCQlwY2djY3RsID0gZHdjMl9yZWFkbChoc290ZywgUENHQ1RM
KTsNCisJCQlwY2djY3RsICY9IH5QQ0dDVExfU1RPUFBDTEs7DQorCQkJZHdjMl93cml0ZWwoaHNv
dGcsIHBjZ2NjdGwsIFBDR0NUTCk7DQorDQorCQkJcGNnY2N0bCA9IGR3YzJfcmVhZGwoaHNvdGcs
IFBDR0NUTCk7DQorCQkJcGNnY2N0bCAmPSB+UENHQ1RMX1BXUkNMTVA7DQorCQkJZHdjMl93cml0
ZWwoaHNvdGcsIHBjZ2NjdGwsIFBDR0NUTCk7DQorDQorCQkJcGNnY2N0bCA9IGR3YzJfcmVhZGwo
aHNvdGcsIFBDR0NUTCk7DQorCQkJcGNnY2N0bCAmPSB+UENHQ1RMX1JTVFBEV05NT0RVTEU7DQor
CQkJZHdjMl93cml0ZWwoaHNvdGcsIHBjZ2NjdGwsIFBDR0NUTCk7DQorCQl9DQorDQogCQloc290
Zy0+b3Bfc3RhdGUgPSBPVEdfU1RBVEVfQl9QRVJJUEhFUkFMOw0KIAkJZHdjMl9jb3JlX2luaXQo
aHNvdGcsIGZhbHNlKTsNCiAJCWR3YzJfZW5hYmxlX2dsb2JhbF9pbnRlcnJ1cHRzKGhzb3RnKTsN
Ci0tIA0KMi4xMS4wDQoNCg==
