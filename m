Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B953C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1936F2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EOWDA+Sa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="e++zA42Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfDSUFw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:52 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36748 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726613AbfDSUFv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:51 -0400
X-Greylist: delayed 4200 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Apr 2019 16:05:51 EDT
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF69AC11FC;
        Fri, 19 Apr 2019 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673031; bh=LU2gAx+I/X/6jnrfYmmbpVF2WfkmeV+jJefdKmYPfRY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EOWDA+Sa0xbor7fzn6/1/i61ecg74Fw683gonHqU597F4YA4688iQ/A1IapnJXiyI
         xQR4sm+sdfNSlKXLu71xZQV15mMzGzRg5sZy5cAcSZJUj6XPyNCV9WYPknbCZB/ffd
         DaDuvVODmlitX/mZ32Jk1zNBJa9/suCqhhLP2l+utatAgjNEsRmWelnp9qKFOv0AO0
         FFLezVsWnmbRKNHkd5maxlAjt0v70j99h8TjUCyag4SL+tINRjIhl7fOqAttgTVLGw
         CU0E6bXWhIIFyvU1g3xPFiCBVzHhuGH4p9y+bme5o6w/KZA/QG/mPq6urSAfeYCoWp
         B1Wa2q5ne01zQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 00260A0067;
        Fri, 19 Apr 2019 11:23:50 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:23:50 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:23:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU2gAx+I/X/6jnrfYmmbpVF2WfkmeV+jJefdKmYPfRY=;
 b=e++zA42YTukcwl6xGzvogT9tMk8nBXAbvHuhqu1PXUqKcjART5eYJ1/2CArjgm7uHqBXqCqnrSJwhpYOm61dz7SLXNYZX6t5zIFIrPRioE5vq840lFpms/szrQpVowvre1xQoa+UcvcjI4UvMckMyk8kCIwOaICe723Ir+vG+QQ=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:23:49 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:23:49 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 02/14] usb: dwc2: Add descriptive debug messages for
 Partial Power Down mode.
Thread-Topic: [PATCH v1 02/14] usb: dwc2: Add descriptive debug messages for
 Partial Power Down mode.
Thread-Index: AQHU9qJbMt4z0jfUYU6R0vL7ABrJ0w==
Date:   Fri, 19 Apr 2019 11:23:48 +0000
Message-ID:
 <819a32be398efe3d3682d880a392a1fa54cde9df.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:802:14::41) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ffbee0b-7866-43a9-dd5f-08d6c4b97dbd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383F3FFEDA2653B58F46F43A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(15650500001)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yt+5TZMCasbkvSbzuTb2gYOncJAe7PzAdPOu+OYGgjXKYL1+bQBHtngIupAz4YWebCYczSc+NuhUSe79aEropJEaKAE7fSU+/mMVPi2RXPfBTmkytV7puuo5qYlLhJMoruUboGVDwD0XOOWuGygBX2acSh448K5BbIrl5ZBnsDPNbP8zjtIe4QBtNPPzOUi0nMCxEgBLtbxJ8P+M42aW4XrqBZSvpA1scrcnj/mpHEvNqhr7HJbl0WAhPj5OaMXJo36vtfoTOnsfpNSovVBN41oBfRH7BT1xODxjpu0vmm51stq2a72Y+N1JUz4zFXXeQB5IjrOb7JCtALoDmRNB+PEL0XXlzsiX47wT/f4+zFJirdS3WP37yXT6PrFL+YWcMCEccqb/5VV3xXpFeA63NLp1cZIrnAMhdcYX3BhOFZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffbee0b-7866-43a9-dd5f-08d6c4b97dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:23:48.9371
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
Message-ID: <20190419112348.iEPTA_7efHrR_tGiLL6e8_En6umCpNiRwBREyT1UNqs@z>

