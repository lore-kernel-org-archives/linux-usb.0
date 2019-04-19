Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6020C282E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A295E2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RCvUu1Dj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="ElYkml02"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfDSUF4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:56 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36826 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727772AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99643C11DC;
        Fri, 19 Apr 2019 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673021; bh=4otSVf7CNR/jSoJVB64NRcDq78RaNS4vLvZcpT5/eLY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RCvUu1DjIouvnIG20Pzxa15UIh2k1o8208y/va/K2e3AKr9v266Q+hbZ8DCOHNIux
         /P6wfO/nSiPKPA+rN7MPzUt9K6xcy5o3S0S1xCFbwhhi77SvZGHUIZQDlNFqKr9RJJ
         UKvSNRQFhO2iUKGIhYX5pUQTf49X8LeconOBYH8OEFLY+NPM0+0+zV1Xna+bcTC2Qo
         N7VjMI08j3FFmReKtkKXqkvYzQhUqnafcU+s5AobD/Yg6uRO0FetxacvSw8OPzM0/0
         nmjAFgezjZbu8yjSNXftmJQCE7NrpJGgaabqLI9QfknXLHV6A34m0lrRYAcP80mEqb
         XGJfOFexZ5SXg==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9F718A005D;
        Fri, 19 Apr 2019 11:23:40 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:23:40 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4otSVf7CNR/jSoJVB64NRcDq78RaNS4vLvZcpT5/eLY=;
 b=ElYkml029QFC0CMFVRFmxeY5vEBxJlBqrO684cugNPxqmbcvSSC8akuVDhLaOMEfp6gn9hiS6NBzHNnMHkSsLOts19cTuXOyvReMAdZgDnAWwHx3BZcQ0lbcYIepsFcGFQ7qw0enLzOCgqE4pLS2jKS2WhCJXf2AGCDQj8EVxH8=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:23:38 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:23:38 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Topic: [PATCH v1 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Index: AQHU9qJViva8c9pip0a6uXug+iCvxA==
Date:   Fri, 19 Apr 2019 11:23:38 +0000
Message-ID:
 <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:802:2::27) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f530c2a6-bb82-41c8-7c92-08d6c4b9778b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383C54B35494B107147F812A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DqG2QCHwfADa3ykflfecRnJBOYErasBVnLQpF8Cb9CSeLV+SMtu/9OqPf5+BAZbFHdcrafy/V34WlVvIyySwW5fapGf+iUS3HnE2LFFOMJ3uZNpP3niCJK9POmKwVsQk6oTMU16XwXTqzgtcjj2dlCPn3he7WKEkWspvT2I7yJF26up00Ylyo5bFF7zqKCC0iMPc1c8d2HBRfESCyG9mSgFpXW+nO8GYFDB/CegRgHbVKPSujFu0cPxDMlypiiV3sXcIqr/WZ2/fD3/fdDxzrpYKKw0fCAiwtHEpDot7p9NEMKWxvveKqp72LvO5QLD5mWzsnaATk5pjAb/GuJQAddbudV0aFrbJHuvcuT0nvveMH0iFAoIacMYI3APv4t43+Asolzz679P1GIK4hbn9+X5ZKYhWByAIKIA5SN5xFUE=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f530c2a6-bb82-41c8-7c92-08d6c4b9778b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:23:38.5556
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
Message-ID: <20190419112338.KdAa6Gfgg4RpCA077bDxd7a0pfSnQ_YJVGZp1Cv5Bdc@z>

LSBBZGRlZCBiYWNrdXAgb2YgRENGRyByZWdpc3Rlci4NCi0gQWRkZWQgU2V0IHRoZSBQb3dlci1P
biBQcm9ncmFtbWluZyBkb25lIGJpdC4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIgUGV0cm9zeWFu
IDxhcnR1cnBAc3lub3BzeXMuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyB8
IDEwICsrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2Fk
Z2V0LmMNCmluZGV4IDY4MTJhOGEzYTk4Yi4uZGNiMGZiYjhiYzQyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy91c2IvZHdjMi9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0K
QEAgLTUwMDQsNiArNTAwNCw3IEBAIGludCBkd2MyX3Jlc3RvcmVfZGV2aWNlX3JlZ2lzdGVycyhz
dHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGludCByZW1vdGVfd2FrZXVwKQ0KIHsNCiAJc3RydWN0
IGR3YzJfZHJlZ3NfYmFja3VwICpkcjsNCiAJaW50IGk7DQorCXUzMiBkY3RsOw0KIA0KIAlkZXZf
ZGJnKGhzb3RnLT5kZXYsICIlc1xuIiwgX19mdW5jX18pOw0KIA0KQEAgLTUwMTksNiArNTAyMCwx
NSBAQCBpbnQgZHdjMl9yZXN0b3JlX2RldmljZV9yZWdpc3RlcnMoc3RydWN0IGR3YzJfaHNvdGcg
Kmhzb3RnLCBpbnQgcmVtb3RlX3dha2V1cCkNCiAJaWYgKCFyZW1vdGVfd2FrZXVwKQ0KIAkJZHdj
Ml93cml0ZWwoaHNvdGcsIGRyLT5kY3RsLCBEQ1RMKTsNCiANCisJaWYgKGhzb3RnLT5wYXJhbXMu
cG93ZXJfZG93biA9PSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fUEFSVElBTCkgew0KKwkJZHdjMl93
cml0ZWwoaHNvdGcsIGRyLT5kY2ZnLCBEQ0ZHKTsNCisNCisJCS8qIFNldCB0aGUgUG93ZXItT24g
UHJvZ3JhbW1pbmcgZG9uZSBiaXQgKi8NCisJCWRjdGwgPSBkd2MyX3JlYWRsKGhzb3RnLCBEQ1RM
KTsNCisJCWRjdGwgfD0gRENUTF9QV1JPTlBSR0RPTkU7DQorCQlkd2MyX3dyaXRlbChoc290Zywg
ZGN0bCwgRENUTCk7DQorCX0NCisNCiAJZHdjMl93cml0ZWwoaHNvdGcsIGRyLT5kYWludG1zaywg
REFJTlRNU0spOw0KIAlkd2MyX3dyaXRlbChoc290ZywgZHItPmRpZXBtc2ssIERJRVBNU0spOw0K
IAlkd2MyX3dyaXRlbChoc290ZywgZHItPmRvZXBtc2ssIERPRVBNU0spOw0KLS0gDQoyLjExLjAN
Cg0K
