Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133FBC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA5A620645
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TV8YeGi4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="g7922yCU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfDSSxP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:53:15 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37876 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726617AbfDSSxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:53:13 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27AB2C0BB3;
        Fri, 19 Apr 2019 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555673140; bh=3+OWqljKOhllTHGqBwsKDFdnlsuy2HtQbqn/qoSNzsE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TV8YeGi4f1P5TYX5E4+TUkXJta2iFge+xW+JkCDSRtQfABJZHzoFBUizgSJ8qOFpr
         eV3EyQv5m1RxrUxoMDG576rE6fZFTo8mzr+fN7zgQrigJq0bLmPeM1ODESTAgMmKGX
         jQKg0qjlJt3U0ZfV0R0hi4k949HA30s/rMmEQeNRfA7PY5mLJN6DfvYZpFDNdD93go
         mN6IxgHpQgb91QxZR6Gtbb4nuxVVI8+tyVlv2B6T3Rqyl5C794n3GPcujEEJv9Nkza
         AuNkTtgKur5iAEV8KPgu9YlVtFE2KvOxwBm71DqNn95dFjT/HDu4sSMdUjfI9MxoJk
         7tCWA+ZRGNIQQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 330C0A005D;
        Fri, 19 Apr 2019 11:25:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 19 Apr 2019 04:25:41 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Apr 2019 04:25:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+OWqljKOhllTHGqBwsKDFdnlsuy2HtQbqn/qoSNzsE=;
 b=g7922yCUc0i6l2bQbXLyaCHK3Bp3/LUgNLFa57rXIKo25koRCU65vnCu40w5Wpws4C2T/IDbkHj3PVR0P3VBGoQARnYdnDKMLotUPTW//H0t/hRALHffE1nVbnOV3D4NgvIbkDUJpWcziceVVt5w07HqAqHVkP/U3hoF9fki9ho=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2383.namprd12.prod.outlook.com (52.132.194.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Fri, 19 Apr 2019 11:25:39 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 11:25:39 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH v1 13/14] usb: dwc2: Clear GINTSTS_RESTOREDONE bit after
 restore is generated.
Thread-Topic: [PATCH v1 13/14] usb: dwc2: Clear GINTSTS_RESTOREDONE bit after
 restore is generated.
