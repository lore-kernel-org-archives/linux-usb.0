Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04343C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C177A2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fk10KJZW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="dczbADue"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbfDSUFw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:52 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36756 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727417AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CDDB0C1201;
        Fri, 19 Apr 2019 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673041; bh=WNm8PXvqd19j+PZndapfa7C3cSUxzu9K5McxFKSZrnU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fk10KJZWDSFKbI+5gc/iJcdzWkp+zcjU402j28BiYMrlIK0QhPiMLunxbb4ITewLC
         n8GMjDXfmZPAInQdZuJonLB1nG7kv59/c496XHPz3x5iEIaqjdP/QEtpnRyXXSzu9I
         TM86hjsFg6bLyc23lJsziyIsNynr7hzzQUHGquoGS2HZeWa457ix/eqt43aPDFwhv6
         Gh+JMhZnbybW6SzkHknvM4/qpQEdBZzRYxW7/smA7L+U/KUEKvBwV1+nI1tRf/skqO
         PxBfBBmd6EDeKvVR8dlfpBPgkJ733BSiPjDR3Wi24PnbokkuRlDcdPBdhfYRdnfhwG
         sHssGBGks2cag==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 20B85A0065;
        Fri, 19 Apr 2019 11:24:00 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:24:00 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:24:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNm8PXvqd19j+PZndapfa7C3cSUxzu9K5McxFKSZrnU=;
 b=dczbADue86u64BB8n+QT9KatbOH2VBsIKvyPCOnXKE/4gYNXaIOcM2GzxSqy9hS9/9MpSDsCR+iOtrNRmuYkQR51ifxzNqWDtpHLjLUXYNjtITuGzVzq8j5LM7c+FRLOj0YxgCjQUAaZuKsvxPhXmHeQbt0Vo7tmEGJxiY5TAHY=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:23:59 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:23:59 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Thread-Topic: [PATCH v1 03/14] usb: dwc2: Fix wakeup detected and session
 request interrupt handlers.
Thread-Index: AQHU9qJhG3XYf7ipcEa4AhmEgdfsAw==
Date:   Fri, 19 Apr 2019 11:23:58 +0000
Message-ID:
 <9eed02b9fe96805eedbeb9188d6bca711f6032cc.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::30) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8755a1c0-d716-4448-4611-08d6c4b9839a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383711DE99099E8A7EFC6DEA7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(346002)(136003)(366004)(199004)(189003)(110136005)(316002)(2616005)(54906003)(68736007)(99286004)(478600001)(8936002)(2501003)(64756008)(52116002)(73956011)(66946007)(118296001)(66446008)(3846002)(6116002)(66066001)(8676002)(36756003)(14454004)(386003)(186003)(305945005)(2906002)(4326008)(102836004)(6436002)(26005)(486006)(256004)(25786009)(53936002)(14444005)(476003)(71200400001)(71190400001)(6512007)(86362001)(107886003)(5660300002)(97736004)(81156014)(446003)(76176011)(6506007)(7736002)(6486002)(11346002)(66476007)(66556008)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0HOklcnFXEkhOeJCZYDoMwdyb1VTv9GOQ+UZyI9mZLITT4IFgQAKzOOR3KkPV664T0ZdQm9oMYk60vp4LacclwB5ofFfJoAwNmo96tWC7qbPIOcYMMLNdzFdySOCYmXTZ3IyGIFvox1WHDg/CXVaL2tSjNKsZ5tuYeL3wDrdh7wqWu+GRXsMTVGdmsY7yeMcStlOU9liq+EGSGD8XOswJsxmOqhd3TT/P8M9RGMdlVXxyGnElDPiCFPRuwmhPHMQpzrMrhk5XHQKAHessCHqrhWbABVd2Fegb47Aqm2ixUcd0aZy5jAx5pMemeNf8/9cMt2v+QEcWfD8ipTvgxY1eAPocHYyJOF5bHV960eiFjLonTzhpyznijpKSgip+Ubdn2rTxtxkqSSMDwyaMYQor0ahWyUxJV4JpgOptUxaunY=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8755a1c0-d716-4448-4611-08d6c4b9839a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:23:58.8342
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
Message-ID: <20190419112358.6W-KxcYvLcWD2XYHMS0u4rTkLcp1nxwwMio7nOo7tAA@z>

