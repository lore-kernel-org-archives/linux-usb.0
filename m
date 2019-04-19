Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BE3C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31E0820645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Aui7br86";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="AIpBJyDr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfDSSxO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:14 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37872 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728514AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED40BC0BC1;
        Fri, 19 Apr 2019 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673120; bh=jsYDCFA4tJZEDXmetIx34ZlNaOFVafPpU0gcrsnjOE8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Aui7br864aCSOoJEoExvVrYVgRR7iKMiJwKRqAaGOgf4zH7MmtiL8FGOVzZjqZ7PL
         Ef2PbDfdBlA29gc9/8Xmhzq4dzgc3OHa7ixf8bQ0Uhw34LFQJnUl9/NHBuv4R44p0Y
         9uR3cYQ8+Uw4zG9oRiSw1pEE28+pn6ULtAj2JD2TUjHkW0/1EjuAbVFQEu27mFeHWt
         iS7VeG+ZsoJTrCezD0FnoIRSJlcsPCVMAq19QCn1a3cv6zoAanx/rtPT08wr6awXCS
         jiDPXB+xTsLD/xxnTaWApTHCxodUXzZ56oZUeOoBj+EcpEKw83UwMB68G19byzhvKI
         QrQj1lFJkuhUQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 04D36A0096;
        Fri, 19 Apr 2019 11:25:21 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:20 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsYDCFA4tJZEDXmetIx34ZlNaOFVafPpU0gcrsnjOE8=;
 b=AIpBJyDrNG/cOv99B7/LwqF3heynEiCNaPLEs4kA0uUE88OY6Mp9IcJPhMIouC99f9I4uf8MhR7NKy/XEe9uQbJWVLZQAk+0YgLZ0x4zMKtPTYAI6xQBR+RCbIno9dRZBr8qDT4ntn35gERXt9bIsutXlhoZDzO/2EpCPSH9YZU=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:19 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:19 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 11/14] usb: dwc2: Allow exiting hibernation from gpwrdn rst
 detect
Thread-Topic: [PATCH v1 11/14] usb: dwc2: Allow exiting hibernation from
 gpwrdn rst detect