QWRkZWQgZGV2X2RiZygpIG1lc3NhZ2VzIHdoZW4gZW50ZXJpbmcgYW5kIGV4aXRpbmcgZnJvbQ0K
cGFydGlhbCBwb3dlciBkb3duLiBJdCBpcyBub3cgbW9yZSB2aXNpYmxlIHdoZW4gY29yZQ0KZW50
ZXJzIHBhcnRpYWwgcG93ZXIgZG93biBhbmQgd2hlbiBleGl0cyBmb3JtIGl0Lg0KDQpEZWJ1ZyBt
ZXNzYWdlcyBhcmUgYWRkZWQgaW4gdGhlIGZvbGxvd2luZyBmdW5jdGlvbnMuDQotIGR3YzJfZXhp
dF9wYXJ0aWFsX3Bvd2VyX2Rvd24oKQ0KLSBkd2MyX2VudGVyX3BhcnRpYWxfcG93ZXJfZG93bigp
DQoNClNpZ25lZC1vZmYtYnk6IEFydHVyIFBldHJvc3lhbiA8YXJ0dXJwQHN5bm9wc3lzLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvdXNiL2R3YzIvY29yZS5jIHwgOCArKysrKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29y
ZS5jIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlLmMNCmluZGV4IDU1ZDVhZTJhN2VjNy4uZmI0NzFk
MThhM2RlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMi9jb3JlLmMNCisrKyBiL2RyaXZl
cnMvdXNiL2R3YzIvY29yZS5jDQpAQCAtMTQxLDYgKzE0MSw4IEBAIGludCBkd2MyX2V4aXRfcGFy
dGlhbF9wb3dlcl9kb3duKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZywgYm9vbCByZXN0b3JlKQ0K
IAlpZiAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duICE9IERXQzJfUE9XRVJfRE9XTl9QQVJBTV9Q
QVJUSUFMKQ0KIAkJcmV0dXJuIC1FTk9UU1VQUDsNCiANCisJZGV2X2RiZyhoc290Zy0+ZGV2LCAi
RXhpdGluZyBvZiBQYXJ0aWFsIFBvd2VyIERvd24gc3RhcnRlZC5cbiIpOw0KKw0KIAlwY2djY3Rs
ID0gZHdjMl9yZWFkbChoc290ZywgUENHQ1RMKTsNCiAJcGNnY2N0bCAmPSB+UENHQ1RMX1NUT1BQ
Q0xLOw0KIAlkd2MyX3dyaXRlbChoc290ZywgcGNnY2N0bCwgUENHQ1RMKTsNCkBAIC0xNzgsNiAr
MTgwLDggQEAgaW50IGR3YzJfZXhpdF9wYXJ0aWFsX3Bvd2VyX2Rvd24oc3RydWN0IGR3YzJfaHNv
dGcgKmhzb3RnLCBib29sIHJlc3RvcmUpDQogCQl9DQogCX0NCiANCisJZGV2X2RiZyhoc290Zy0+
ZGV2LCAiRXhpdCBQYXJ0aWFsIFBvd2VyIERvd24gY29tcGxldGVzIGhlcmUuXG4iKTsNCisNCiAJ
cmV0dXJuIHJldDsNCiB9DQogDQpAQCAtMTk0LDYgKzE5OCw4IEBAIGludCBkd2MyX2VudGVyX3Bh
cnRpYWxfcG93ZXJfZG93bihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogCWlmICghaHNvdGct
PnBhcmFtcy5wb3dlcl9kb3duKQ0KIAkJcmV0dXJuIC1FTk9UU1VQUDsNCiANCisJZGV2X2RiZyho
c290Zy0+ZGV2LCAiU3RhcnQgb2YgUGFydGlhbCBQb3dlciBEb3duIGNvbXBsZXRlZFxuIik7DQor
DQogCS8qIEJhY2t1cCBhbGwgcmVnaXN0ZXJzICovDQogCXJldCA9IGR3YzJfYmFja3VwX2dsb2Jh
bF9yZWdpc3RlcnMoaHNvdGcpOw0KIAlpZiAocmV0KSB7DQpAQCAtMjM4LDYgKzI0NCw4IEBAIGlu
dCBkd2MyX2VudGVyX3BhcnRpYWxfcG93ZXJfZG93bihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcp
DQogCXBjZ2NjdGwgfD0gUENHQ1RMX1NUT1BQQ0xLOw0KIAlkd2MyX3dyaXRlbChoc290ZywgcGNn
Y2N0bCwgUENHQ1RMKTsNCiANCisJZGV2X2RiZyhoc290Zy0+ZGV2LCAiUGFydGlhbCBQb3dlciBE
b3duIGNvbXBsZXRlZFxuIik7DQorDQogCXJldHVybiByZXQ7DQogfQ0KIA0KLS0gDQoyLjExLjAN
Cg0K
