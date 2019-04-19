Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A63C282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15E062171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LYcEvE0Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="pUkeG/fb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbfDSUFx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:53 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36752 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727257AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 46264C1203;
        Fri, 19 Apr 2019 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673112; bh=nHZb6BEg/sWCfZRiQSWSnGXYYMJNsG0OdKLH9KIbiEc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LYcEvE0ZkwTEKaUgFpk6qOoaQ3/WXDDQzRWn3frXnJhMtwR/gPfyL1q5/VVsO0u72
         TRi579WO0PMLCI9stvo5h2PjIjhDQ7Keygc+JJzay41hXhnZQh8dC0+XiTbkS5han2
         xR3yKHMOcpm0nl3RW+dNa1B7XKyEbbh89pZ66lNs4YTeF1dGOxN/R5u9cjwWP6gO2+
         H6RxxmCu6hTLSYCKvzMkEidhKtZTd3cvJcKl1ZkWQRf9cxIVsglV+MHs5LiFpsDDI0
         J9mKyL6WoK5GOaQHPKRjiI/ExZOTot+venhB5oPKUrMmI/8VgwpZctRW0zz+OgZZSN
         DSFZ/6L8KmcHw==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 90F99A005A;
        Fri, 19 Apr 2019 11:25:11 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:11 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHZb6BEg/sWCfZRiQSWSnGXYYMJNsG0OdKLH9KIbiEc=;
 b=pUkeG/fbitK58Up3evZn7JSfiMC3qJq1J/Gagks+arpveykb/CVFZUhjqYGQ1Mw6LCOd9Rzp36LMEyvI5BLyh63HBxImmlzwXi4caG5FQ76Tg7/vi+WoQqLaiR9YqIO5j9MJObutYpvwxndvY4Aw2veIGAgFPZtI82TjIYp1RW4=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:09 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:09 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 10/14] usb: dwc2: Fix hibernation between host and device
 modes.
Thread-Topic: [PATCH v1 10/14] usb: dwc2: Fix hibernation between host and
 device modes.
Thread-Index: AQHU9qKMWXS7HJ+dKkOk/Fgbf3TpOw==
Date:   Fri, 19 Apr 2019 11:25:09 +0000
Message-ID:
 <40708a6888d43ff5e29b5d06f0c53beda840b096.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0024.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::34) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3f5ded4-589c-43d7-e69f-08d6c4b9adca
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383795D052CF6C02997FF85A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nlNWRMRK7vZj/1LSEpHMVixggSt/9lJnfv2SaZQx9vTU7zg8b1FSCB/ZeVpLrSSUjpXu5zA875yQ/y0HtXxa1a/+kNlQLtfenPZ64N6zLwXQtxQsbey0rTR6UEyIMww5Ejvd8YvGvNDzKh4EAuuTlfGInVPjoKeZRBrD5G+ApndJSD85hss6KzuWCB7bFjfQkwq2t/EJzOmddo4BID4TrgVqO3u05UzOvu7muA9/V5mrIwm9EbJH50wxRiUXuUcPEovPHKqH30dbc34QgNklJnbzE8hcQ1lfuYDZ1i6qefZqvER1UNa1JZh8S67oMGLZrWfBcVB3VJX7UqPQ5Tc09eOrS9fampEaTbFcc1nqGH5q+MsMwpa8cdfFCbZ6xAItUh+xQCYVOLqIamre6OLvrN1oGGuoU9DTugdpYNLjDPA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f5ded4-589c-43d7-e69f-08d6c4b9adca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:25:09.6633
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
Message-ID: <20190419112509.mq61-SwJbRDdKYS3OukzYD5uW8wYb5gkh5RPMlNT1HM@z>

