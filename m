Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDED5C282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F88720693
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jAhQ4XFa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="b7e8NFXZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfDSSxN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:13 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37880 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728515AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D08F4C0BB5;
        Fri, 19 Apr 2019 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673100; bh=84iaRT6A3doeU2Jt7nZdHTG7bpRZrVH38X5Z+YZAyts=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jAhQ4XFakMxAMYPp2WKzbxlUY5IA+c6Ot5FOWBQkJMPAhVqeDirWDDmbt6yRHiLHD
         ZeW9z19CNhBvnQCNO/TR7O2cGLx3W2oyMkkITgAIVUlrrU4SK3d8JMfuTtbW4JzHYt
         94jrmc0GPK1PQnhosCiK6Su5uGw4zy5IjSvewvipX/NAQI4fetdFVk2NSoft4VrDEf
         MjKbBA7BbFEDXHbex5C2Ir8HWVGYogfDy1ilYElpSTY436hvFzPbK53DRYyanmyUOq
         S/Xdna6FbnwDUcJyURgMKCmZsCn2wsG25qxnniAscDMPbo7B2yN0jJMeCH3Vxlqkni
         8RdoRHw0qhh1Q==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DCB6BA005D;
        Fri, 19 Apr 2019 11:25:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:01 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84iaRT6A3doeU2Jt7nZdHTG7bpRZrVH38X5Z+YZAyts=;
 b=b7e8NFXZi3+9apIfJ48/m9DEOVRet5DBD1iokkZ7mO+umhVTQ1jEdRWEe7qj96XAptLg1+ETuR7nRR3RQLZdUE/7C2+i13ok1SXd+CZlfeg30p6icKuKfBni2nL+NQZpR6yeS/nSr16YKV5aOIGZINbl+zne5B/OyinL0AmMgWY=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:00 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:00 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 09/14] usb: dwc2: Update dwc2_handle_usb_suspend_intr
 function.
Thread-Topic: [PATCH v1 09/14] usb: dwc2: Update dwc2_handle_usb_suspend_intr
 function.
Thread-Index: AQHU9qKG+ViDfaby7kumU8hq4kl1Pg==
Date:   Fri, 19 Apr 2019 11:24:59 +0000
Message-ID:
 <edf4726d21dd5a00013e5c26ac783906bc589d4d.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0020.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::30) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13fc5cb1-9a98-4e33-905b-08d6c4b9a78c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB238362702D7F77B21552C5ACA7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(15650500001)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Li5dmg81pcBgpjWhTdvTGRMy1mlBw24LlBuGvHq+FX9+OsKZ7DAYqn9Awc2R0XQiNt97IpRKKlF7uII2mDfp+ZTzVRJTnxzLQfpaaWExWDdQww7RmRAT75aaPvSL7DyIZv9ki44t2XmCXiFm2+/QiY9KUlUR1EmU9OcJJUQndBxOtdJnYu3BxflDYCyOEHxc7ry3roHBqlD979Jw4XaTwV5pTo6uGuI2UJ/u+YDtl+5Av+ueNFrbYEQ0UxhwuJzwM3so6w63uxzZ0ntF2A5ejmXX7IiAvSw+pHAUVMBelSoEk1QzalDfTlyfw5eaKVAzBIYqjk/pC8H4ye1r5pgBobYhn2aWVSx8oIt84cP3AS50kv2U/EOx/NpPascE0pW5HUWgKyu6Ih61Lf9e3L3Gr6vLCfJAN0USVfax4FpwHII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fc5cb1-9a98-4e33-905b-08d6c4b9a78c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:59.8389
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
Message-ID: <20190419112459.i1_zwqAWuzT4Q0odXublkSztKecG_8B09nHqaTEJD5E@z>

