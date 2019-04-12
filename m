Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B20C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 363C72064A
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QtOLECY4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="NU7/IieP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfDLNjJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:39:09 -0400
Received: from smtprelay.synopsys.com ([198.182.60.111]:41180 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbfDLNjJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:39:09 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 4633010C27BD;
        Fri, 12 Apr 2019 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076349; bh=mDfjAdqkxm57zYxGNUScbQgq9XZasF4HeMVlaQdfjyE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QtOLECY4tYsLehowTjYWDkS6Aa8ior3B2SPxgDS+Vm+v0v4ahuiV0/O01qszbEyXd
         Oep1xKO87fpQHGWP47LXouJyzHUbRL2OEjPB58iI4aLRKZYEcExh7OnW9lXp410+Em
         mNd1OfVfJK/GN4D4ddQZYqUrW3YmOhTmImX8dIloQ4n9NfqrDUUqPtz9vJ65aCNRde
         WTmKNG/XU1CJP2rZOATyIDX2+s7nlxxjfTL104nsC+NTqVjZ5zSDxE3aNxryT9n4jH
         eCPop4ozYQtmpYvX76aLaAGMS3P2KOdkDyH6MPgxa/IiA1A8iJMGWUrkTSydPOh1LI
         GkiK/kXmq8WiA==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A4CFA006D;
        Fri, 12 Apr 2019 13:39:08 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:39:08 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:39:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDfjAdqkxm57zYxGNUScbQgq9XZasF4HeMVlaQdfjyE=;
 b=NU7/IieP1G8AoTtpUA3BrAXz8EDqIOFdQaKyrBsVzC2XX3nzaYrTOuerHegrMRx1PZRJ3RJs7KZSJu3z/ONQ08nzia02Xr1KIptvxgcErWp0wCW4LbeQv8eA+1aDB3BPdPxrVFpdLmHRplr7hnacIVGNT7kh0CCtuMizZdoc1+k=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0589.namprd12.prod.outlook.com (10.163.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Fri, 12 Apr 2019 13:39:06 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:39:06 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 04/14] usb: dwc2: Fix suspend state in host mode for partial
 power down.
Thread-Topic: [PATCH 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
Thread-Index: AQHU8TUZtGehzOo8WEyS5m7LdiRsOg==
Date:   Fri, 12 Apr 2019 13:39:06 +0000
Message-ID:
 <88aedc90b7b786cbfbfb80a84abbf707b5777c12.1555075928.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0092.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::18) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9292e4a-d505-4d92-6c32-08d6bf4c3b5b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0589;
x-ms-traffictypediagnostic: SN1PR12MB0589:
x-microsoft-antispam-prvs: <SN1PR12MB0589D7A80A8A0BF4B4056705A7280@SN1PR12MB0589.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(39840400004)(136003)(189003)(199004)(52116002)(256004)(76176011)(110136005)(81156014)(68736007)(2906002)(316002)(8936002)(99286004)(54906003)(81166006)(25786009)(86362001)(7736002)(106356001)(305945005)(97736004)(8676002)(71200400001)(478600001)(71190400001)(4326008)(107886003)(118296001)(14454004)(186003)(2501003)(105586002)(476003)(446003)(26005)(66066001)(486006)(15650500001)(386003)(5660300002)(3846002)(6506007)(6512007)(2616005)(6486002)(11346002)(36756003)(6436002)(53936002)(14444005)(6116002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0589;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pjqlSV3+T/C0fJ0ou0zkoTlWGGXFsZ1TLGUGagtCPfvNahTiSkEg+DBPuFbX3fZbEyTrW9qILIS+VTy/zljEFbLcq3zkTS45y/bmFe0HcrBBk6NSuFxXJAuSTmtJrvELr5/RB3/++G1F195iYQmHTiUarNURKvWP8oE61R8yKyrv7W4ZlQTdmN5+69UMCDU6urqvFWaOZLk6MUlEVo5gLndZ8CislwlkLmeXlJb7s+uVgVTReNsE0mMmCfgvOqH6gQ45UK582t/9tnOYtL7y6C5YB46UaFgxUG6ACwcVWOsAUJnT2XUV6mM3OTbpjpcRuYbFE0CDRgUTZzYmsop4obdU8XQGLn7moLXS2/6o2fJtgJKWgEePAIvd9YTIS0GylCK2GmA/dgUi0L79YozhktKCmn0ERv8NO2cLffI6j2s=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9292e4a-d505-4d92-6c32-08d6bf4c3b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:39:06.6670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0589
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412133906.0-QC0N25WVWLptJB1huzZnHWBf0mqP9-_QM2Y1buvUk@z>

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
