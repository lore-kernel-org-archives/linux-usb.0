Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138AC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F42D20645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aXtGwnFF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="NDwv/G+/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfDSSxP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:15 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37884 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728513AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 16415C0AE3;
        Fri, 19 Apr 2019 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673071; bh=v+9OxjaWjTsT3Sz7TqYx6KCARUL2gWv5o0BpBc79B5Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=aXtGwnFFRORnRK3ADdiVtaEbmwH/Uuu8Mx8CAWjFsIUmAjBgnVRslGQgHZXw71a5w
         2/P3E2UCJv/26hhPsbThJL2lcKhde4GCtiUwLyLYJkfFi+Cl0XsBScDEXLhidbmBJ1
         zSN21GHn/pnUrF7ymCymdK4777FMITsTSzCVoZqjFudqXcruY5moClYBlehtsdsb5S
         6PRzH1kIXPMGFIal7trAWWy9CToRLfbXoYpbvStFxXm4vLm8dRRaI3BPOOJrO2DqCV
         JJXLfHOT/z2amD40+pY/RiN6V7D6Dy2Z1hwKtCGPUfHhXbdoH1s6+cVA7OMMyutU9D
         5aswvzaIyQj8g==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 21F2BA0096;
        Fri, 19 Apr 2019 11:24:32 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:31 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+9OxjaWjTsT3Sz7TqYx6KCARUL2gWv5o0BpBc79B5Y=;
 b=NDwv/G+/gk1gqOLEiO6TK8K9xTGvFulJ2uglV3W2O49PzqD5c+rHi8D4seqqYyg6Gc4ps7yW+iFZmA3hlCRXQqvTwj3fsmGyeF+VXIurfo/2070r0XhQmq0LIZ64kvA1nD/rB3QHMvI+7RRNc6lt6qzQ+r6Ls3uatSgShtYvcxY=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:24:29 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:24:29 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 06/14] usb: dwc2: Add part. power down exit from
 dwc2_conn_id_status_change().
Thread-Topic: [PATCH v1 06/14] usb: dwc2: Add part. power down exit from
 dwc2_conn_id_status_change().
Thread-Index: AQHU9qJ0E/lr8Az9bkKSQsx99gyJHg==
Date:   Fri, 19 Apr 2019 11:24:29 +0000
Message-ID:
 <8d5e1a9ea7207845069104f967e0e1ae558c0624.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::11) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfc5b4eb-4f31-4110-34dc-08d6c4b995cd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383AE3AF7D391670E4D08DFA7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jADRM5vLGXgdfyWst9ek1KS6PiBPpQsLyrzq7vO+Vc79L703mv2Hwcg8mAUvyEfMPhdROxVhjyg27LpPDVOo4KGfGA7OwVBk19E8I9o/EXW9D+f+G/VPIlE1qcPFdUMfaqeIrqsVqYZckfZCU5b7968NsmbJEo88H/x7WYb6wYJltGMp06gzx6bYxPnyUz+U5q9c6Vz+EOZIn1y1APz4QYuaQkAZ0HxLayw8yeQZ5v8TCWhdeFUw3LJKy9YJaBFEewa7sGhpm4x9kH3FyRT5zMf1yLP6rCnyuMymX4Cyyp0QRnOCmvwOrt44j8RQdLrnNpgljmzZ6BrYmThXRTxbc3QZ5978w4B/BPHSRcVyQHmes+kIEaN2kimfYkzumP72nTGTX4eCBPae7pvmL6Zwyz4LskMQ9OJcdApWHU5wQho=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc5b4eb-4f31-4110-34dc-08d6c4b995cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:29.2830
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
Message-ID: <20190419112429.g02ZFiCkaor3DlnVC3MTlDd0IWhkBavzdH_5ST_6QJE@z>

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
