Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42652C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DAC02064A
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dNq0lv3P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="cMVwxXg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfDLNjS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:39:18 -0400
Received: from smtprelay.synopsys.com ([198.182.47.9]:58298 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbfDLNjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:39:18 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 1DCC724E3ABC;
        Fri, 12 Apr 2019 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076358; bh=2lhgBLvaIPkRZOt9UI2QbxNBZj29AWGnNMoRlexj8dQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dNq0lv3PDL0b6Z3oOnCcAYNuQeN3ycJq14eV4VfHf/9GTFCZTtC/2yTtTbRuHaEWy
         OJaDzGDqX4Qg2QGu0BFo3bpndgO+51vVYFb4BH6Va90C8H6x13E5F9JQg6gN6zJ92a
         x8VrJTWiowC8enqWCS5Yvgp3LLI75rjOBfOLef/zKuL+dJd3GfLC5BL9AtVr5RVxTd
         mw5xcRTsJTj40LDc5tLROgqREv8Mq6MbcZluGdMlbYX5smBJUWHtnocq370u67+IwP
         a7oEoErUabmpcXWiBu3oyD009zVQMzTwu2LeKnNR9WNw5wZreP/OYdSdF7Kbb1ENfb
         af8fZtvquPoNA==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 10730A009F;
        Fri, 12 Apr 2019 13:39:18 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:39:17 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:39:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lhgBLvaIPkRZOt9UI2QbxNBZj29AWGnNMoRlexj8dQ=;
 b=cMVwxXg2TzHwcGjTNyc1CzaLEy0qI3hS4FfAa2WX/oBKVt07+os8fXtYYJmsW0ehvRHVpongMBIdfYuQEWPpUtA8jA7VFEguep1sIEpT26Y80cl0/zYtjqIlLOCSy5yDyYTCKX6vm9J38elx/Nh7Y3bnix85jAQpFH8HaVKuxdE=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0589.namprd12.prod.outlook.com (10.163.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Fri, 12 Apr 2019 13:39:16 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:39:16 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 05/14] usb: dwc2: Add port conn. sts. checking in
 _dwc2_hcd_resume() function.
Thread-Topic: [PATCH 05/14] usb: dwc2: Add port conn. sts. checking in
 _dwc2_hcd_resume() function.
Thread-Index: AQHU8TUfZ5J9Tx3F1ECCKCYFp3qWiQ==
Date:   Fri, 12 Apr 2019 13:39:16 +0000
Message-ID:
 <a62d19d1de98326fbb7b39fb74f1a65bab30097b.1555075928.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR10CA0106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::35) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1843fc35-efd5-4199-3f84-08d6bf4c4147
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0589;
x-ms-traffictypediagnostic: SN1PR12MB0589:
x-microsoft-antispam-prvs: <SN1PR12MB058950C4A2A4F4400F54DEBDA7280@SN1PR12MB0589.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(39840400004)(136003)(189003)(199004)(52116002)(256004)(76176011)(110136005)(81156014)(68736007)(2906002)(316002)(8936002)(99286004)(54906003)(81166006)(25786009)(86362001)(7736002)(106356001)(305945005)(97736004)(8676002)(71200400001)(478600001)(71190400001)(4326008)(107886003)(118296001)(14454004)(186003)(2501003)(105586002)(476003)(446003)(26005)(66066001)(486006)(386003)(5660300002)(3846002)(6506007)(6512007)(2616005)(6486002)(11346002)(36756003)(6436002)(53936002)(14444005)(6116002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0589;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N3KK6puKsU8SchNrjiU13BLIXUM0L6CdEOhMvG+o1iqDj9XuojUjJCCg48Tsh9cFkpOUTyrfjuP3Pc3nFIb0OHrGj6iTYywlTEfkj60myejDqH61D+dZ+fDNgxzYZFudsZDb+DNougQjbqTk+7z7SNxisdNJi/AcJ+u0kwmVPoUVcU2Gzwg5sX0BZupxjdY+84r4Lz6v/TPJSnm/FLEXq9nYWxMguAE3IswJtlI9lQTVl2srRdnWsThiaQVaArlZ+a9U1ISGtHEBaxpg5OGgMb8rWkTTKOo7sUMxbLfnUr9ZxMVa3eGho0XEu6JO3qy51oNWB08qYvwiV/6LAzPV8p++ooZCDwsrqCwL4s12VjCRV2GsQlm11oC787A1TeWi+STJRALf5NCAkZOqlGjnOh9h58ibodhB8D35URvAiig=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1843fc35-efd5-4199-3f84-08d6bf4c4147
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:39:16.5690
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
Message-ID: <20190412133916.ZZTgIbHHkHqptWtzf1ScD-6IzbVpHCSK54VXW020bQY@z>

QWRkZWQgcG9ydCBjb25uZWN0aW9uIHN0YXR1cyBjaGVja2luZyB3aGljaCBwcmV2ZW50cyBleGl0
aW5nIGZyb20NClBhcnRpYWwgUG93ZXIgRG93biBtb2RlIGZyb20gX2R3YzJfaGNkX3Jlc3VtZSgp
IHdoZW4gbm8gZW50ZXJpbmcNCnRvIFBhcnRpYWwgUG93ZXIgRG93biBtb2RlIGhhcHBlbmVkLg0K
DQpTaWduZWQtb2ZmLWJ5OiBBcnR1ciBQZXRyb3N5YW4gPGFydHVycEBzeW5vcHN5cy5jb20+DQot
LS0NCiBkcml2ZXJzL3VzYi9kd2MyL2hjZC5jIHwgNiArKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MyL2hjZC5jIGIvZHJpdmVycy91c2IvZHdjMi9oY2QuYw0KaW5kZXggMWQxODI1OGI1ZmY4
Li44MzY3OTAyYTQ3ZWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQpAQCAtNDU0NCw2ICs0NTQ0LDkgQEAgc3RhdGljIGlu
dCBfZHdjMl9oY2RfcmVzdW1lKHN0cnVjdCB1c2JfaGNkICpoY2QpDQogCXN0cnVjdCBkd2MyX2hz
b3RnICpoc290ZyA9IGR3YzJfaGNkX3RvX2hzb3RnKGhjZCk7DQogCXVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQogCWludCByZXQgPSAwOw0KKwl1MzIgaHBydDA7DQorDQorCWhwcnQwID0gZHdjMl9yZWFk
X2hwcnQwKGhzb3RnKTsNCiANCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmhzb3RnLT5sb2NrLCBmbGFn
cyk7DQogDQpAQCAtNDU1Myw3ICs0NTU2LDggQEAgc3RhdGljIGludCBfZHdjMl9oY2RfcmVzdW1l
KHN0cnVjdCB1c2JfaGNkICpoY2QpDQogCWlmIChoc290Zy0+bHhfc3RhdGUgIT0gRFdDMl9MMikN
CiAJCWdvdG8gdW5sb2NrOw0KIA0KLQlpZiAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duICE9IERX
QzJfUE9XRVJfRE9XTl9QQVJBTV9QQVJUSUFMKSB7DQorCWlmIChoc290Zy0+cGFyYW1zLnBvd2Vy
X2Rvd24gIT0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUwgfHwNCisJICAgIGhwcnQwICYg
SFBSVDBfQ09OTlNUUykgew0KIAkJaHNvdGctPmx4X3N0YXRlID0gRFdDMl9MMDsNCiAJCWdvdG8g
dW5sb2NrOw0KIAl9DQotLSANCjIuMTEuMA0KDQo=
