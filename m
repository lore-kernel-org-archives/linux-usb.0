Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2A3C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 553702084D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 13:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LkWHbS8h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="p29d3aP2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfDLNi6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:38:58 -0400
Received: from smtprelay.synopsys.com ([198.182.60.111]:41170 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbfDLNi6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 09:38:58 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 6D48A10C21A8;
        Fri, 12 Apr 2019 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555076338; bh=oPx08AyJTpoqv0scWKB2fCluOZU2FZxMwAD3CD8Py7c=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LkWHbS8hCb8EfjZWKHxcV5zzmHmupPZCha5kEZJu8k2sqy7rDdSEKaWZjssrekXZB
         yycDZD0HmiofPU8/pP1RUViD49hJrji3PTHzVc7TjOfS7QLIY2HYu4uv8ZMUAvTyzB
         4M/+OGz1Gy7zgwBZ8F4y7HZvHhfzZJqkvKr2SGWyXebA88NEDqzH3XWmURRRn+18i3
         0oyebxc+fa4A/axHVzUZSx3q9MAO9wnIgQQBMtQOUzKKoJXTfgF2R+4Azw89gSSGZP
         jwNxIj8514tcbnwvRzOWhmxzpaN1e+YDbNkQxLVp3U0U+RdA9NfqU5W6bbXg2E7uAC
         NiwZBFn/IHNuA==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5F093A006A;
        Fri, 12 Apr 2019 13:38:58 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 06:38:58 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Apr 2019 06:38:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPx08AyJTpoqv0scWKB2fCluOZU2FZxMwAD3CD8Py7c=;
 b=p29d3aP2pNjFwNK1r/3GD1+acsgB3rjY8mcL1zK9azgKqyIv4ohs/xsfbZrue6vufDLksyAgb0CWTXq1JSikeIeF+m086C7ePhMChS7IeEwjAEtHE7szbL+h3f5TvVClCa/fNZbQHx5WqRHE/NxJ9UDRoaFju5lPOMOHrVnGgIk=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0589.namprd12.prod.outlook.com (10.163.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Fri, 12 Apr 2019 13:38:56 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1771.021; Fri, 12 Apr 2019
 13:38:56 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: [PATCH 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Thread-Topic: [PATCH 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Thread-Index: AQHU8TUTrNB2kRZJNkiYNB9jBPLdtw==
Date:   Fri, 12 Apr 2019 13:38:56 +0000
Message-ID:
 <8f99e3ceb45ede4526363bd9b44d417a6b6ff5cd.1555075928.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com>
In-Reply-To: <cover.1555075927.git.arturp@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 43e3975b-1997-430b-422b-08d6bf4c355f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0589;
x-ms-traffictypediagnostic: SN1PR12MB0589:
x-microsoft-antispam-prvs: <SN1PR12MB0589D55084233F1C866EAF1AA7280@SN1PR12MB0589.namprd12.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(39840400004)(136003)(189003)(199004)(52116002)(256004)(76176011)(110136005)(81156014)(68736007)(2906002)(316002)(8936002)(99286004)(54906003)(81166006)(25786009)(86362001)(7736002)(106356001)(305945005)(97736004)(8676002)(71200400001)(478600001)(71190400001)(4326008)(107886003)(118296001)(14454004)(186003)(2501003)(105586002)(476003)(446003)(26005)(66066001)(486006)(386003)(5660300002)(3846002)(6506007)(6512007)(2616005)(6486002)(11346002)(36756003)(6436002)(53936002)(14444005)(6116002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0589;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +9TeNfa596dU/oQ2LvU0FVgGmfa75IzBKzAhm9VAkiHvxWn0pT5Ol7dM7+0A9FIjnMegLxtKULOvIX0qPuEsLjYEsYIBhgmZi4O6fRteud1H0iH96IkPPVvPyN8gRjVf3oLIaNr8fvsFlMfz9VMCyl5ODv4MuK/BzeEehzOmzf0kh8Qv+V0PtaHsqspFzTBfudDMg2nG8kTusMnuWMWn5LqCLiAqjenjFc5CAQXgBsN1xhd6l29tmX7V3djJF1YjqNlfVuz7z1wPI3EeZ7/9RlEC1ZaDwjqvaO0zMF/Nib8wlhE3ycaeyAB92XnCLC5HB03lilnhB8ZP2yUXiGOKGKn2hXpL3Jy67SppEN4RIQi0RHTEW+uUKwBaHjKWNcDjrBsW2CyhLX0pwtcBPyTRbwKxLD1TNDDxS7Z1KVAd3M8=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e3975b-1997-430b-422b-08d6bf4c355f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 13:38:56.6158
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
Message-ID: <20190412133856.cdw_T_2yTVETWU2sdO6IoaqwMQwThpgfr1CF0F7wQaY@z>

SW4gaG9zdCBtb2RlIHBvcnQgcG93ZXIgbXVzdCBiZSB0dXJuZWQgb24gd2hlbiB3YWtldXANCmRl
dGVjdGVkIG9yIHNlc3Npb24gcmVxdWVzdCBpbnRlcnJ1cHQgaXMgZGV0ZWN0ZWQuDQpCZWNhdXNl
LCBvdGhlcndpc2UgY29yZSB3b3VsZG4ndCBleGl0IGZvcm0gcGFydGlhbA0KcG93ZXIgZG93bi4N
Cg0KLSBUdXJuZWQgb24gdGhlIHBvcnQgcG93ZXIgYnkgc2V0dGluZyBIUFJUMF9QV1IgYml0Lg0K
DQotIENhbGxlZCBkd2MyX2hjZF9jb25uZWN0KCkgZnVuY3Rpb24gYWZ0ZXIgZW5hYmxpbmcNCiAg
dGhlIHBvd2VyIG9mIHRoZSBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBBcnR1ciBQZXRyb3N5YW4g
PGFydHVycEBzeW5vcHN5cy5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2My
L2NvcmVfaW50ci5jIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlX2ludHIuYw0KaW5kZXggMTlhZTI1
OTVmMWMzLi5jZTUyM2ZkMmIxYjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVf
aW50ci5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQpAQCAtMzEyLDYgKzMx
Miw3IEBAIHN0YXRpYyB2b2lkIGR3YzJfaGFuZGxlX2Nvbm5faWRfc3RhdHVzX2NoYW5nZV9pbnRy
KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV9zZXNz
aW9uX3JlcV9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiB7DQogCWludCByZXQ7DQor
CXUzMiBocHJ0MDsNCiANCiAJLyogQ2xlYXIgaW50ZXJydXB0ICovDQogCWR3YzJfd3JpdGVsKGhz
b3RnLCBHSU5UU1RTX1NFU1NSRVFJTlQsIEdJTlRTVFMpOw0KQEAgLTMyMCw3ICszMjEsOCBAQCBz
dGF0aWMgdm9pZCBkd2MyX2hhbmRsZV9zZXNzaW9uX3JlcV9pbnRyKHN0cnVjdCBkd2MyX2hzb3Rn
ICpoc290ZykNCiAJCWhzb3RnLT5seF9zdGF0ZSk7DQogDQogCWlmIChkd2MyX2lzX2RldmljZV9t
b2RlKGhzb3RnKSkgew0KLQkJaWYgKGhzb3RnLT5seF9zdGF0ZSA9PSBEV0MyX0wyKSB7DQorCQlp
ZiAoaHNvdGctPmx4X3N0YXRlID09IERXQzJfTDIgJiYNCisJCSAgICBoc290Zy0+cGFyYW1zLnBv
d2VyX2Rvd24gPT0gMSkgew0KIAkJCXJldCA9IGR3YzJfZXhpdF9wYXJ0aWFsX3Bvd2VyX2Rvd24o
aHNvdGcsIHRydWUpOw0KIAkJCWlmIChyZXQgJiYgKHJldCAhPSAtRU5PVFNVUFApKQ0KIAkJCQlk
ZXZfZXJyKGhzb3RnLT5kZXYsDQpAQCAtMzMyLDYgKzMzNCwxNCBAQCBzdGF0aWMgdm9pZCBkd2My
X2hhbmRsZV9zZXNzaW9uX3JlcV9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiAJCSAq
IGVzdGFibGlzaGVkDQogCQkgKi8NCiAJCWR3YzJfaHNvdGdfZGlzY29ubmVjdChoc290Zyk7DQor
CX0gZWxzZSB7DQorCQkvKiBUdXJuIG9uIHRoZSBwb3J0IHBvd2VyIGJpdC4gKi8NCisJCWhwcnQw
ID0gZHdjMl9yZWFkX2hwcnQwKGhzb3RnKTsNCisJCWhwcnQwIHw9IEhQUlQwX1BXUjsNCisJCWR3
YzJfd3JpdGVsKGhzb3RnLCBocHJ0MCwgSFBSVDApOw0KKw0KKwkJLyogQ29ubmVjdCBoY2QgYWZ0
ZXIgcG9ydCBwb3dlciBpcyBzZXQuICovDQorCQlkd2MyX2hjZF9jb25uZWN0KGhzb3RnKTsNCiAJ
fQ0KIH0NCiANCkBAIC0zOTYsNiArNDA2LDcgQEAgc3RhdGljIHZvaWQgZHdjMl93YWtldXBfZnJv
bV9scG1fbDEoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KIHN0YXRpYyB2b2lkIGR3YzJfaGFu
ZGxlX3dha2V1cF9kZXRlY3RlZF9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiB7DQog
CWludCByZXQ7DQorCXUzMiBocHJ0MDsNCiANCiAJLyogQ2xlYXIgaW50ZXJydXB0ICovDQogCWR3
YzJfd3JpdGVsKGhzb3RnLCBHSU5UU1RTX1dLVVBJTlQsIEdJTlRTVFMpOw0KQEAgLTQyNiw4ICs0
MzcsNiBAQCBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV93YWtldXBfZGV0ZWN0ZWRfaW50cihzdHJ1
Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogCQkvKiBDaGFuZ2UgdG8gTDAgc3RhdGUgKi8NCiAJCWhz
b3RnLT5seF9zdGF0ZSA9IERXQzJfTDA7DQogCX0gZWxzZSB7DQotCQlpZiAoaHNvdGctPnBhcmFt
cy5wb3dlcl9kb3duKQ0KLQkJCXJldHVybjsNCiANCiAJCWlmIChoc290Zy0+bHhfc3RhdGUgIT0g
RFdDMl9MMSkgew0KIAkJCXUzMiBwY2djY3RsID0gZHdjMl9yZWFkbChoc290ZywgUENHQ1RMKTsN
CkBAIC00MzUsNiArNDQ0LDE1IEBAIHN0YXRpYyB2b2lkIGR3YzJfaGFuZGxlX3dha2V1cF9kZXRl
Y3RlZF9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiAJCQkvKiBSZXN0YXJ0IHRoZSBQ
aHkgQ2xvY2sgKi8NCiAJCQlwY2djY3RsICY9IH5QQ0dDVExfU1RPUFBDTEs7DQogCQkJZHdjMl93
cml0ZWwoaHNvdGcsIHBjZ2NjdGwsIFBDR0NUTCk7DQorDQorCQkJLyogVHVybiBvbiB0aGUgcG9y
dCBwb3dlciBiaXQuICovDQorCQkJaHBydDAgPSBkd2MyX3JlYWRfaHBydDAoaHNvdGcpOw0KKwkJ
CWhwcnQwIHw9IEhQUlQwX1BXUjsNCisJCQlkd2MyX3dyaXRlbChoc290ZywgaHBydDAsIEhQUlQw
KTsNCisNCisJCQkvKiBDb25uZWN0IGhjZC4gKi8NCisJCQlkd2MyX2hjZF9jb25uZWN0KGhzb3Rn
KTsNCisNCiAJCQltb2RfdGltZXIoJmhzb3RnLT53a3BfdGltZXIsDQogCQkJCSAgamlmZmllcyAr
IG1zZWNzX3RvX2ppZmZpZXMoNzEpKTsNCiAJCX0gZWxzZSB7DQotLSANCjIuMTEuMA0KDQo=
