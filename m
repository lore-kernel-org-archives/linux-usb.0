Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA9C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 208242084D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K5APkZfC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="gKB6eYcg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfDLNit (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:38:49 -0400
Received: from smtprelay.synopsys.com ([198.182.60.111]:41162 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfDLNit (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:38:49 -0400
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 1143310C29D9;
        Fri, 12 Apr 2019 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076329; bh=LU2gAx+I/X/6jnrfYmmbpVF2WfkmeV+jJefdKmYPfRY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=K5APkZfCvFerglCPohK4fagOhk9wu5v9cUGPqafTWWgXrFPeQJfeDQFbJ6gxZpnfL
         cJr69vScc7LAvIeX5vYveXdEAZSLrWWic9t4zgd4uaHcrShlFgO7p4UWOH4LYoYNcC
         XQnd/4kXIGhLbmbRyb5S4lG3qUzurWt5FfRVxUAchqylvbC6g+/c65Q1QB4edP9mmU
         zwlZsgst5CbN+W9qxvYp+q/ZI9Lk/h3Da5SQKMJ92xwifAzZEfugwcuj9mejYqNXmt
         gdf3ZHhpQtcPXjVLAa8O+gRn4c0NKEfycADc7H06SYuwgcmQMDnrRE/C//CfkJSMt8
         /LXGsm3iS3LQw==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D709AA0070;
        Fri, 12 Apr 2019 13:38:48 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:38:48 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:38:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU2gAx+I/X/6jnrfYmmbpVF2WfkmeV+jJefdKmYPfRY=;
 b=gKB6eYcgFlmbb0HEajlm4DlXnfQy/cw+9c5DEJzOiQcOAs7K5O5qKbF5apCvtFTHGwbPdUYUUbENYW8nl53PZnDtoEg99D3hY73c282LrfEOwUvuDH9clX+qXgPPQBmfFpeHgxl1m2VHMPRoyW8YnenBtGdls6P866VjipvdjPs=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0589.namprd12.prod.outlook.com (10.163.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Fri, 12 Apr 2019 13:38:46 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:38:46 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 02/14] usb: dwc2: Add descriptive debug messages for Partial
 Power Down mode.
Thread-Topic: [PATCH 02/14] usb: dwc2: Add descriptive debug messages for
 Partial Power Down mode.
Thread-Index: AQHU8TUNz/+9g0+U80Cc3M0UfRZsTQ==
Date:   Fri, 12 Apr 2019 13:38:46 +0000
Message-ID:
 <819a32be398efe3d3682d880a392a1fa54cde9df.1555075928.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0109.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::11) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e37b52ef-4333-44de-21e4-08d6bf4c2f35
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0589;
x-ms-traffictypediagnostic: SN1PR12MB0589:
x-microsoft-antispam-prvs: <SN1PR12MB058921BC8AD21B50C330A36EA7280@SN1PR12MB0589.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(39840400004)(136003)(189003)(199004)(52116002)(256004)(76176011)(110136005)(81156014)(68736007)(2906002)(316002)(8936002)(99286004)(54906003)(81166006)(25786009)(86362001)(7736002)(106356001)(305945005)(97736004)(8676002)(71200400001)(478600001)(71190400001)(4326008)(107886003)(118296001)(14454004)(186003)(2501003)(105586002)(476003)(446003)(26005)(66066001)(486006)(15650500001)(386003)(5660300002)(3846002)(6506007)(6512007)(2616005)(6486002)(11346002)(36756003)(6436002)(53936002)(14444005)(6116002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0589;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BPBePV28AqE+9EUW3VE9RNiak8DaluBiL2Dsluvx69G+TXq2NjUZKI9iKtkeCgxKYSChAI9VQ8Ov9dZ2L6uzly8czw2R2NXDcRiY/mvG5fEk+9bpgdfBBjnwQ/geYDBWayQjXx+T+yKSCJQQalYebPXq/sHil1QVzRzzwowSX9J0waznB5PK9s/yKEmz6UZH95oYlrfqnj1c59oyQ4AZVFDqq4JwanMB0YwRGu8IhsyuYONzQcmfIAY+InGX328fwjd6o3WMCXwYV/7PSKtIAStDDW6RS7QGWRodEo8vYQ4jqwTeJIxwEyKA+jriUFt9Yrz0HDJL9Cy6iL8SA7YZtchKfgPMRsRu/4t9hlCTmie8Gw/nXghDoUc2UF8bOJznMsGxS7L5A+984hi+Ywc9v9H44/NSWkSPs3KIlvJoAXk=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e37b52ef-4333-44de-21e4-08d6bf4c2f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:38:46.2533
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
Message-ID: <20190412133846.a3rE1BSLfNz1PrYtCyrqkj640N4M5ueYelWN484gvrk@z>

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
