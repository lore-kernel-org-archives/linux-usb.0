Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEC0C282DF
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E96B2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O67LjOsC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="jKoP+W9U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfDSUF4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:05:56 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36838 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728068AbfDSUFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:05:52 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B1D3BC1209;
        Fri, 19 Apr 2019 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673131; bh=4+S92Ayez9OQURkxLcIuAowTTX2V5zeHy2PCgCHR/9g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=O67LjOsCwfJ4Ky47+PeXd7IktU7Ubntk0pM1iFUcxBbQRqX/ccRLwoLdK4SVq8dhi
         VTWFf0GbANJwI8a4At0FUV/yrGwSXgUI423lTUoR5hPniXZhjTYI+ef7ABWmr+0N+j
         TiU/NbIbk+QItns+dg5NpaPwr383WRhPcM2nn6j3IZLmOR13Pvl1yEDkV3LTMIb6bf
         lKqk4zn7UgqzR8pzG3nrk+FhfP5YtZqeS/vhRjZ5hPEtkSHFIk2M3Q8LrQbxl2OU77
         Ywha4bEp5zzxyp3XqTXvvCkhLpTJILxR7yDvOmDF0bDvG+DmWb2xrJRaA8xmh9+nX1
         bhyJ2ODnIlGKw==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0D2ABA0065;
        Fri, 19 Apr 2019 11:25:31 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:30 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+S92Ayez9OQURkxLcIuAowTTX2V5zeHy2PCgCHR/9g=;
 b=jKoP+W9UWTKCkk3a4yoiuzdq70tqh19+nqJ4i/0nywxmG0zB1gOjpyuBR4KiuMy43Awt4ziJzjUdgxoJC1VdBeWuHvwprcG3T+BsD77MvocJeTZDUao9V3Ic7NBHv5cBPacQBVTdHsc/fc6O+WaySFM7FkxGoABFFHnD4IpAVFU=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:29 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:29 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 12/14] usb: dwc2: Clear fifo_map when resetting core.
Thread-Topic: [PATCH v1 12/14] usb: dwc2: Clear fifo_map when resetting core.
Thread-Index: AQHU9qKXjJ2vykcArkSxArt/WbmDZg==
Date:   Fri, 19 Apr 2019 11:25:29 +0000
Message-ID:
 <abd6b3cf465aac7c4e0dd3274ab1549980601c6d.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0185.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::15) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10650e2b-c238-406a-dc63-08d6c4b9b948
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB23831F0E07BDA73570626850A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eEDIC+ELmC8FxNod97/gMtmf3cbSR/LHfVGpFqPsfUGYANc5vn31wZYJmlxso+yvltbW+CGMdyNf7wrt/sZcpft6VNl1gsad+masIHw3/cwfzIqqjmHyh45yzSkDmDFcMOeTND7YS1ESo/jYIDteX0+CMfLU1hE6L/054eQF04jh42HywF8H45zcJsPNMhSTgtA2imG2ik/FVlpqRACktxq7cbQaGCUQa+UXaltzWTuLnsrkpgeQioPr8MyW1uUrBz4L5xkRz7lQZJjmCpmQEq9hItI4rya69AnULPccAH6alIL82r5cmxmQgJKdQQOkPBoMbro+OdRS3X87gH+9sUXiMMIvcRDH9ZL2cK7zsCjTbTgWvEku8ooxB1cZ69ZbIb0UDyHVK2oHigG11PHfWJo09Ur3UFzlS5jOp7Ib/go=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 10650e2b-c238-406a-dc63-08d6c4b9b948
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:25:29.0848
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
Message-ID: <20190419112529.fcu4m1UdXwnVXYN0Lm7n7FXIuaFLSPnhF10ijjjQ-2k@z>

SWYgY29yZSBlbnRlcnMgaG9zdCBoaWJlcm5hdGlvbiB3aGVuIHN3aXRjaGluZyBmcm9tDQpkZXZp
Y2UgbW9kZSB0byBob3N0IG1vZGUgZGlzY29ubmVjdGlvbiBvZiBob3N0IGNhYmxlDQphc3NlcnRz
IGEgV0FSTklORyBpbiBkd2MyX2hzb3RnX2luaXRfZmlmbygpIHRoYXQNCmZpZm9fbWFwIGlzIG5v
dCBjbGVhcmVkLg0KDQpUbyBhdm9pZCB0aGUgV0FSTklORywgZmlmb19tYXAgc2hvdWxkIGJlIGNs
ZWFyZWQNCmluIGR3YzJfY29yZV9yZXNldCgpIGZ1bmN0aW9uLg0KDQotIENsZWFyZWQgZmlmb19t
YXAgd2hlbiByZXNldHRpbmcgdGhlIGNvcmUuDQoNClNpZ25lZC1vZmYtYnk6IEFydHVyIFBldHJv
c3lhbiA8YXJ0dXJwQHN5bm9wc3lzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzIvY29yZS5j
IHwgNiArKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5jDQpp
bmRleCBmYjQ3MWQxOGEzZGUuLmZiYmQ2YTJmMTBhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNi
L2R3YzIvY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuYw0KQEAgLTUzMiw2ICs1
MzIsMTIgQEAgaW50IGR3YzJfY29yZV9yZXNldChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGJv
b2wgc2tpcF93YWl0KQ0KIAlncmVzZXQgfD0gR1JTVENUTF9DU0ZUUlNUOw0KIAlkd2MyX3dyaXRl
bChoc290ZywgZ3Jlc2V0LCBHUlNUQ1RMKTsNCiANCisJLyogQ2xlYXIgZmlmb19tYXAgKi8NCisJ
I2lmIElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MyX1BFUklQSEVSQUwpIHx8IFwNCisJCUlTX0VO
QUJMRUQoQ09ORklHX1VTQl9EV0MyX0RVQUxfUk9MRSkNCisJaHNvdGctPmZpZm9fbWFwID0gMDsN
CisJI2VuZGlmIC8qIENPTkZJR19VU0JfRFdDMl9QRVJJUEhFUkFMIHx8IENPTkZJR19VU0JfRFdD
Ml9EVUFMX1JPTEUgKi8NCisNCiAJaWYgKGR3YzJfaHNvdGdfd2FpdF9iaXRfY2xlYXIoaHNvdGcs
IEdSU1RDVEwsIEdSU1RDVExfQ1NGVFJTVCwgNTApKSB7DQogCQlkZXZfd2Fybihoc290Zy0+ZGV2
LCAiJXM6IEhBTkchIFNvZnQgUmVzZXQgdGltZW91dCBHUlNUQ1RMIEdSU1RDVExfQ1NGVFJTVFxu
IiwNCiAJCQkgX19mdW5jX18pOw0KLS0gDQoyLjExLjANCg0K
