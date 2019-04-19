Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B24CC282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53E1A2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K8nWyjkt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="cB1owIvb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbfDSUFx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:53 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36794 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727722AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 308E6C1208;
        Fri, 19 Apr 2019 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673152; bh=aKZOdZxlVugT7qhUL1bSwf30K2+a+aXa560JPFGWJ7k=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=K8nWyjktBUE8RuEJCbGMqW7pMRVlkCVqSxgwydI01suKp/2wMnyWcDrwry3BFQFAM
         gi9uyG/lvFX/8TV+bfTIUYFDpGGkwSJoOAOpqiQntcwuEBqVZcCK4l2zR0feIez3+C
         gojvJEiZ1EfjKHNtHmNt/6IZO+0gGOpu26fsS1g93nIojFO1R9vwUHfUCY35S/wMho
         SOyUslsD3mTpefwD2cXkfcNiUBlOckdCAdy8mcbjUqJruYR+f7AuYYacZ2nn6LwN84
         YzqpRQswRLB8b2PscXzRO+r/UisW5OKzQkz1oityN05QuGcMNH+zzYvliRAQD/2Oj3
         gIlKnoaFc18ZA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7C261A0067;
        Fri, 19 Apr 2019 11:25:51 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:51 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKZOdZxlVugT7qhUL1bSwf30K2+a+aXa560JPFGWJ7k=;
 b=cB1owIvbO0gws1lbxpkaJrWefhmJ5q6VoBYV8+Ofc9SfQrSXDtwIrrSrJTSRsjeoUyopk/0R1umHHTnp3EbiDNukbFarJDN6t4cnVDTE4hXcEvP2qRvHkv5OTkuK54HgQNxUQ2O88GTGz5A0Cy5seiVttnJ0YeaigJsHsymx5Vg=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:49 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:49 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from system
 issued suspend/resume
Thread-Topic: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from
 system issued suspend/resume