Thread-Index: AQHU9qKd5P7G2ijNmEC+t7Pivs4GBw==
Date:   Fri, 19 Apr 2019 11:25:38 +0000
Message-ID:
 <73d2c9aca58e7cac50d02bbbd853c23ab0463b48.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0015.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::25) To SN1PR12MB2431.namprd12.prod.outlook.com
 (2603:10b6:802:27::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.53.141.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b44aa05b-fd90-4fbd-3e90-08d6c4b9bf4c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2383;
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-microsoft-antispam-prvs: <SN1PR12MB238316C44008F304E9142650A7270@SN1PR12MB2383.namprd12.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(6436002)(102836004)(486006)(26005)(186003)(386003)(4326008)(305945005)(2906002)(6506007)(446003)(76176011)(7736002)(97736004)(5660300002)(81156014)(66476007)(11346002)(81166006)(66556008)(6486002)(476003)(256004)(14444005)(53936002)(25786009)(107886003)(71190400001)(71200400001)(86362001)(6512007)(99286004)(54906003)(110136005)(316002)(2616005)(68736007)(8676002)(66066001)(6116002)(36756003)(14454004)(478600001)(2501003)(8936002)(118296001)(3846002)(66446008)(52116002)(64756008)(66946007)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xQVa7bEgG77eI784cpmxqgw2qRCrGVsTcli1XBZEaAsPr09gjKr6uE9464kBoaoSGUZrYmRYUzGzcfLUb/YZLbjd37DNEerZAam98P+btQJ4P2uzHe0/o01kJI/MLaGpb0l7u0i8IXVXDX+2MkfO2ZD9Tq+5FbkSqz2NgIiQIyhXD925AG1sEELMZl/Yl8YSFTTSgC4Y2zLoeSIbIP+f//6zvzx/48N7ARJ0lXZmpDgF5b4x9SjnT6kpsTtKPjogNrUht9KkAPV04T+++f61KglPM7ZdMiFDLv76jCT/gjtaLVD3T6McCY0VioOnaVT3H0X49usxy0S0rkqFQmOMcYx4RgCuSiFhVhzwfVMqkr/AoF4l3DnTqW3tr6WUcwNJSXEn+1GLpTzt5XNg0yWr5WxY0JmiV0DqMDOAFJX0EqU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b44aa05b-fd90-4fbd-3e90-08d6c4b9bf4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 11:25:38.8861
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
Message-ID: <20190419112538.hpaZA1HCgK3v4yX-8koAyDJWoMwegKalGnzvTK63VfI@z>

V2hlbiBoaWJlcm5hdGlvbiBleGl0IGlzIHBlcmZvcm1lZCB0aGUgZHdjMl9oaWJfcmVzdG9yZV9j
b21tb24oKQ0KZnVuY3Rpb24gaXMgY2FsbGVkLiBJbiB0aGF0IGZ1bmN0aW9uIHdlIHdhaXQgdW50
aWwgR0lOVFNUU19SRVNUT1JFRE9ORQ0KYml0IGlzIHNldC4gSG93ZXZlciwgYWZ0ZXIgdGhlIHNl
dHRpbmcgb2YgdGhhdCBiaXQgd2UgZ2V0IGEgbG90IG9mDQooZHdjMl9oc290Z19pcnE6KSBpbnRl
cnJ1cHRzIHdoaWNoIGluZGljYXRlcyB0aGF0IChHSU5UU1RTLlJzdHJEb25lSW50KQ0KcmVzdG9y
ZSBkb25lIGludGVycnVwdCBpcyBhc3NlcnRlZC4NCg0KVG8gYXZvaWQgcmVzdG9yZSBkb25lIGlu
dGVycnVwdCBzdG9ybSBhZnRlciByZXN0b3JlIGlzIGdlbmVyYXRlZA0KY2xlYXIgR0lOVFNUU19S
RVNUT1JFRE9ORSBiaXQgaW4gR0lOVFNUUyByZWdpc3Rlci4NCg0KU2lnbmVkLW9mZi1ieTogQXJ0
dXIgUGV0cm9zeWFuIDxhcnR1cnBAc3lub3BzeXMuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZHdj
Mi9jb3JlLmMgfCA2ICsrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMi9j
b3JlLmMNCmluZGV4IGZiYmQ2YTJmMTBhZC4uMThlYTBkODk2ZTEyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy91c2IvZHdjMi9jb3JlLmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5jDQpAQCAt
MzgyLDYgKzM4MiwxMiBAQCB2b2lkIGR3YzJfaGliX3Jlc3RvcmVfY29tbW9uKHN0cnVjdCBkd2My
X2hzb3RnICpoc290ZywgaW50IHJlbV93YWtldXAsDQogCQkJX19mdW5jX18pOw0KIAl9IGVsc2Ug
ew0KIAkJZGV2X2RiZyhoc290Zy0+ZGV2LCAicmVzdG9yZSBkb25lICBnZW5lcmF0ZWQgaGVyZVxu
Iik7DQorDQorCQkvKg0KKwkJICogVG8gYXZvaWQgcmVzdG9yZSBkb25lIGludGVycnVwdCBzdG9y
bSBhZnRlciByZXN0b3JlIGlzDQorCQkgKiBnZW5lcmF0ZWQgY2xlYXIgR0lOVFNUU19SRVNUT1JF
RE9ORSBiaXQuDQorCQkgKi8NCisJCWR3YzJfd3JpdGVsKGhzb3RnLCBHSU5UU1RTX1JFU1RPUkVE
T05FLCBHSU5UU1RTKTsNCiAJfQ0KIH0NCiANCi0tIA0KMi4xMS4wDQoNCg==