V2hlbiBjb3JlIGlzIGluIGhpYmVybmF0aW9uIGluIGhvc3QgbW9kZSBhbmQgYSBkZXZpY2UgY2Fi
bGUNCndhcyBjb25uZWN0ZWQgdGhhbiBkcml2ZXIgZXhpdGVkIGZyb20gZGV2aWNlIGhpYmVybmF0
aW9uLg0KSG93ZXZlciwgcmVnaXN0ZXJzIHNhdmVkIGZvciBob3N0IG1vZGUgYW5kIHdoZW4gZXhp
dGVkIGZyb20NCmRldmljZSBoaWJlcm5hdGlvbiByZWdpc3RlciByZXN0b3JlIHdvdWxkIGJlIGRv
bmUgZm9yIGRldmljZQ0KcmVnaXN0ZXIgd2hpY2ggd2FzIHdyb25nIGJlY2F1c2UgdGhlcmUgd2Fz
IG5vIGRldmljZSByZWdpc3RlcnMNCnN0b3JlZCB0byByZXN0b3JlLg0KDQotIEFkZGVkIGR3Y19o
YW5kbGVfZ3B3cmRuX2Rpc2NfZGV0KCkgZnVuY3Rpb24gd2hpY2ggaGFuZGxlcw0KICBncHdyZG4g
ZGlzY29ubmVjdCBkZXRlY3QgZmxvdyBhbmQgZXhpdHMgaGliZXJuYXRpb24NCiAgd2l0aG91dCBy
ZXN0b3JpbmcgdGhlIHJlZ2lzdGVycy4NCi0gVXBkYXRlZCBleGl0aW5nIGZyb20gaGliZXJuYXRp
b24gaW4gR1BXUkROX1NUU19DSEdJTlQgd2l0aA0KICBjYWxsaW5nIGR3Y19oYW5kbGVfZ3B3cmRu
X2Rpc2NfZGV0KCkgZnVuY3Rpb24uIEhlcmUgbm8gcmVnaXN0ZXINCiAgaXMgcmVzdG9yZWQgd2hp
Y2ggaXMgdGhlIHNvbHV0aW9uIGRlc2NyaWJlZCBhYm92ZS4NCi0gSW5jcmVhc2VkIHRoZSB3YWl0
aW5nIHRpbWVvdXQgZm9yIEhQUlQwLlBydFN1c3AgcmVnaXN0ZXIgZmllbGQNCiAgdG8gYmUgc2V0
LiBCZWNhdXNlIG9uIEhpS2V5IDk2MCBib2FyZCBIUFJUMC5QcnRTdXNwIHdhc24ndA0KICBnZW5l
cmF0ZWQgd2l0aCB0aGUgZXhpc3RpbmcgdGltZW91dC4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIg
UGV0cm9zeWFuIDxhcnR1cnBAc3lub3BzeXMuY29tPg0KU2lnbmVkLW9mZi1ieTogTWluYXMgSGFy
dXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9kd2MyL2Nv
cmVfaW50ci5jIHwgMTM5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0NCiBkcml2ZXJzL3VzYi9kd2MyL2hjZC5jICAgICAgIHwgICAyICstDQogMiBmaWxlcyBjaGFu
Z2VkLCA4MCBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5j
DQppbmRleCBmYzQ2NTcwN2I3YTEuLjQwZDI5NmQ5YjZmYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
dXNiL2R3YzIvY29yZV9pbnRyLmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMN
CkBAIC02NjIsNiArNjYyLDcwIEBAIHN0YXRpYyB1MzIgZHdjMl9yZWFkX2NvbW1vbl9pbnRyKHN0
cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiAJCXJldHVybiAwOw0KIH0NCiANCisvKioNCisgKiBU
aGlzIGZ1bmN0aW9uIGhhbmRsZXMgdGhlIGdwd3JkbiBkaXNjb25uZWN0IGRldGVjdC4NCisgKiBF
eGl0cyBoaWJlcm5hdGlvbiB3aXRob3V0IHJlc3RvcmluZyByZWdpc3RlcnMuDQorICoNCisgKiBA
aHNvdGc6IFByb2dyYW1taW5nIHZpZXcgb2YgRFdDX290ZyBjb250cm9sbGVyDQorICogQGdwd3Jk
bjogR1BXUkROIHJlZ2lzdGVyDQorICovDQorc3RhdGljIGlubGluZSB2b2lkIGR3Y19oYW5kbGVf
Z3B3cmRuX2Rpc2NfZGV0KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZywNCisJCQkJCSAgICAgIHUz
MiBncHdyZG4pDQorew0KKwl1MzIgZ3B3cmRuX3RtcDsNCisNCisJLyogU3dpdGNoLW9uIHZvbHRh
Z2UgdG8gdGhlIGNvcmUgKi8NCisJZ3B3cmRuX3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JE
Tik7DQorCWdwd3Jkbl90bXAgJj0gfkdQV1JETl9QV1JETlNXVENIOw0KKwlkd2MyX3dyaXRlbCho
c290ZywgZ3B3cmRuX3RtcCwgR1BXUkROKTsNCisJdWRlbGF5KDEwKTsNCisNCisJLyogUmVzZXQg
Y29yZSAqLw0KKwlncHdyZG5fdG1wID0gZHdjMl9yZWFkbChoc290ZywgR1BXUkROKTsNCisJZ3B3
cmRuX3RtcCAmPSB+R1BXUkROX1BXUkROUlNUTjsNCisJZHdjMl93cml0ZWwoaHNvdGcsIGdwd3Jk
bl90bXAsIEdQV1JETik7DQorCXVkZWxheSgxMCk7DQorDQorCS8qIERpc2FibGUgUG93ZXIgRG93
biBDbGFtcCAqLw0KKwlncHdyZG5fdG1wID0gZHdjMl9yZWFkbChoc290ZywgR1BXUkROKTsNCisJ
Z3B3cmRuX3RtcCAmPSB+R1BXUkROX1BXUkROQ0xNUDsNCisJZHdjMl93cml0ZWwoaHNvdGcsIGdw
d3Jkbl90bXAsIEdQV1JETik7DQorCXVkZWxheSgxMCk7DQorDQorCS8qIERlYXNzZXJ0IHJlc2V0
IGNvcmUgKi8NCisJZ3B3cmRuX3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQorCWdw
d3Jkbl90bXAgfD0gR1BXUkROX1BXUkROUlNUTjsNCisJZHdjMl93cml0ZWwoaHNvdGcsIGdwd3Jk
bl90bXAsIEdQV1JETik7DQorCXVkZWxheSgxMCk7DQorDQorCS8qIERpc2FibGUgUE1VIGludGVy
cnVwdCAqLw0KKwlncHdyZG5fdG1wID0gZHdjMl9yZWFkbChoc290ZywgR1BXUkROKTsNCisJZ3B3
cmRuX3RtcCAmPSB+R1BXUkROX1BNVUlOVFNFTDsNCisJZHdjMl93cml0ZWwoaHNvdGcsIGdwd3Jk
bl90bXAsIEdQV1JETik7DQorDQorCS8qIERlLWFzc2VydCBXYWtldXAgTG9naWMgKi8NCisJZ3B3
cmRuX3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQorCWdwd3Jkbl90bXAgJj0gfkdQ
V1JETl9QTVVBQ1RWOw0KKwlkd2MyX3dyaXRlbChoc290ZywgZ3B3cmRuX3RtcCwgR1BXUkROKTsN
CisNCisJaHNvdGctPmhpYmVybmF0ZWQgPSAwOw0KKw0KKwlpZiAoZ3B3cmRuICYgR1BXUkROX0lE
U1RTKSB7DQorCQloc290Zy0+b3Bfc3RhdGUgPSBPVEdfU1RBVEVfQl9QRVJJUEhFUkFMOw0KKwkJ
ZHdjMl9jb3JlX2luaXQoaHNvdGcsIGZhbHNlKTsNCisJCWR3YzJfZW5hYmxlX2dsb2JhbF9pbnRl
cnJ1cHRzKGhzb3RnKTsNCisJCWR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nvbm5lY3RlZChoc290
ZywgZmFsc2UpOw0KKwkJZHdjMl9oc290Z19jb3JlX2Nvbm5lY3QoaHNvdGcpOw0KKwl9IGVsc2Ug
ew0KKwkJaHNvdGctPm9wX3N0YXRlID0gT1RHX1NUQVRFX0FfSE9TVDsNCisNCisJCS8qIEluaXRp
YWxpemUgdGhlIENvcmUgZm9yIEhvc3QgbW9kZSAqLw0KKwkJZHdjMl9jb3JlX2luaXQoaHNvdGcs
IGZhbHNlKTsNCisJCWR3YzJfZW5hYmxlX2dsb2JhbF9pbnRlcnJ1cHRzKGhzb3RnKTsNCisJCWR3
YzJfaGNkX3N0YXJ0KGhzb3RnKTsNCisJfQ0KK30NCisNCiAvKg0KICAqIEdQV1JETiBpbnRlcnJ1
cHQgaGFuZGxlci4NCiAgKg0KQEAgLTY4Myw2MCArNzQ3LDEyIEBAIHN0YXRpYyB2b2lkIGR3YzJf
aGFuZGxlX2dwd3Jkbl9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCiANCiAJaWYgKChn
cHdyZG4gJiBHUFdSRE5fRElTQ09OTl9ERVQpICYmDQogCSAgICAoZ3B3cmRuICYgR1BXUkROX0RJ
U0NPTk5fREVUX01TSykgJiYgIWxpbmVzdGF0ZSkgew0KLQkJdTMyIGdwd3Jkbl90bXA7DQotDQog
CQlkZXZfZGJnKGhzb3RnLT5kZXYsICIlczogR1BXUkROX0RJU0NPTk5fREVUXG4iLCBfX2Z1bmNf
Xyk7DQotDQotCQkvKiBTd2l0Y2gtb24gdm9sdGFnZSB0byB0aGUgY29yZSAqLw0KLQkJZ3B3cmRu
X3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQotCQlncHdyZG5fdG1wICY9IH5HUFdS
RE5fUFdSRE5TV1RDSDsNCi0JCWR3YzJfd3JpdGVsKGhzb3RnLCBncHdyZG5fdG1wLCBHUFdSRE4p
Ow0KLQkJdWRlbGF5KDEwKTsNCi0NCi0JCS8qIFJlc2V0IGNvcmUgKi8NCi0JCWdwd3Jkbl90bXAg
PSBkd2MyX3JlYWRsKGhzb3RnLCBHUFdSRE4pOw0KLQkJZ3B3cmRuX3RtcCAmPSB+R1BXUkROX1BX
UkROUlNUTjsNCi0JCWR3YzJfd3JpdGVsKGhzb3RnLCBncHdyZG5fdG1wLCBHUFdSRE4pOw0KLQkJ
dWRlbGF5KDEwKTsNCi0NCi0JCS8qIERpc2FibGUgUG93ZXIgRG93biBDbGFtcCAqLw0KLQkJZ3B3
cmRuX3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQotCQlncHdyZG5fdG1wICY9IH5H
UFdSRE5fUFdSRE5DTE1QOw0KLQkJZHdjMl93cml0ZWwoaHNvdGcsIGdwd3Jkbl90bXAsIEdQV1JE
Tik7DQotCQl1ZGVsYXkoMTApOw0KLQ0KLQkJLyogRGVhc3NlcnQgcmVzZXQgY29yZSAqLw0KLQkJ
Z3B3cmRuX3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQotCQlncHdyZG5fdG1wIHw9
IEdQV1JETl9QV1JETlJTVE47DQotCQlkd2MyX3dyaXRlbChoc290ZywgZ3B3cmRuX3RtcCwgR1BX
UkROKTsNCi0JCXVkZWxheSgxMCk7DQotDQotCQkvKiBEaXNhYmxlIFBNVSBpbnRlcnJ1cHQgKi8N
Ci0JCWdwd3Jkbl90bXAgPSBkd2MyX3JlYWRsKGhzb3RnLCBHUFdSRE4pOw0KLQkJZ3B3cmRuX3Rt
cCAmPSB+R1BXUkROX1BNVUlOVFNFTDsNCi0JCWR3YzJfd3JpdGVsKGhzb3RnLCBncHdyZG5fdG1w
LCBHUFdSRE4pOw0KLQ0KLQkJLyogRGUtYXNzZXJ0IFdha2V1cCBMb2dpYyAqLw0KLQkJZ3B3cmRu
X3RtcCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdQV1JETik7DQotCQlncHdyZG5fdG1wICY9IH5HUFdS
RE5fUE1VQUNUVjsNCi0JCWR3YzJfd3JpdGVsKGhzb3RnLCBncHdyZG5fdG1wLCBHUFdSRE4pOw0K
LQ0KLQkJaHNvdGctPmhpYmVybmF0ZWQgPSAwOw0KLQ0KLQkJaWYgKGdwd3JkbiAmIEdQV1JETl9J
RFNUUykgew0KLQkJCWhzb3RnLT5vcF9zdGF0ZSA9IE9UR19TVEFURV9CX1BFUklQSEVSQUw7DQot
CQkJZHdjMl9jb3JlX2luaXQoaHNvdGcsIGZhbHNlKTsNCi0JCQlkd2MyX2VuYWJsZV9nbG9iYWxf
aW50ZXJydXB0cyhoc290Zyk7DQotCQkJZHdjMl9oc290Z19jb3JlX2luaXRfZGlzY29ubmVjdGVk
KGhzb3RnLCBmYWxzZSk7DQotCQkJZHdjMl9oc290Z19jb3JlX2Nvbm5lY3QoaHNvdGcpOw0KLQkJ
fSBlbHNlIHsNCi0JCQloc290Zy0+b3Bfc3RhdGUgPSBPVEdfU1RBVEVfQV9IT1NUOw0KLQ0KLQkJ
CS8qIEluaXRpYWxpemUgdGhlIENvcmUgZm9yIEhvc3QgbW9kZSAqLw0KLQkJCWR3YzJfY29yZV9p
bml0KGhzb3RnLCBmYWxzZSk7DQotCQkJZHdjMl9lbmFibGVfZ2xvYmFsX2ludGVycnVwdHMoaHNv
dGcpOw0KLQkJCWR3YzJfaGNkX3N0YXJ0KGhzb3RnKTsNCi0JCX0NCisJCS8qDQorCQkgKiBDYWxs
IGRpc2Nvbm5lY3QgZGV0ZWN0IGZ1bmN0aW9uIHRvIGV4aXQgZnJvbQ0KKwkJICogaGliZXJuYXRp
b24NCisJCSAqLw0KKwkJZHdjX2hhbmRsZV9ncHdyZG5fZGlzY19kZXQoaHNvdGcsIGdwd3Jkbik7
DQogCX0NCiANCiAJaWYgKChncHdyZG4gJiBHUFdSRE5fTE5TVFNDSEcpICYmDQpAQCAtNzUyLDIy
ICs3NjgsMjUgQEAgc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfZ3B3cmRuX2ludHIoc3RydWN0IGR3
YzJfaHNvdGcgKmhzb3RnKQ0KIAkJCX0NCiAJCX0NCiAJfQ0KKw0KIAlpZiAoKGdwd3JkbiAmIEdQ
V1JETl9SU1RfREVUKSAmJiAoZ3B3cmRuICYgR1BXUkROX1JTVF9ERVRfTVNLKSkgew0KIAkJZGV2
X2RiZyhoc290Zy0+ZGV2LCAiJXM6IEdQV1JETl9SU1RfREVUXG4iLCBfX2Z1bmNfXyk7DQogCQlp
ZiAoIWxpbmVzdGF0ZSAmJiAoZ3B3cmRuICYgR1BXUkROX0JTRVNTVkxEKSkNCiAJCQlkd2MyX2V4
aXRfaGliZXJuYXRpb24oaHNvdGcsIDAsIDEsIDApOw0KIAl9DQorDQogCWlmICgoZ3B3cmRuICYg
R1BXUkROX1NUU19DSEdJTlQpICYmDQotCSAgICAoZ3B3cmRuICYgR1BXUkROX1NUU19DSEdJTlRf
TVNLKSAmJiBsaW5lc3RhdGUpIHsNCisJICAgIChncHdyZG4gJiBHUFdSRE5fU1RTX0NIR0lOVF9N
U0spKSB7DQogCQlkZXZfZGJnKGhzb3RnLT5kZXYsICIlczogR1BXUkROX1NUU19DSEdJTlRcbiIs
IF9fZnVuY19fKTsNCiAJCWlmIChoc290Zy0+aHdfcGFyYW1zLmhpYmVybmF0aW9uICYmDQogCQkg
ICAgaHNvdGctPmhpYmVybmF0ZWQpIHsNCi0JCQlpZiAoZ3B3cmRuICYgR1BXUkROX0lEU1RTKSB7
DQotCQkJCWR3YzJfZXhpdF9oaWJlcm5hdGlvbihoc290ZywgMCwgMCwgMCk7DQotCQkJCWNhbGxf
Z2FkZ2V0KGhzb3RnLCByZXN1bWUpOw0KLQkJCX0gZWxzZSB7DQotCQkJCWR3YzJfZXhpdF9oaWJl
cm5hdGlvbihoc290ZywgMSwgMCwgMSk7DQotCQkJfQ0KKwkJCS8qDQorCQkJICogQXMgR1BXUkRO
X1NUU19DSEdJTlQgZXhpdCBmcm9tIGhpYmVybmF0aW9uIGZsb3cgaXMNCisJCQkgKiB0aGUgc2Ft
ZSBhcyBpbiBHUFdSRE5fRElTQ09OTl9ERVQgZmxvdy4gQ2FsbA0KKwkJCSAqIGRpc2Nvbm5lY3Qg
ZGV0ZWN0IGhlbHBlciBmdW5jdGlvbiB0byBleGl0IGZyb20NCisJCQkgKiBoaWJlcm5hdGlvbi4N
CisJCQkgKi8NCisJCQlkd2NfaGFuZGxlX2dwd3Jkbl9kaXNjX2RldChoc290ZywgZ3B3cmRuKTsN
CiAJCX0NCiAJfQ0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jIGIvZHJp
dmVycy91c2IvZHdjMi9oY2QuYw0KaW5kZXggNTQ0NTBmYTM1MmNmLi40NWQ0YTNlMWViZDIgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2My
L2hjZC5jDQpAQCAtNTU3MCw3ICs1NTcwLDcgQEAgaW50IGR3YzJfaG9zdF9lbnRlcl9oaWJlcm5h
dGlvbihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogCWR3YzJfd3JpdGVsKGhzb3RnLCBocHJ0
MCwgSFBSVDApOw0KIA0KIAkvKiBXYWl0IGZvciB0aGUgSFBSVDAuUHJ0U3VzcCByZWdpc3RlciBm
aWVsZCB0byBiZSBzZXQgKi8NCi0JaWYgKGR3YzJfaHNvdGdfd2FpdF9iaXRfc2V0KGhzb3RnLCBI
UFJUMCwgSFBSVDBfU1VTUCwgMzAwMCkpDQorCWlmIChkd2MyX2hzb3RnX3dhaXRfYml0X3NldCho
c290ZywgSFBSVDAsIEhQUlQwX1NVU1AsIDUwMDApKQ0KIAkJZGV2X3dhcm4oaHNvdGctPmRldiwg
IlN1c3BlbmQgd2Fzbid0IGdlbmVyYXRlZFxuIik7DQogDQogCS8qDQotLSANCjIuMTEuMA0KDQo=
