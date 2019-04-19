Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0C1C282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EA35217F9
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lxf5zJhP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="QLAdtW8R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbfDSUFw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:52 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36768 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727648AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E32FC1204;
        Fri, 19 Apr 2019 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673051; bh=mDfjAdqkxm57zYxGNUScbQgq9XZasF4HeMVlaQdfjyE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lxf5zJhPy03d/HFG0ogt6HcnIFTkpqjNZ0wD0We7qdduMjCk+/GBUQ8ne9Gb5mNSm
         svAaM4Mi4+agvGigucyB8Z8J+svA2h0O507k+sET0LcQu3HsLcrB5ruNP5jvAJ3CXU
         8ftQuSqTvnc/6tb/rUjxfoy+Ug5FK+t6rXmkBRqLIb06VB25KuC/L4BAKePsBv/xQa
         B9JEdt0kvfDmy1BTMrBuy6hw1cawMrzXmYr5qbsNjrwMhqF3pA/8xo9e2Hpz5NzJuX
         1Y9riIWdIygqf3XwFtP6lN7SK2XVUAKvu/bpGF+3MYYY+ViRW4IXqV5JA3FtCPeApQ
         A2QO1YQWZVikw==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9711EA0096;
        Fri, 19 Apr 2019 11:24:10 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:10 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDfjAdqkxm57zYxGNUScbQgq9XZasF4HeMVlaQdfjyE=;
 b=QLAdtW8RpqC+TynmpOxThHaks+lS7qXHhWlYAGwlCqynnQLoIIDMZrNSsEorFxlGwcZaFCQ4sp84Ay1uUT12QkjNl8492uFLi4l2kezXsSadReDIBEuSFX6M2+H6EwOebxnu2hhUqWfsuMECqSMv5FbehDiNm/JzXnWJk/pd5J0=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:24:08 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:24:08 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
Thread-Topic: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
Thread-Index: AQHU9qJndp/MtkcCnkCl/ua6u6qX5g==
Date:   Fri, 19 Apr 2019 11:24:08 +0000
Message-ID:
 <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR02CA0049.eurprd02.prod.outlook.com
 (2603:10a6:802:14::20) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58d3cdbc-b86d-467d-a049-08d6c4b98956
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383079E942E4A746F514DE2A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(15650500001)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v37jbZOe+wBG6RU87uMpVFSbg+czv1/zwYNIuWe9QSNqktAEaLCwxmACAVr/lQeLrCQ3dFgLajCIMe88lMgSjyYWUzAyxogbW7qGzXx3SDorj4APjNtQlsvZexsCWsU+Kcxsm6LVB/z+isNQJ9ep2FVTihHBxxg7YXapLdce6/G97NEt/LDmlHGRvD5n7bxF4Ajp1k5uxPWTcwlb7j3PqFHdMa4CU6JF3R9QEEinZA97sTbMsmVDiap0DD8GWuWBirc2iGkKs0iueT9nbd+Q37L/ue0oZH0vP4glwrL++YsALeucYj/oo5a3RavEhCITXHDzP0+At2YT9GNdOLJpvbEi7E/ff1WGlp5sH5M2Y7raqqjqsxTBM8tILLsxhEW44H4XPIv4ZVTeklCKBLi+Wh7CRl0+bnnKXZretD5lgw4=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d3cdbc-b86d-467d-a049-08d6c4b98956
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:08.3892
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
Message-ID: <20190419112408.b5hJm6QFzhw963BZ1GWsCGA25eWLwjXn3fczj-xFkBY@z>