VG8gYXZvaWQgd29ya2luZyBpbiB0d28gbW9kZXMgKHBhcnRpYWwgcG93ZXIgZG93bg0KYW5kIGhp
YmVybmF0aW9uKSBjaGFuZ2VkIGNvbmRpdGlvbnMgZm9yIGVudGVyaW5nDQpwYXJ0aWFsIHBvd2Vy
IGRvd24gb3IgaGliZXJuYXRpb24uDQoNCkluc3RlYWQgb2YgY2hlY2tpbmcgaHdfcGFyYW1zLnBv
d2VyX29wdGltaXplZCBhbmQNCmh3X3BhcmFtcy5oaWJlcm5hdGlvbiBub3cgY2hlY2tpbmcgcG93
ZXJfZG93bg0KcGFyYW0gd2hpY2ggYWxyZWFkeSBzZXQgdG8gb25lIG9mIHRoZSBvcHRpb25zDQoo
SGliZXJuYXRpb24gb3IgUGFydGlhbCBQb3dlciBEb3duKSBiYXNlZCBvbg0KT1RHX0VOX1BXUk9Q
VC4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9zeWFuIDxhcnR1cnBAc3lub3BzeXMuY29t
Pg0KU2lnbmVkLW9mZi1ieTogTWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+
DQotLS0NCiBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jIHwgMTMgKysrKysrKy0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jIGIvZHJpdmVycy91c2IvZHdjMi9j
b3JlX2ludHIuYw0KaW5kZXggMDZmODAyMmIxYmRiLi5mYzQ2NTcwN2I3YTEgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MyL2Nv
cmVfaW50ci5jDQpAQCAtNTE3LDE0ICs1MTcsMTUgQEAgc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVf
dXNiX3N1c3BlbmRfaW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogCQkJcmV0dXJuOw0K
IAkJfQ0KIAkJaWYgKGRzdHMgJiBEU1RTX1NVU1BTVFMpIHsNCi0JCQlpZiAoaHNvdGctPmh3X3Bh
cmFtcy5wb3dlcl9vcHRpbWl6ZWQpIHsNCisJCQlzd2l0Y2ggKGhzb3RnLT5wYXJhbXMucG93ZXJf
ZG93bikgew0KKwkJCWNhc2UgRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUw6DQogCQkJCXJl
dCA9IGR3YzJfZW50ZXJfcGFydGlhbF9wb3dlcl9kb3duKGhzb3RnKTsNCiAJCQkJaWYgKHJldCkg
ew0KIAkJCQkJaWYgKHJldCAhPSAtRU5PVFNVUFApDQogCQkJCQkJZGV2X2Vycihoc290Zy0+ZGV2
LA0KIAkJCQkJCQkiJXM6IGVudGVyIHBhcnRpYWxfcG93ZXJfZG93biBmYWlsZWRcbiIsDQogCQkJ
CQkJCV9fZnVuY19fKTsNCi0JCQkJCWdvdG8gc2tpcF9wb3dlcl9zYXZpbmc7DQorCQkJCQlicmVh
azsNCiAJCQkJfQ0KIA0KIAkJCQl1ZGVsYXkoMTAwKTsNCkBAIC01MzIsMTYgKzUzMywxNiBAQCBz
dGF0aWMgdm9pZCBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9pbnRyKHN0cnVjdCBkd2MyX2hzb3Rn
ICpoc290ZykNCiAJCQkJLyogQXNrIHBoeSB0byBiZSBzdXNwZW5kZWQgKi8NCiAJCQkJaWYgKCFJ
U19FUlJfT1JfTlVMTChoc290Zy0+dXBoeSkpDQogCQkJCQl1c2JfcGh5X3NldF9zdXNwZW5kKGhz
b3RnLT51cGh5LCB0cnVlKTsNCi0JCQl9DQotDQotCQkJaWYgKGhzb3RnLT5od19wYXJhbXMuaGli
ZXJuYXRpb24pIHsNCisJCQkJYnJlYWs7DQorCQkJY2FzZSBEV0MyX1BPV0VSX0RPV05fUEFSQU1f
SElCRVJOQVRJT046DQogCQkJCXJldCA9IGR3YzJfZW50ZXJfaGliZXJuYXRpb24oaHNvdGcsIDAp
Ow0KIAkJCQlpZiAocmV0ICYmIHJldCAhPSAtRU5PVFNVUFApDQogCQkJCQlkZXZfZXJyKGhzb3Rn
LT5kZXYsDQogCQkJCQkJIiVzOiBlbnRlciBoaWJlcm5hdGlvbiBmYWlsZWRcbiIsDQogCQkJCQkJ
X19mdW5jX18pOw0KKwkJCQlicmVhazsNCiAJCQl9DQotc2tpcF9wb3dlcl9zYXZpbmc6DQorDQog
CQkJLyoNCiAJCQkgKiBDaGFuZ2UgdG8gTDIgKHN1c3BlbmQpIHN0YXRlIGJlZm9yZSByZWxlYXNp
bmcNCiAJCQkgKiBzcGlubG9jaw0KLS0gDQoyLjExLjANCg0K
