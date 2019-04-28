Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B84C43218
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B166520881
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XDIigZRx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfD1CvO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:14 -0400
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:39943
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbfD1CvO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI9UAB9Bwcyy2EkxsG9arvarMnyGA5oyrj0vNhrbVUA=;
 b=XDIigZRxXxWNJu8bPHQDNpt0Y/kmcTZ9fW+9ao6VQv2ZjeB7btpzFRqtVwVCO3yss8jbPIIDxRwPCzZttVWzvhv6UsS42rIKd92Sf5flAmk+4Q7dzt9cSyO18UDt1eYseJ4KmMKQ5cIKnKFLi1A7rpqqJqfaonrCgoHDVOBLWoM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:09 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/7] Add imx7ulp USBOTG1 support
Thread-Topic: [PATCH 0/7] Add imx7ulp USBOTG1 support
Thread-Index: AQHU/W07aXXa/S5qDE2YJrRRATIEgA==
Date:   Sun, 28 Apr 2019 02:51:09 +0000
Message-ID: <20190428024847.5046-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: HK0PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f84de0c-d80d-414f-9eb8-08d6cb845de9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB31849F867EE4F808AD4FA34C8B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1pLFadeYu4Qrar21nnMVnYNN+EERQ7VM0JWdgVW/zOs/fdzHBQBPzYsy3PQiUX5O8M1Dyj5oIomGZRjT9dQIWgZcBlGNalBo3D4BqAr0OnhhRNXtXXh01MsL+5GFA4nJjfyNhu3Y6QNBV4Z1QvSIqJxZmQqWarrfmkxN/Ppo8t5Fsu3/y0uB7QPe172qFT8JuQTaZ2olLBSDoaPNa3JrXg8PJj110sO7K9Biq+NqZuq/VbWa2XxPBLuhzH3L6qvhex+IElkPvdarzjRdT7aXsE/vkDZrdXjhyXINC+TdjPBq4nXccmipE43bst7EERKQAJ9WKV8W/wdBYeiC1XmO7XyUR+1cZPNYZgnfEl1xdQCwDaWP8mETffg3aRpoMnIqeUcgsTqlMrYj1hfRez6+zzhp9HbuV/QEJIDA584Vm6w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f84de0c-d80d-414f-9eb8-08d6cb845de9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:09.6410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhlcmUgaXMgYSBkdWFsLXJvbGUgVVNCIGNvbnRyb2xsZXIgYXQgaW14N3VscCwgd2UgYWRkIHN1
cHBvcnQgZm9yIGl0DQppbiB0aGlzIHBhdGNoIHNldCwgYW5kIHRoZSBkdWFsLXJvbGUgZnVuY3Rp
b24gaXMgdGVzdGVkIGF0IGlteDd1bHAtZXZrDQpib2FyZC4NCg0KVGhhbmtzLg0KDQpQZXRlciBD
aGVuICg3KToNCiAgZG9jOiBkdC1iaW5kaW5nOiBteHMtdXNiLXBoeTogYWRkIGNvbXBhdGlibGUg
Zm9yIDd1bHANCiAgdXNiOiBwaHk6IHBoeS1teHMtdXNiOiBhZGQgaW14N3VscCBzdXBwb3J0DQog
IGRvYzogZHQtYmluZGluZzogY2ktaGRyYy11c2IyOiBhZGQgY29tcGF0aWJsZSBzdHJpbmcgZm9y
IGlteDd1bHANCiAgZG9jOiBkdC1iaW5kaW5nOiB1c2JtaXNjLWlteDogYWRkIGNvbXBhdGlibGUg
c3RyaW5nIGZvciBpbXg3dWxwDQogIHVzYjogY2hpcGlkZWE6IGlteDogYWRkIGlteDd1bHAgc3Vw
cG9ydA0KICBBUk06IGR0czogaW14N3VscDogYWRkIGlteDd1bHAgVVNCT1RHMSBzdXBwb3J0DQog
IEFSTTogZHRzOiBpbXg3dWxwLWV2azogZW5hYmxlIFVTQk9URzEgc3VwcG9ydA0KDQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGh5L214cy11c2ItcGh5LnR4dCAgICAgICAgfCAgMSArDQogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQgICAgICAgfCAgMSArDQog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYm1pc2MtaW14LnR4dCAgICAgICAgfCAgMSAr
DQogYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC1ldmsuZHRzICAgICAgICAgICAgICAgICAgfCAz
NSArKysrKysrKysrDQogYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpICAgICAgICAgICAg
ICAgICAgICAgfCAzMCArKysrKysrKysNCiBkcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lt
eC5jICAgICAgICAgICAgICAgICB8IDI4ICsrKysrKystDQogZHJpdmVycy91c2IvY2hpcGlkZWEv
dXNibWlzY19pbXguYyAgICAgICAgICAgICAgICAgfCAgNCArKw0KIGRyaXZlcnMvdXNiL3BoeS9w
aHktbXhzLXVzYi5jICAgICAgICAgICAgICAgICAgICAgIHwgNzYgKysrKysrKysrKysrKysrKysr
KysrLQ0KIGluY2x1ZGUvbGludXgvdXNiL2NoaXBpZGVhLmggICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KIDkgZmlsZXMgY2hhbmdlZCwgMTc1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQoNCi0tIA0KMi4xNC4xDQoNCg==