SW4gaG9zdCBtb2RlIHBvcnQgcG93ZXIgbXVzdCBiZSB0dXJuZWQgb24gd2hlbiB3YWtldXANCmRl
dGVjdGVkIG9yIHNlc3Npb24gcmVxdWVzdCBpbnRlcnJ1cHQgaXMgZGV0ZWN0ZWQuDQpCZWNhdXNl
LCBvdGhlcndpc2UgY29yZSB3b3VsZG4ndCBleGl0IGZvcm0gcGFydGlhbA0KcG93ZXIgZG93bi4N
Cg0KLSBUdXJuZWQgb24gdGhlIHBvcnQgcG93ZXIgYnkgc2V0dGluZyBIUFJUMF9QV1IgYml0Lg0K
DQotIENhbGxlZCBkd2MyX2hjZF9jb25uZWN0KCkgZnVuY3Rpb24gYWZ0ZXIgZW5hYmxpbmcNCiAg
dGhlIHBvd2VyIG9mIHRoZSBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBBcnR1ciBQZXRyb3N5YW4g
PGFydHVycEBzeW5vcHN5cy5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5j
IHwgMjUgKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
Mi9jb3JlX2ludHIuYyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCmluZGV4IDE5YWUy
NTk1ZjFjMy4uMDZmODAyMmIxYmRiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMi9jb3Jl
X2ludHIuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlX2ludHIuYw0KQEAgLTMxMiw2ICsz
MTIsNyBAQCBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV9jb25uX2lkX3N0YXR1c19jaGFuZ2VfaW50
cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfc2Vz
c2lvbl9yZXFfaW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogew0KIAlpbnQgcmV0Ow0K
Kwl1MzIgaHBydDA7DQogDQogCS8qIENsZWFyIGludGVycnVwdCAqLw0KIAlkd2MyX3dyaXRlbCho
c290ZywgR0lOVFNUU19TRVNTUkVRSU5ULCBHSU5UU1RTKTsNCkBAIC0zMjAsNyArMzIxLDkgQEAg
c3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfc2Vzc2lvbl9yZXFfaW50cihzdHJ1Y3QgZHdjMl9oc290
ZyAqaHNvdGcpDQogCQloc290Zy0+bHhfc3RhdGUpOw0KIA0KIAlpZiAoZHdjMl9pc19kZXZpY2Vf
bW9kZShoc290ZykpIHsNCi0JCWlmIChoc290Zy0+bHhfc3RhdGUgPT0gRFdDMl9MMikgew0KKwkJ
aWYgKGhzb3RnLT5seF9zdGF0ZSA9PSBEV0MyX0wyICYmDQorCQkgICAgaHNvdGctPnBhcmFtcy5w
b3dlcl9kb3duID09DQorCQkgICAgRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUwpIHsNCiAJ
CQlyZXQgPSBkd2MyX2V4aXRfcGFydGlhbF9wb3dlcl9kb3duKGhzb3RnLCB0cnVlKTsNCiAJCQlp
ZiAocmV0ICYmIChyZXQgIT0gLUVOT1RTVVBQKSkNCiAJCQkJZGV2X2Vycihoc290Zy0+ZGV2LA0K
QEAgLTMzMiw2ICszMzUsMTQgQEAgc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfc2Vzc2lvbl9yZXFf
aW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogCQkgKiBlc3RhYmxpc2hlZA0KIAkJICov
DQogCQlkd2MyX2hzb3RnX2Rpc2Nvbm5lY3QoaHNvdGcpOw0KKwl9IGVsc2Ugew0KKwkJLyogVHVy
biBvbiB0aGUgcG9ydCBwb3dlciBiaXQuICovDQorCQlocHJ0MCA9IGR3YzJfcmVhZF9ocHJ0MCho
c290Zyk7DQorCQlocHJ0MCB8PSBIUFJUMF9QV1I7DQorCQlkd2MyX3dyaXRlbChoc290ZywgaHBy
dDAsIEhQUlQwKTsNCisNCisJCS8qIENvbm5lY3QgaGNkIGFmdGVyIHBvcnQgcG93ZXIgaXMgc2V0
LiAqLw0KKwkJZHdjMl9oY2RfY29ubmVjdChoc290Zyk7DQogCX0NCiB9DQogDQpAQCAtMzk2LDYg
KzQwNyw3IEBAIHN0YXRpYyB2b2lkIGR3YzJfd2FrZXVwX2Zyb21fbHBtX2wxKHN0cnVjdCBkd2My
X2hzb3RnICpoc290ZykNCiBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV93YWtldXBfZGV0ZWN0ZWRf
aW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogew0KIAlpbnQgcmV0Ow0KKwl1MzIgaHBy
dDA7DQogDQogCS8qIENsZWFyIGludGVycnVwdCAqLw0KIAlkd2MyX3dyaXRlbChoc290ZywgR0lO
VFNUU19XS1VQSU5ULCBHSU5UU1RTKTsNCkBAIC00MjYsOCArNDM4LDYgQEAgc3RhdGljIHZvaWQg
ZHdjMl9oYW5kbGVfd2FrZXVwX2RldGVjdGVkX2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3Rn
KQ0KIAkJLyogQ2hhbmdlIHRvIEwwIHN0YXRlICovDQogCQloc290Zy0+bHhfc3RhdGUgPSBEV0My
X0wwOw0KIAl9IGVsc2Ugew0KLQkJaWYgKGhzb3RnLT5wYXJhbXMucG93ZXJfZG93bikNCi0JCQly
ZXR1cm47DQogDQogCQlpZiAoaHNvdGctPmx4X3N0YXRlICE9IERXQzJfTDEpIHsNCiAJCQl1MzIg
cGNnY2N0bCA9IGR3YzJfcmVhZGwoaHNvdGcsIFBDR0NUTCk7DQpAQCAtNDM1LDYgKzQ0NSwxNSBA
QCBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV93YWtldXBfZGV0ZWN0ZWRfaW50cihzdHJ1Y3QgZHdj
Ml9oc290ZyAqaHNvdGcpDQogCQkJLyogUmVzdGFydCB0aGUgUGh5IENsb2NrICovDQogCQkJcGNn
Y2N0bCAmPSB+UENHQ1RMX1NUT1BQQ0xLOw0KIAkJCWR3YzJfd3JpdGVsKGhzb3RnLCBwY2djY3Rs
LCBQQ0dDVEwpOw0KKw0KKwkJCS8qIFR1cm4gb24gdGhlIHBvcnQgcG93ZXIgYml0LiAqLw0KKwkJ
CWhwcnQwID0gZHdjMl9yZWFkX2hwcnQwKGhzb3RnKTsNCisJCQlocHJ0MCB8PSBIUFJUMF9QV1I7
DQorCQkJZHdjMl93cml0ZWwoaHNvdGcsIGhwcnQwLCBIUFJUMCk7DQorDQorCQkJLyogQ29ubmVj
dCBoY2QuICovDQorCQkJZHdjMl9oY2RfY29ubmVjdChoc290Zyk7DQorDQogCQkJbW9kX3RpbWVy
KCZoc290Zy0+d2twX3RpbWVyLA0KIAkJCQkgIGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKDcx
KSk7DQogCQl9IGVsc2Ugew0KLS0gDQoyLjExLjANCg0K