Thread-Index: AQHU9qKRRISJYwRGsUeDKE1UxaLfJw==
Date:   Fri, 19 Apr 2019 11:25:19 +0000
Message-ID:
 <ded6b0a301fc61c2f49ced519aff34fa87ac5759.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0023.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::33) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 474e08ce-309d-4429-0594-08d6c4b9b38c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB2383AC5E783A353A057E4DCBA7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011)(40753002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P97+9HHGIX4C0z4DdhiO+XmvA8PE24QOGTfY9CHi/8CPlFtxAeecMMQlkZtxmlh1N/Pr/Vpy+hrZBbnfKMfxSKjiECraRN4rdgMf9vguSk5cdZXob5gKImUz9rv2KP7CiyNke3s5YnLiTxawgQSNjNFFDfr50xm2WwDNqvDq+APtjvaRH2/1h+bppETnrlnbywAK5XhpJHqf24RNjNYaa9tUXDvXZRLCA1xSNrUXE60gWnLGSKcZq8qrQuHBrTvRBb7W/IQpTyuopfoAz9gSKOEQ52sQhPTiEHjuDpkEqutebfXACaT2++Z3l3PBY0Ta0pM1o+YqwBE+dWFYX9uY+juqIH8O++4CzXzRG1HWHXS3HURcrVT6ICqbctx84iWqmbKpTNt9pyny/9oLp0U713HSeFcLDQnS5AKvFItpuO0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 474e08ce-309d-4429-0594-08d6c4b9b38c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:25:19.1634
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
Message-ID: <20190419112519.fBHPCgbLFLneIy4QNS0gJHOfIdIc8J1KxZ4HAd6eoi8@z>

V2hlbiBkZXZpY2UgY2FibGUgaXMgZGlzY29ubmVjdGVkIGNvcmUgcmVjZWl2ZXMgc3VzcGVuZA0K
aW50ZXJydXB0IGFuZCBlbnRlcnMgaGliZXJuYXRpb24uIEFmdGVyIGVudGVyaW5nDQppbnRvIGhp
YmVybmF0aW9uIEdQV1JETl9SU1RfREVUIGFuZCBHUFdSRE5fU1RTX0NIR0lOVA0KaW50ZXJydXB0
cyBhcmUgYXNzZXJ0ZWQuDQoNCkZyb20gY2FibGUgZGlzY29ubmVjdGlvbiB3ZSBuZWVkIHRvIGV4
aXQgZnJvbSBoaWJlcm5hdGlvbg0KZWl0aGVyIGJ5IEdQV1JETl9SU1RfREVUIG9yIEdQV1JETl9T
VFNfQ0hHSU5ULiBJZiB3ZSBleGl0DQpmcm9tIGhpYmVybmF0aW9uIGJ5IEdQV1JETl9TVFNfQ0hH
SU5ULCBERVZBRERSIHdpbGwgbm90IGJlDQpyZXNldC4gQnV0IHdlIG5lZWQgdG8gZXhpdCBnYWRn
ZXQgaGliZXJuYXRpb24gcHJvcGVybHkNCndpdGggcmVzZXR0aW5nIHRoZSBERVZBRERSIGFzIHJl
c2V0IGFjY3J1ZWQuDQoNCi0gQWxsb3dlZCBleGl0IGZyb20gZ2FkZ2V0IGhpYmVybmF0aW9uIGZy
b20NCiAgR1BXUkROX1JTVF9ERVQgYnkgY2hlY2tpbmcgb25seSBsaW5lc3RhdGUuDQotIFNldHRp
bmcgaHNvdGctPmx4X3N0YXRlID0gRFdDMl9MMCBpbiBkd2MyX2hzb3RnX2lycQ0KICBHSU5UU1RT
X1JFU0VUREVUIGZsb3cgd2l0aG91dCBjaGVja2luZyBpZiBseF9zdGF0ZSA9PSBEV0MyX0wyDQoN
ClNpZ25lZC1vZmYtYnk6IEFydHVyIFBldHJvc3lhbiA8YXJ0dXJwQHN5bm9wc3lzLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgfCAyICstDQogZHJpdmVycy91c2IvZHdj
Mi9nYWRnZXQuYyAgICB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRy
LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQppbmRleCA0MGQyOTZkOWI2ZmIuLmNi
ODI3YTVlMWJmYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCisr
KyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCkBAIC03NzEsNyArNzcxLDcgQEAgc3Rh
dGljIHZvaWQgZHdjMl9oYW5kbGVfZ3B3cmRuX2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3Rn
KQ0KIA0KIAlpZiAoKGdwd3JkbiAmIEdQV1JETl9SU1RfREVUKSAmJiAoZ3B3cmRuICYgR1BXUkRO
X1JTVF9ERVRfTVNLKSkgew0KIAkJZGV2X2RiZyhoc290Zy0+ZGV2LCAiJXM6IEdQV1JETl9SU1Rf
REVUXG4iLCBfX2Z1bmNfXyk7DQotCQlpZiAoIWxpbmVzdGF0ZSAmJiAoZ3B3cmRuICYgR1BXUkRO
X0JTRVNTVkxEKSkNCisJCWlmICghbGluZXN0YXRlKQ0KIAkJCWR3YzJfZXhpdF9oaWJlcm5hdGlv
bihoc290ZywgMCwgMSwgMCk7DQogCX0NCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2My
L2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KaW5kZXggOGMzZTFmMWMxYjBm
Li5iMzVjOTY2ZDRmNjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQor
KysgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQpAQCAtMzYzNyw4ICszNjM3LDggQEAgc3Rh
dGljIGlycXJldHVybl90IGR3YzJfaHNvdGdfaXJxKGludCBpcnEsIHZvaWQgKnB3KQ0KIAkJLyog
VGhpcyBldmVudCBtdXN0IGJlIHVzZWQgb25seSBpZiBjb250cm9sbGVyIGlzIHN1c3BlbmRlZCAq
Lw0KIAkJaWYgKGhzb3RnLT5seF9zdGF0ZSA9PSBEV0MyX0wyKSB7DQogCQkJZHdjMl9leGl0X3Bh
cnRpYWxfcG93ZXJfZG93bihoc290ZywgdHJ1ZSk7DQotCQkJaHNvdGctPmx4X3N0YXRlID0gRFdD
Ml9MMDsNCiAJCX0NCisJCWhzb3RnLT5seF9zdGF0ZSA9IERXQzJfTDA7DQogCX0NCiANCiAJaWYg
KGdpbnRzdHMgJiAoR0lOVFNUU19VU0JSU1QgfCBHSU5UU1RTX1JFU0VUREVUKSkgew0KLS0gDQoy
LjExLjANCg0K
