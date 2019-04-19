Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB05C282E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D916D217F9
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PMAz4gdf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Rk+ps6ag"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfDSUF4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:56 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36764 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727440AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2CDD1C0AF5;
        Fri, 19 Apr 2019 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673082; bh=c9lSu9gx+b5zcFSf2ezSgxnWlP+0IC8IutC81R4Yeo0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PMAz4gdfgEDWHTadb6b6YSQF9iBmKS+F4Fs5quZu9TTNmTZ/wKG5NzixETVK9BsiU
         krwd/wLSZW63AH4UTV+43/Ozo72eujVoqpSog8WaGCG3TfguSthqnrb/53hmTYsBk7
         O4/ZzB63ByfSf6ycGONza2+29xZBMD4fH6I82LSz0bOhQ+kE4EbZEj8Tg0sbC3DbiK
         ITia0mUyhemKSlgxr0qqKaTu7oNbcyTjLOQA7YFOjsJot+i54YYLvm4VO32nlVykCF
         lwAEosa4P8N6fEXFe3fITuZxKGvRBg1/923YDP/YIYyg/+olhk5Mq5fHhIzaufxeFe
         XFkkzEAo+3j1A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7BDE6A0067;
        Fri, 19 Apr 2019 11:24:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:40 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9lSu9gx+b5zcFSf2ezSgxnWlP+0IC8IutC81R4Yeo0=;
 b=Rk+ps6agnIcEZstx3Gx7EDyRUbwdCjAsSkudnF+rIskJu8tWzV4grO417uGQAMlQ5zxjmZkhunnqsNyQ/UKNXPPGv932zMsa1AtGdv/Y6XwOJHW9+fxeGVXyF5ntQ7vkcaxDsy8GcYdxIRjAhQYHmtmW7K2M4K2jeoH1Z2P+E2M=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:24:39 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:24:39 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 07/14] usb: dwc2: Reset DEVADDR after exiting gadget
 hibernation.
Thread-Topic: [PATCH v1 07/14] usb: dwc2: Reset DEVADDR after exiting gadget
 hibernation.
Thread-Index: AQHU9qJ5n2+J+cmLvEavTwfDwgVrIA==
Date:   Fri, 19 Apr 2019 11:24:39 +0000
Message-ID:
 <15df61e95536a74b636f19ec142f27b62bb2f5e5.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::34) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c48e737d-f884-4475-5d82-08d6c4b99bb2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383061E06AF5DB3BBDAFCB7A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BtCYSjyuov1kJxWlcVTdUpjpnk724MgQ2EnvZ/xYTLZLUvgqLtr200sdLEQQE6ynUCOLbd/U67DRi3LuePHkCzjTu1WWnncK5tky5dxVQSrHfVRPu1KLH1s7bJKn+H0qwsvLB3PPWapaSGEltyUhKwbklPpJ24cyqMDE9J2kWhJpjb00+MBwlmhWMl/sSn6epaXvlEeH0/xukoiY5GGmfqOMD50rP8nauOKIY8WvYsaRSwRfKm2Jq/RGrZAV51/cEBSCa+6ymViRHjzhas7IhQZVFQ41H2ZWLymW3tuILdXr/kQPjIRR2WJoLG82HmsBOV/859ky2rg8jxHo0CPSTFibWfZR8YYbRaySWwRgOfp78Amlx+G2dlnqiLw9eWuyBnYHYfjAf7K+IMBISS2gGyBzm0YWljHBCvcpPeBRQLM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c48e737d-f884-4475-5d82-08d6c4b99bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:24:39.1994
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
Message-ID: <20190419112439.RZMApZiWe5_wCkAZBD3WP9zMSXTTeoGlc0CTW37eJXE@z>

SW5pdGlhbGx5IHJlc2V0dGluZyBkZXZpY2UgYWRkcmVzcyB3YXMgZG9uZSBpbiBkd2MyX2hzb3Rn
X2lycSgpDQppbnRlcnJ1cHQgaGFuZGxlci4gSG93ZXZlciwgd2hlbiBjb3JlIGlzIGhpYmVybmF0
ZWQgVVNCIFJFU0VUDQppcyBub3QgaGFuZGxlZCBpbiBkd2MyX2hzb3RnX2lycSgpIGhhbmRsZXIs
IGluc3RlYWQgVVNCIFJFU0VUDQppbnRlcnJ1cHQgaXMgaGFuZGxlZCBpbiBkd2MyX2hhbmRsZV9n
cHdyZG5faW50cigpIGhhbmRsZXIuDQoNCi0gQWRkZWQgcmVzZXQgZGV2aWNlIGFkZHJlc3MgdG8g
emVybyB3aGVuIGNvcmUgZXhpdHMgZnJvbSBnYWRnZXQNCiAgaGliZXJuYXRpb24uDQoNClNpZ25l
ZC1vZmYtYnk6IEFydHVyIFBldHJvc3lhbiA8YXJ0dXJwQHN5bm9wc3lzLmNvbT4NClNpZ25lZC1v
ZmYtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KLS0tDQogZHJp
dmVycy91c2IvZHdjMi9nYWRnZXQuYyB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgYi9kcml2
ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQppbmRleCBkY2IwZmJiOGJjNDIuLjhjM2UxZjFjMWIwZiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCisrKyBiL2RyaXZlcnMvdXNi
L2R3YzIvZ2FkZ2V0LmMNCkBAIC01MjM0LDYgKzUyMzQsMTAgQEAgaW50IGR3YzJfZ2FkZ2V0X2V4
aXRfaGliZXJuYXRpb24oc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnLA0KIAkvKiBSZXN0b3JlIEdV
U0JDRkcsIERDRkcgYW5kIERDVEwgKi8NCiAJZHdjMl93cml0ZWwoaHNvdGcsIGdyLT5ndXNiY2Zn
LCBHVVNCQ0ZHKTsNCiAJZHdjMl93cml0ZWwoaHNvdGcsIGRyLT5kY2ZnLCBEQ0ZHKTsNCisNCisJ
LyogT24gVVNCIFJlc2V0LCByZXNldCBkZXZpY2UgYWRkcmVzcyB0byB6ZXJvICovDQorCWlmIChy
ZXNldCkNCisJCWR3YzJfY2xlYXJfYml0KGhzb3RnLCBEQ0ZHLCBEQ0ZHX0RFVkFERFJfTUFTSyk7
DQogCWR3YzJfd3JpdGVsKGhzb3RnLCBkci0+ZGN0bCwgRENUTCk7DQogDQogCS8qIERlLWFzc2Vy
dCBXYWtldXAgTG9naWMgKi8NCi0tIA0KMi4xMS4wDQoNCg==
