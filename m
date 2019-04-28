Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFE5C43218
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B7202077B
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gu8ESum5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfD1Cv1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:27 -0400
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:17610
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfD1Cv1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv78rGRwnIc8pbXN7hi4mMEcdntfmcaK6FHDWWMLRPA=;
 b=gu8ESum5lG4OysfTOiMLt6NO8f0RUNMOMf/jRKiPoi00vXAm+pSSp8vS4WYdwMjOwI9F/m8hsSnC17b2bUUwmwqkbmHlGYMk9g43eEDDCIT27GBFTXdfC80MoF2F2ectHoS8EMjQ7xn0ReNzu/JaOp53byLs3Z3mefPmsGgJ690=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:20 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:20 +0000
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
Subject: [PATCH 3/7] doc: dt-binding: ci-hdrc-usb2: add compatible string for
 imx7ulp
Thread-Topic: [PATCH 3/7] doc: dt-binding: ci-hdrc-usb2: add compatible string
 for imx7ulp
Thread-Index: AQHU/W1CAG8iq5FVFUexQGYuknByQw==
Date:   Sun, 28 Apr 2019 02:51:20 +0000
Message-ID: <20190428024847.5046-4-peter.chen@nxp.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
In-Reply-To: <20190428024847.5046-1-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 169826f4-35c9-4188-a1d6-08d6cb84644d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB318431DE52D3B3ED3DAAFCD28B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(4744005)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WigY6Dvwyz1jvIbD0TiOUmgViXe5MZFeXb1IBgshr9CgvusXfBDmC/M5uFV5i+eZGROqzA7zJqtVi7KBykdNtda+pxia6s95z+GTYi8utwEfx+74tmNY+DMTz0nVihqqK4Wav88kXBAQoJw2KCtBEu+LGHt3oQ+rVy+pdjyqTnIMcLeQTYq6FtTsrHfaZMCCOa+FnPudNKMJ6QOP9Rlgnos+jR8k8kXEPvvpFow3xg339Dj7shGncXV9zBxnv68bpPc/7GJR939lu3WAWZYN6KT5LbdkrQI2I9hQMv0fVCKveCQRsQbbkTZqPg75o1KGA8g641g/jAS5ZHAdaDVUyGSVlRC36RfCmzxMUdgvxPbOHXL4OcjKc61NXY4eByIlHTstnn35R2D0PsSF68YUKez42v88zJ4PA0el4XHYiWA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169826f4-35c9-4188-a1d6-08d6cb84644d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:20.3428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025120.E6Y7dNfuRGqfJC9dkd098tbCpYI8QgG7-HbU-jk3OXA@z>

QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpbXg3dWxwLg0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBDaGVuIDxwZXRlci5jaGVuQG54cC5jb20+DQotLS0NCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnR4dA0KaW5kZXggYTI1NDM4NmE5MWFkLi5jZmM5ZjQw
YWI2NDEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2NpLWhkcmMtdXNiMi50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvY2ktaGRyYy11c2IyLnR4dA0KQEAgLTEwLDYgKzEwLDcgQEAgUmVxdWlyZWQgcHJvcGVy
dGllczoNCiAJImZzbCxpbXg2c3gtdXNiIg0KIAkiZnNsLGlteDZ1bC11c2IiDQogCSJmc2wsaW14
N2QtdXNiIg0KKwkiZnNsLGlteDd1bHAtdXNiIg0KIAkibHNpLHpldmlvLXVzYiINCiAJInFjb20s
Y2ktaGRyYyINCiAJImNoaXBpZGVhLHVzYjIiDQotLSANCjIuMTQuMQ0KDQo=