Thread-Index: AQHU9qKj4BXfhuera0qVm1faf23VEw==
Date:   Fri, 19 Apr 2019 11:25:49 +0000
Message-ID:
 <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
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
x-originating-ip: [84.53.141.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 410a0eb8-4cc2-4a5d-b02a-08d6c4b9c599
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383DB8899BEAEB9611AAB28A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(15650500001)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8X/Cuq8/aK3aXmLCxzfdAHQ1WpYi0ZgC1DUvOg4sGWjFyVeqlKPS+u7Bo+y9khf9yxdxKUtfGAc+9A2/BqWdsKdCLHg4afO4oHSDFZVQJiXqDzD7WyMGn94CSHi8mc6uWGN99S8x0d3et7h+3NlEnNRVrSd4UHSBzil7pN+qe8HMgAg8h/IHXukj2rTvrfr3JzyzW3jc0ZjPFvmSCtDfR3qxTgko9SjpP8kif18HcAIKD5iE02LyHuzjYRQqSlUeogV919mGTy63OctxKb7fn2tuQK+oPgVPVOyYQjIuoyjEk4+n5GF2z2zLzbaB8AsO2G8HDVlaYi6OBPDIbi7OUdpSJHvd64O2HqzC5SWH2nJcJxglK6vOYlRV/vpDMTpXuhc4aY4pdE62bZ/4vi89Q1lR3LQPfGg/OAq8HRFcxf0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 410a0eb8-4cc2-4a5d-b02a-08d6c4b9c599
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:25:49.4520
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
Message-ID: <20190419112549.pv_7E3xefzwNrYv2iRr6VuS5_0Y-muLkifqgUI-NJtM@z>

QWRkZWQgYSBuZXcgZmxvdyBvZiBlbnRlcmluZyBhbmQgZXhpdGluZyBoaWJlcm5hdGlvbiB3aGVu
IFBDIGlzDQpoaWJlcm5hdGVkIG9yIHN1c3BlbmRlZC4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0dXIg
UGV0cm9zeWFuIDxhcnR1cnBAc3lub3BzeXMuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZHdjMi9o
Y2QuYyB8IDEyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZlcnMvdXNiL2R3YzIv
aGNkLmMNCmluZGV4IDQ1ZDRhM2UxZWJkMi4uZjFlOTJhMjg3Y2IxIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy91c2IvZHdjMi9oY2QuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2QuYw0KQEAgLTQ1
MTAsMzUgKzQ1MTAsNTQgQEAgc3RhdGljIGludCBfZHdjMl9oY2Rfc3VzcGVuZChzdHJ1Y3QgdXNi
X2hjZCAqaGNkKQ0KIAlpZiAoaHNvdGctPm9wX3N0YXRlID09IE9UR19TVEFURV9CX1BFUklQSEVS
QUwpDQogCQlnb3RvIHVubG9jazsNCiANCi0JaWYgKGhzb3RnLT5wYXJhbXMucG93ZXJfZG93biAh
PSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fUEFSVElBTCB8fA0KKwlpZiAoaHNvdGctPnBhcmFtcy5w
b3dlcl9kb3duID09IERXQzJfUE9XRVJfRE9XTl9QQVJBTV9OT05FIHx8DQogCSAgICBoc290Zy0+
ZmxhZ3MuYi5wb3J0X2Nvbm5lY3Rfc3RhdHVzID09IDApDQogCQlnb3RvIHNraXBfcG93ZXJfc2F2
aW5nOw0KIA0KLQkvKg0KLQkgKiBEcml2ZSBVU0Igc3VzcGVuZCBhbmQgZGlzYWJsZSBwb3J0IFBv
d2VyDQotCSAqIGlmIHVzYiBidXMgaXMgbm90IHN1c3BlbmRlZC4NCi0JICovDQotCWlmICghaHNv
dGctPmJ1c19zdXNwZW5kZWQpIHsNCi0JCWhwcnQwID0gZHdjMl9yZWFkX2hwcnQwKGhzb3RnKTsN
Ci0JCWhwcnQwIHw9IEhQUlQwX1NVU1A7DQotCQlocHJ0MCAmPSB+SFBSVDBfUFdSOw0KLQkJZHdj
Ml93cml0ZWwoaHNvdGcsIGhwcnQwLCBIUFJUMCk7DQotCQlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZoc290Zy0+bG9jaywgZmxhZ3MpOw0KLQkJZHdjMl92YnVzX3N1cHBseV9leGl0KGhzb3RnKTsN
Ci0JCXNwaW5fbG9ja19pcnFzYXZlKCZoc290Zy0+bG9jaywgZmxhZ3MpOw0KLQl9DQorCXN3aXRj
aCAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duKSB7DQorCWNhc2UgRFdDMl9QT1dFUl9ET1dOX1BB
UkFNX1BBUlRJQUw6DQorCQkvKg0KKwkJICogRHJpdmUgVVNCIHN1c3BlbmQgYW5kIGRpc2FibGUg
cG9ydCBQb3dlcg0KKwkJICogaWYgdXNiIGJ1cyBpcyBub3Qgc3VzcGVuZGVkLg0KKwkJICovDQor
CQlpZiAoIWhzb3RnLT5idXNfc3VzcGVuZGVkKSB7DQorCQkJaHBydDAgPSBkd2MyX3JlYWRfaHBy
dDAoaHNvdGcpOw0KKwkJCWhwcnQwIHw9IEhQUlQwX1NVU1A7DQorCQkJaHBydDAgJj0gfkhQUlQw
X1BXUjsNCisJCQlkd2MyX3dyaXRlbChoc290ZywgaHBydDAsIEhQUlQwKTsNCisJCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZoc290Zy0+bG9jaywgZmxhZ3MpOw0KKwkJCWR3YzJfdmJ1c19zdXBw
bHlfZXhpdChoc290Zyk7DQorCQkJc3Bpbl9sb2NrX2lycXNhdmUoJmhzb3RnLT5sb2NrLCBmbGFn
cyk7DQorCQl9DQogDQotCS8qIEVudGVyIHBhcnRpYWxfcG93ZXJfZG93biAqLw0KLQlyZXQgPSBk
d2MyX2VudGVyX3BhcnRpYWxfcG93ZXJfZG93bihoc290Zyk7DQotCWlmIChyZXQpIHsNCi0JCWlm
IChyZXQgIT0gLUVOT1RTVVBQKQ0KLQkJCWRldl9lcnIoaHNvdGctPmRldiwNCi0JCQkJImVudGVy
IHBhcnRpYWxfcG93ZXJfZG93biBmYWlsZWRcbiIpOw0KKwkJLyogRW50ZXIgcGFydGlhbF9wb3dl
cl9kb3duICovDQorCQlyZXQgPSBkd2MyX2VudGVyX3BhcnRpYWxfcG93ZXJfZG93bihoc290Zyk7
DQorCQlpZiAocmV0KSB7DQorCQkJaWYgKHJldCAhPSAtRU5PVFNVUFApDQorCQkJCWRldl9lcnIo
aHNvdGctPmRldiwNCisJCQkJCSJlbnRlciBwYXJ0aWFsX3Bvd2VyX2Rvd24gZmFpbGVkXG4iKTsN
CisJCQlnb3RvIHNraXBfcG93ZXJfc2F2aW5nOw0KKwkJfQ0KKwkJaHNvdGctPmJ1c19zdXNwZW5k
ZWQgPSB0cnVlOw0KKwkJYnJlYWs7DQorCWNhc2UgRFdDMl9QT1dFUl9ET1dOX1BBUkFNX0hJQkVS
TkFUSU9OOg0KKwkJaWYgKCFoc290Zy0+YnVzX3N1c3BlbmRlZCkgew0KKwkJCS8qIEVudGVyIGhp
YmVybmF0aW9uICovDQorCQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaHNvdGctPmxvY2ssIGZs
YWdzKTsNCisJCQlyZXQgPSBkd2MyX2VudGVyX2hpYmVybmF0aW9uKGhzb3RnLCAxKTsNCisJCQlz
cGluX2xvY2tfaXJxc2F2ZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCisJCQlpZiAocmV0ICYmIHJl
dCAhPSAtRU5PVFNVUFApDQorCQkJCWRldl9lcnIoaHNvdGctPmRldiwNCisJCQkJCSIlczogZW50
ZXIgaGliZXJuYXRpb24gZmFpbGVkXG4iLA0KKwkJCQkJX19mdW5jX18pOw0KKwkJfSBlbHNlIHsN
CisJCQlnb3RvIHNraXBfcG93ZXJfc2F2aW5nOw0KKwkJfQ0KKwkJYnJlYWs7DQorCWRlZmF1bHQ6
DQogCQlnb3RvIHNraXBfcG93ZXJfc2F2aW5nOw0KIAl9DQogDQotCWhzb3RnLT5idXNfc3VzcGVu
ZGVkID0gdHJ1ZTsNCi0NCiAJLyogQXNrIHBoeSB0byBiZSBzdXNwZW5kZWQgKi8NCiAJaWYgKCFJ
U19FUlJfT1JfTlVMTChoc290Zy0+dXBoeSkpIHsNCiAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
Jmhzb3RnLT5sb2NrLCBmbGFncyk7DQpAQCAtNDU2NCwxNyArNDU4MywxNyBAQCBzdGF0aWMgaW50
IF9kd2MyX2hjZF9yZXN1bWUoc3RydWN0IHVzYl9oY2QgKmhjZCkNCiAJaW50IHJldCA9IDA7DQog
CXUzMiBocHJ0MDsNCiANCi0JaHBydDAgPSBkd2MyX3JlYWRfaHBydDAoaHNvdGcpOw0KLQ0KIAlz
cGluX2xvY2tfaXJxc2F2ZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCiANCi0JaWYgKGR3YzJfaXNf
ZGV2aWNlX21vZGUoaHNvdGcpKQ0KKwlpZiAoIWhzb3RnLT5idXNfc3VzcGVuZGVkKQ0KIAkJZ290
byB1bmxvY2s7DQogDQogCWlmIChoc290Zy0+bHhfc3RhdGUgIT0gRFdDMl9MMikNCiAJCWdvdG8g
dW5sb2NrOw0KIA0KLQlpZiAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duICE9IERXQzJfUE9XRVJf
RE9XTl9QQVJBTV9QQVJUSUFMIHx8DQorCWhwcnQwID0gZHdjMl9yZWFkX2hwcnQwKGhzb3RnKTsN
CisNCisJaWYgKGhzb3RnLT5wYXJhbXMucG93ZXJfZG93biA9PSBEV0MyX1BPV0VSX0RPV05fUEFS
QU1fTk9ORSB8fA0KIAkgICAgaHBydDAgJiBIUFJUMF9DT05OU1RTKSB7DQogCQloc290Zy0+bHhf
c3RhdGUgPSBEV0MyX0wwOw0KIAkJZ290byB1bmxvY2s7DQpAQCAtNDU5NywzNiArNDYxNiw1MSBA
QCBzdGF0aWMgaW50IF9kd2MyX2hjZF9yZXN1bWUoc3RydWN0IHVzYl9oY2QgKmhjZCkNCiAJCXNw
aW5fbG9ja19pcnFzYXZlKCZoc290Zy0+bG9jaywgZmxhZ3MpOw0KIAl9DQogDQotCS8qIEV4aXQg
cGFydGlhbF9wb3dlcl9kb3duICovDQotCXJldCA9IGR3YzJfZXhpdF9wYXJ0aWFsX3Bvd2VyX2Rv
d24oaHNvdGcsIHRydWUpOw0KLQlpZiAocmV0ICYmIChyZXQgIT0gLUVOT1RTVVBQKSkNCi0JCWRl
dl9lcnIoaHNvdGctPmRldiwgImV4aXQgcGFydGlhbF9wb3dlcl9kb3duIGZhaWxlZFxuIik7DQor
CXN3aXRjaCAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duKSB7DQorCWNhc2UgRFdDMl9QT1dFUl9E
T1dOX1BBUkFNX1BBUlRJQUw6DQogDQotCWhzb3RnLT5seF9zdGF0ZSA9IERXQzJfTDA7DQorCQkv
KiBFeGl0IHBhcnRpYWxfcG93ZXJfZG93biAqLw0KKwkJcmV0ID0gZHdjMl9leGl0X3BhcnRpYWxf
cG93ZXJfZG93bihoc290ZywgdHJ1ZSk7DQorCQlpZiAocmV0ICYmIChyZXQgIT0gLUVOT1RTVVBQ
KSkNCisJCQlkZXZfZXJyKGhzb3RnLT5kZXYsICJleGl0IHBhcnRpYWxfcG93ZXJfZG93biBmYWls
ZWRcbiIpOw0KIA0KLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZoc290Zy0+bG9jaywgZmxhZ3Mp
Ow0KKwkJaHNvdGctPmx4X3N0YXRlID0gRFdDMl9MMDsNCiANCi0JaWYgKGhzb3RnLT5idXNfc3Vz
cGVuZGVkKSB7DQotCQlzcGluX2xvY2tfaXJxc2F2ZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCi0J
CWhzb3RnLT5mbGFncy5iLnBvcnRfc3VzcGVuZF9jaGFuZ2UgPSAxOw0KIAkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCi0JCWR3YzJfcG9ydF9yZXN1bWUoaHNv
dGcpOw0KLQl9IGVsc2Ugew0KLQkJZHdjMl92YnVzX3N1cHBseV9pbml0KGhzb3RnKTsNCiANCi0J
CS8qIFdhaXQgZm9yIGNvbnRyb2xsZXIgdG8gY29ycmVjdGx5IHVwZGF0ZSBEKy9ELSBsZXZlbCAq
Lw0KLQkJdXNsZWVwX3JhbmdlKDMwMDAsIDUwMDApOw0KKwkJaWYgKGhzb3RnLT5idXNfc3VzcGVu
ZGVkKSB7DQorCQkJc3Bpbl9sb2NrX2lycXNhdmUoJmhzb3RnLT5sb2NrLCBmbGFncyk7DQorCQkJ
aHNvdGctPmZsYWdzLmIucG9ydF9zdXNwZW5kX2NoYW5nZSA9IDE7DQorCQkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCisJCQlkd2MyX3BvcnRfcmVzdW1lKGhz
b3RnKTsNCisJCX0gZWxzZSB7DQorCQkJZHdjMl92YnVzX3N1cHBseV9pbml0KGhzb3RnKTsNCiAN
Ci0JCS8qDQotCQkgKiBDbGVhciBQb3J0IEVuYWJsZSBhbmQgUG9ydCBTdGF0dXMgY2hhbmdlcy4N
Ci0JCSAqIEVuYWJsZSBQb3J0IFBvd2VyLg0KLQkJICovDQotCQlkd2MyX3dyaXRlbChoc290Zywg
SFBSVDBfUFdSIHwgSFBSVDBfQ09OTkRFVCB8DQorCQkJLyogV2FpdCBmb3IgY29udHJvbGxlciB0
byBjb3JyZWN0bHkgdXBkYXRlIEQrL0QtIGxldmVsICovDQorCQkJdXNsZWVwX3JhbmdlKDMwMDAs
IDUwMDApOw0KKw0KKwkJCS8qDQorCQkJICogQ2xlYXIgUG9ydCBFbmFibGUgYW5kIFBvcnQgU3Rh
dHVzIGNoYW5nZXMuDQorCQkJICogRW5hYmxlIFBvcnQgUG93ZXIuDQorCQkJICovDQorCQkJZHdj
Ml93cml0ZWwoaHNvdGcsIEhQUlQwX1BXUiB8IEhQUlQwX0NPTk5ERVQgfA0KIAkJCQlIUFJUMF9F
TkFDSEcsIEhQUlQwKTsNCi0JCS8qIFdhaXQgZm9yIGNvbnRyb2xsZXIgdG8gZGV0ZWN0IFBvcnQg
Q29ubmVjdCAqLw0KLQkJdXNsZWVwX3JhbmdlKDUwMDAsIDcwMDApOw0KKwkJCS8qIFdhaXQgZm9y
IGNvbnRyb2xsZXIgdG8gZGV0ZWN0IFBvcnQgQ29ubmVjdCAqLw0KKwkJCXVzbGVlcF9yYW5nZSg1
MDAwLCA3MDAwKTsNCisJCX0NCisJCWJyZWFrOw0KKwljYXNlIERXQzJfUE9XRVJfRE9XTl9QQVJB
TV9ISUJFUk5BVElPTjoNCisNCisJCS8qIEV4aXQgaG9zdCBoaWJlcm5hdGlvbi4gKi8NCisJCWlm
IChoc290Zy0+aGliZXJuYXRlZCkNCisJCQlkd2MyX2V4aXRfaGliZXJuYXRpb24oaHNvdGcsIDAs
IDAsIDEpOw0KKwkJYnJlYWs7DQorCWRlZmF1bHQ6DQorCQlnb3RvIHVubG9jazsNCiAJfQ0KIA0K
KwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZoc290Zy0+bG9jaywgZmxhZ3MpOw0KKw0KIAlyZXR1
cm4gcmV0Ow0KIHVubG9jazoNCiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaHNvdGctPmxvY2ss
IGZsYWdzKTsNCi0tIA0KMi4xMS4wDQoNCg==
