Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA225C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A2F020645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FQEEbvyX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="QQavyk0Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfDSSxP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:15 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37882 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728517AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D41B4C0AE2;
        Fri, 19 Apr 2019 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673060; bh=2lhgBLvaIPkRZOt9UI2QbxNBZj29AWGnNMoRlexj8dQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=FQEEbvyXcT0EqfZj7qiffvmuYzlKpU+j2Jpf4ERZ/VG5lBZa/OIbusH8L3KA6/mYl
         QTvKdmB4qfevGyxl5nZ8ZmSppoy6I3WElA15/FTzWG00PzGgYKxXKgPxGqymocdNyT
         MWPpI0Ux/5mzhwMmlYYvrmpyI7kClQqhnGs4NPcEcvJjpuzdolVV+K4rijg5Bs7HPQ
         XZxmDybj/tgIJ9fIKLu7w54os8cAzov5dBgnz1rqoBkwIZ3hRUP5zTjrLXMnnvvMFy
         6rjIgU/WmB/UtOYNLTj8UwO6Ak3gMl/85nKtvB/xtKxRG74Uq2eqwS6YAJFs8t5jtc
         uroqN+kTfoFkw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DED75A0067;
        Fri, 19 Apr 2019 11:24:20 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:20 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lhgBLvaIPkRZOt9UI2QbxNBZj29AWGnNMoRlexj8dQ=;
 b=QQavyk0YPWF/hh1kSaVoGha1jEn9c9Mchijl59UYeARnbRKZpf88emQM86eaJoehhF/mC+iKQ/llxEUIEqzsBJfapjZd4aA9qkLN1Nv+pXnEi7FFBwOIz654Eh4DEzG2QgRvZPPcoEPv3KgWjisxSAFaYoDdG85/C9Fzh8qcqu4=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:24:19 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:24:19 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 05/14] usb: dwc2: Add port conn. sts. checking in
 _dwc2_hcd_resume() function.
Thread-Topic: [PATCH v1 05/14] usb: dwc2: Add port conn. sts. checking in
 _dwc2_hcd_resume() function.
Thread-Index: AQHU9qJtnV9CkqFmy0auvIy58fBMvw==
Date:   Fri, 19 Apr 2019 11:24:18 +0000
Message-ID:
 <ac07dae6922ad0110dbecffcab1dc495ce6a6cbc.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7351ef1c-f3b3-4ec5-0612-08d6c4b98f84
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383519AECDE45D2B74ACE30A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: krFTt6pk+agd0vZnigVnyV/jE3feW3qbOywCMmVBz1OjU9Zq1hDPxEZMb0N+lrbxxpYCGX1Qs2YSfcr0IV4RFRgFhzUbCaF6SjtGr746+4PbJ4SJhe+9VmdfK/8lZuoN6GEwrp6vUhkKfLfIc+63MRAskUJIYi62WyR4YHGzMjDoUkoHnEGuXcr5YevoDf9JIjWKEuJHL5Imgoq4zDkCfQhZeagoxve+JUQ1UVgFAZ2PSrpZLgs+9QAwiq2OISRQBz5qEiNqmn9dnJ9LLcC7sK3AieU4cMwcldMofqpwnZqsrqdkW43n4n8bXs0UgqnFetJr0PCXVHBM50d4goNyvUj5rrnAx2anZDszZH1fXdZ29EPK/6cuvVcjozYIJyJMEwmYqIgry+pGkY9/thxJIf7RDEoEiHCh8KhnHiVIW04=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351ef1c-f3b3-4ec5-0612-08d6c4b98f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:18.8371
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
Message-ID: <20190419112418.6UD0zC38AMfjZJXxdmOJ--BaUmdLf0fgwnTQ3GxwtsM@z>

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