LSBJbiBkd2MyX3BvcnRfc3VzcGVuZCgpIGZ1bmN0aW9uIGFkZGVkIHdhaXRpbmcgZm9yIHRoZQ0K
ICBIUFJUMC5QcnRTdXNwIHJlZ2lzdGVyIGZpZWxkIHRvIGJlIHNldC4NCg0KLSBJbiBfZHdjMl9o
Y2Rfc3VzcGVuZCgpIGZ1bmN0aW9uIGFkZGVkIGNoZWNraW5nIG9mDQogICJoc290Zy0+ZmxhZ3Mu
Yi5wb3J0X2Nvbm5lY3Rfc3RhdHVzIiBwb3J0IGNvbm5lY3Rpb24NCiAgc3RhdHVzIGlmIHBvcnQg
Y29ubmVjdGlvbiBzdGF0dXMgaXMgMCB0aGVuIHNraXBwaW5nDQogIHBvd2VyIHNhdmluZyAoZW50
ZXJpbmcgcGFydGlhbCBwb3dlciBkb3duIG1vZGUpLg0KICBCZWNhdXNlIGlmIHRoZXJlIGlzIG5v
IGRldmljZSBjb25uZWN0ZWQgdGhlcmUgd291bGQNCiAgYmUgbm8gbmVlZCB0byBlbnRlciBwYXJ0
aWFsIHBvd2VyIGRvd24gbW9kZS4NCg0KLSBBZGRlZCAiaHNvdGctPmJ1c19zdXNwZW5kZWQgPSB0
cnVlIiBiZWNldXNlIGFmdGVyDQogIGVudGVyaW5nIHBhcnRpYWwgcG93ZXIgZG93biBpbiBob3N0
IG1vZGUgdGhlDQogIGJ1c19zdXNwZW5kZWQgZmxhZyBtdXN0IGJlIHNldC4NCg0KU2lnbmVkLW9m
Zi1ieTogQXJ0dXIgUGV0cm9zeWFuIDxhcnR1cnBAc3lub3BzeXMuY29tPg0KLS0tDQogZHJpdmVy
cy91c2IvZHdjMi9oY2QuYyB8IDkgKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9o
Y2QuYyBiL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCmluZGV4IGRkODJmYTUxNmYzZi4uMWQxODI1
OGI1ZmY4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYw0KKysrIGIvZHJpdmVy
cy91c2IvZHdjMi9oY2QuYw0KQEAgLTM0NzksNiArMzQ3OSwxMCBAQCBzdGF0aWMgdm9pZCBkd2My
X3BvcnRfc3VzcGVuZChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIHUxNiB3aW5kZXgpDQogCWhw
cnQwIHw9IEhQUlQwX1NVU1A7DQogCWR3YzJfd3JpdGVsKGhzb3RnLCBocHJ0MCwgSFBSVDApOw0K
IA0KKwkvKiBXYWl0IGZvciB0aGUgSFBSVDAuUHJ0U3VzcCByZWdpc3RlciBmaWVsZCB0byBiZSBz
ZXQgKi8NCisJaWYgKGR3YzJfaHNvdGdfd2FpdF9iaXRfc2V0KGhzb3RnLCBIUFJUMCwgSFBSVDBf
U1VTUCwgMzAwMCkpDQorCQlkZXZfd2Fybihoc290Zy0+ZGV2LCAiU3VzcGVuZCB3YXNuJ3QgZ2Vu
ZXJhdGVkXG4iKTsNCisNCiAJaHNvdGctPmJ1c19zdXNwZW5kZWQgPSB0cnVlOw0KIA0KIAkvKg0K
QEAgLTQ0ODgsNyArNDQ5Miw4IEBAIHN0YXRpYyBpbnQgX2R3YzJfaGNkX3N1c3BlbmQoc3RydWN0
IHVzYl9oY2QgKmhjZCkNCiAJaWYgKGhzb3RnLT5vcF9zdGF0ZSA9PSBPVEdfU1RBVEVfQl9QRVJJ
UEhFUkFMKQ0KIAkJZ290byB1bmxvY2s7DQogDQotCWlmIChoc290Zy0+cGFyYW1zLnBvd2VyX2Rv
d24gIT0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUwpDQorCWlmIChoc290Zy0+cGFyYW1z
LnBvd2VyX2Rvd24gIT0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUwgfHwNCisJICAgIGhz
b3RnLT5mbGFncy5iLnBvcnRfY29ubmVjdF9zdGF0dXMgPT0gMCkNCiAJCWdvdG8gc2tpcF9wb3dl
cl9zYXZpbmc7DQogDQogCS8qDQpAQCAtNDUxNCw2ICs0NTE5LDggQEAgc3RhdGljIGludCBfZHdj
Ml9oY2Rfc3VzcGVuZChzdHJ1Y3QgdXNiX2hjZCAqaGNkKQ0KIAkJZ290byBza2lwX3Bvd2VyX3Nh
dmluZzsNCiAJfQ0KIA0KKwloc290Zy0+YnVzX3N1c3BlbmRlZCA9IHRydWU7DQorDQogCS8qIEFz
ayBwaHkgdG8gYmUgc3VzcGVuZGVkICovDQogCWlmICghSVNfRVJSX09SX05VTEwoaHNvdGctPnVw
aHkpKSB7DQogCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZoc290Zy0+bG9jaywgZmxhZ3MpOw0K
LS0gDQoyLjExLjANCg0K
