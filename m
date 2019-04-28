Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FFBC43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 481BB2077B
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 02:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eha+peVJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfD1Cvn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 22:51:43 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:24224
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726452AbfD1Cvn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 22:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScdzH1JLqvWbk8b7GZ/9vTR/SVkrZt44Dme/fKiR8l0=;
 b=eha+peVJ3FUCFcbGXYJFeHDAqPjDd2ZqFctZogO4sIeQTHcic0lsOTdzUek5koDEB+aZKHYOaEFvU5WNc+NXxaeusZqMZvw5c7fbcxWYJ3thKctmlx6DM7wy6ByWkbrmX2wKrym4Tn/TXW/fRMEYLAUaEHXpovEGEYRyAvtPd5c=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3184.eurprd04.prod.outlook.com (10.170.229.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:51:35 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1835.015; Sun, 28 Apr 2019
 02:51:35 +0000
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
Subject: [PATCH 5/7] usb: chipidea: imx: add imx7ulp support
Thread-Topic: [PATCH 5/7] usb: chipidea: imx: add imx7ulp support
Thread-Index: AQHU/W1Gs4qO/Nf1PU+KrZAvrrRjsg==
Date:   Sun, 28 Apr 2019 02:51:27 +0000
Message-ID: <20190428024847.5046-6-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 35409ec2-f912-4902-b540-08d6cb84688a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3184;
x-ms-traffictypediagnostic: VI1PR04MB3184:
x-microsoft-antispam-prvs: <VI1PR04MB31843B55381EE51AFDA424548B380@VI1PR04MB3184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:299;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(6436002)(5660300002)(8936002)(36756003)(6486002)(26005)(52116002)(14454004)(71200400001)(99286004)(71190400001)(6116002)(76176011)(186003)(2906002)(110136005)(1076003)(54906003)(316002)(102836004)(6506007)(386003)(81156014)(25786009)(2501003)(3846002)(6666004)(73956011)(66946007)(4326008)(66446008)(66556008)(66476007)(64756008)(8676002)(81166006)(305945005)(97736004)(68736007)(53936002)(6512007)(486006)(7736002)(66066001)(478600001)(50226002)(446003)(11346002)(14444005)(256004)(2616005)(476003)(86362001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3184;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e7XEF9O9YCIUbinVFlDatfrz1dzfgXKkf+ecTbSsI9f+w1VB4zN7HPSKgdLw7DPC3tT5Ee4hg+Z7qQ4uvZGjiYne+p9qtobaw23WqDnsCkBf3CxerCi3J5xNkZk0HEGX6MkqjuQ/+MGXHqq/t9J0mnqiIJGHdX+r1G79r7OFiakgkzNhfmyID/HJJJLILmzZjGnRk+mkaed9K87po8dJkooVxbcb/kvJlc1iKjomHSS0rByJWue3xWguiNAlWxPX/zVex2C/Hn1oyGkTYjUtr3AKL7tQTZgwZyl9JrbSn3QKDhJac78s6xQO8OAovnxE1au5Y6QOTb/Q4IKPLxsYpnlnamgq5KVW625F6ofEl639WICIvglDrS3obwjVBpUNqIthQNIVXvi9siXkUUcebqgd7KMFAJPa9nOfp5C0vDg=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35409ec2-f912-4902-b540-08d6cb84688a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:51:27.2878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428025127.TaDAnQMMRe1xaHRDyHa26vasjST2lFYPbZ3569BHl2w@z>

QWRkIGlteDd1bHAgc3VwcG9ydA0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5j
aGVuQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jIHwg
MjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KIGRyaXZlcnMvdXNiL2NoaXBpZGVhL3Vz
Ym1pc2NfaW14LmMgfCAgNCArKysrDQogaW5jbHVkZS9saW51eC91c2IvY2hpcGlkZWEuaCAgICAg
ICB8ICAxICsNCiAzIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMgYi9k
cml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jDQppbmRleCBjZWVjOGQ1OTg1ZDQuLmE3
NjcwODUwMTIzNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMNCkBAIC0xMyw2ICsx
Myw3IEBADQogI2luY2x1ZGUgPGxpbnV4L3VzYi9vZi5oPg0KICNpbmNsdWRlIDxsaW51eC9jbGsu
aD4NCiAjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPg0KKyNpbmNsdWRlIDxsaW51
eC9wbV9xb3MuaD4NCiANCiAjaW5jbHVkZSAiY2kuaCINCiAjaW5jbHVkZSAiY2lfaGRyY19pbXgu
aCINCkBAIC02Myw2ICs2NCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNpX2hkcmNfaW14X3Bs
YXRmb3JtX2ZsYWcgaW14N2RfdXNiX2RhdGEgPSB7DQogCS5mbGFncyA9IENJX0hEUkNfU1VQUE9S
VFNfUlVOVElNRV9QTSwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2lfaGRyY19pbXhf
cGxhdGZvcm1fZmxhZyBpbXg3dWxwX3VzYl9kYXRhID0gew0KKwkuZmxhZ3MgPSBDSV9IRFJDX1NV
UFBPUlRTX1JVTlRJTUVfUE0gfA0KKwkJQ0lfSERSQ19QTVFPUywNCit9Ow0KKw0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGNpX2hkcmNfaW14X2R0X2lkc1tdID0gew0KIAl7IC5j
b21wYXRpYmxlID0gImZzbCxpbXgyMy11c2IiLCAuZGF0YSA9ICZpbXgyM191c2JfZGF0YX0sDQog
CXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDI4LXVzYiIsIC5kYXRhID0gJmlteDI4X3VzYl9kYXRh
fSwNCkBAIC03Miw2ICs3OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGNp
X2hkcmNfaW14X2R0X2lkc1tdID0gew0KIAl7IC5jb21wYXRpYmxlID0gImZzbCxpbXg2c3gtdXNi
IiwgLmRhdGEgPSAmaW14NnN4X3VzYl9kYXRhfSwNCiAJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14
NnVsLXVzYiIsIC5kYXRhID0gJmlteDZ1bF91c2JfZGF0YX0sDQogCXsgLmNvbXBhdGlibGUgPSAi
ZnNsLGlteDdkLXVzYiIsIC5kYXRhID0gJmlteDdkX3VzYl9kYXRhfSwNCisJeyAuY29tcGF0aWJs
ZSA9ICJmc2wsaW14N3VscC11c2IiLCAuZGF0YSA9ICZpbXg3dWxwX3VzYl9kYXRhfSwNCiAJeyAv
KiBzZW50aW5lbCAqLyB9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBjaV9oZHJjX2lt
eF9kdF9pZHMpOw0KQEAgLTkzLDYgKzEwMCw4IEBAIHN0cnVjdCBjaV9oZHJjX2lteF9kYXRhIHsN
CiAJc3RydWN0IGNsayAqY2xrX2FoYjsNCiAJc3RydWN0IGNsayAqY2xrX3BlcjsNCiAJLyogLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICovDQorCXN0cnVjdCBwbV9xb3NfcmVxdWVz
dCBwbV9xb3NfcmVxOw0KKwljb25zdCBzdHJ1Y3QgY2lfaGRyY19pbXhfcGxhdGZvcm1fZmxhZyAq
cGxhdF9kYXRhOw0KIH07DQogDQogLyogQ29tbW9uIGZ1bmN0aW9ucyBzaGFyZWQgYnkgdXNibWlz
YyBkcml2ZXJzICovDQpAQCAtMzA5LDYgKzMxOCw4IEBAIHN0YXRpYyBpbnQgY2lfaGRyY19pbXhf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJaWYgKCFkYXRhKQ0KIAkJcmV0
dXJuIC1FTk9NRU07DQogDQorCWRhdGEtPnBsYXRfZGF0YSA9IGlteF9wbGF0Zm9ybV9mbGFnOw0K
KwlwZGF0YS5mbGFncyB8PSBpbXhfcGxhdGZvcm1fZmxhZy0+ZmxhZ3M7DQogCXBsYXRmb3JtX3Nl
dF9kcnZkYXRhKHBkZXYsIGRhdGEpOw0KIAlkYXRhLT51c2JtaXNjX2RhdGEgPSB1c2JtaXNjX2dl
dF9pbml0X2RhdGEoZGV2KTsNCiAJaWYgKElTX0VSUihkYXRhLT51c2JtaXNjX2RhdGEpKQ0KQEAg
LTM2OSw2ICszODAsMTEgQEAgc3RhdGljIGludCBjaV9oZHJjX2lteF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJCX0NCiAJCX0NCiAJfQ0KKw0KKwlpZiAocGRhdGEuZmxh
Z3MgJiBDSV9IRFJDX1BNUU9TKQ0KKwkJcG1fcW9zX2FkZF9yZXF1ZXN0KCZkYXRhLT5wbV9xb3Nf
cmVxLA0KKwkJCVBNX1FPU19DUFVfRE1BX0xBVEVOQ1ksIDApOw0KKw0KIAlyZXQgPSBpbXhfZ2V0
X2Nsa3MoZGV2KTsNCiAJaWYgKHJldCkNCiAJCWdvdG8gZGlzYWJsZV9oc2ljX3JlZ3VsYXRvcjsN
CkBAIC0zOTYsNyArNDEyLDYgQEAgc3RhdGljIGludCBjaV9oZHJjX2lteF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJdXNiX3BoeV9pbml0KHBkYXRhLnVzYl9waHkpOw0K
IAl9DQogDQotCXBkYXRhLmZsYWdzIHw9IGlteF9wbGF0Zm9ybV9mbGFnLT5mbGFnczsNCiAJaWYg
KHBkYXRhLmZsYWdzICYgQ0lfSERSQ19TVVBQT1JUU19SVU5USU1FX1BNKQ0KIAkJZGF0YS0+c3Vw
cG9ydHNfcnVudGltZV9wbSA9IHRydWU7DQogDQpAQCAtNDM5LDYgKzQ1NCw4IEBAIHN0YXRpYyBp
bnQgY2lfaGRyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiBkaXNh
YmxlX2hzaWNfcmVndWxhdG9yOg0KIAlpZiAoZGF0YS0+aHNpY19wYWRfcmVndWxhdG9yKQ0KIAkJ
cmV0ID0gcmVndWxhdG9yX2Rpc2FibGUoZGF0YS0+aHNpY19wYWRfcmVndWxhdG9yKTsNCisJaWYg
KHBkYXRhLmZsYWdzICYgQ0lfSERSQ19QTVFPUykNCisJCXBtX3Fvc19yZW1vdmVfcmVxdWVzdCgm
ZGF0YS0+cG1fcW9zX3JlcSk7DQogCXJldHVybiByZXQ7DQogfQ0KIA0KQEAgLTQ1NSw2ICs0NzIs
OCBAQCBzdGF0aWMgaW50IGNpX2hkcmNfaW14X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAlpZiAoZGF0YS0+b3ZlcnJpZGVfcGh5X2NvbnRyb2wpDQogCQl1c2JfcGh5X3No
dXRkb3duKGRhdGEtPnBoeSk7DQogCWlteF9kaXNhYmxlX3VucHJlcGFyZV9jbGtzKCZwZGV2LT5k
ZXYpOw0KKwlpZiAoZGF0YS0+cGxhdF9kYXRhLT5mbGFncyAmIENJX0hEUkNfUE1RT1MpDQorCQlw
bV9xb3NfcmVtb3ZlX3JlcXVlc3QoJmRhdGEtPnBtX3Fvc19yZXEpOw0KIAlpZiAoZGF0YS0+aHNp
Y19wYWRfcmVndWxhdG9yKQ0KIAkJcmVndWxhdG9yX2Rpc2FibGUoZGF0YS0+aHNpY19wYWRfcmVn
dWxhdG9yKTsNCiANCkBAIC00ODAsNiArNDk5LDkgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBpbXhfY29udHJvbGxlcl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJfQ0KIA0KIAlp
bXhfZGlzYWJsZV91bnByZXBhcmVfY2xrcyhkZXYpOw0KKwlpZiAoZGF0YS0+cGxhdF9kYXRhLT5m
bGFncyAmIENJX0hEUkNfUE1RT1MpDQorCQlwbV9xb3NfcmVtb3ZlX3JlcXVlc3QoJmRhdGEtPnBt
X3Fvc19yZXEpOw0KKw0KIAlkYXRhLT5pbl9scG0gPSB0cnVlOw0KIA0KIAlyZXR1cm4gMDsNCkBA
IC00OTcsNiArNTE5LDEwIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaW14X2NvbnRyb2xs
ZXJfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJCXJldHVybiAwOw0KIAl9DQogDQorCWlm
IChkYXRhLT5wbGF0X2RhdGEtPmZsYWdzICYgQ0lfSERSQ19QTVFPUykNCisJCXBtX3Fvc19hZGRf
cmVxdWVzdCgmZGF0YS0+cG1fcW9zX3JlcSwNCisJCQlQTV9RT1NfQ1BVX0RNQV9MQVRFTkNZLCAw
KTsNCisNCiAJcmV0ID0gaW14X3ByZXBhcmVfZW5hYmxlX2Nsa3MoZGV2KTsNCiAJaWYgKHJldCkN
CiAJCXJldHVybiByZXQ7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvdXNibWlz
Y19pbXguYyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VzYm1pc2NfaW14LmMNCmluZGV4IGQ4YjY3
ZTE1MGIxMi4uYjdhNTcyN2QwYzhhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvY2hpcGlkZWEv
dXNibWlzY19pbXguYw0KKysrIGIvZHJpdmVycy91c2IvY2hpcGlkZWEvdXNibWlzY19pbXguYw0K
QEAgLTc2Myw2ICs3NjMsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdXNi
bWlzY19pbXhfZHRfaWRzW10gPSB7DQogCQkuY29tcGF0aWJsZSA9ICJmc2wsaW14N2QtdXNibWlz
YyIsDQogCQkuZGF0YSA9ICZpbXg3ZF91c2JtaXNjX29wcywNCiAJfSwNCisJew0KKwkJLmNvbXBh
dGlibGUgPSAiZnNsLGlteDd1bHAtdXNibWlzYyIsDQorCQkuZGF0YSA9ICZpbXg3ZF91c2JtaXNj
X29wcywNCisJfSwNCiAJeyAvKiBzZW50aW5lbCAqLyB9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCB1c2JtaXNjX2lteF9kdF9pZHMpOw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
dXNiL2NoaXBpZGVhLmggYi9pbmNsdWRlL2xpbnV4L3VzYi9jaGlwaWRlYS5oDQppbmRleCA5MTFl
MDVhZjY3MWUuLmVkZDg5YjdjOGYxOCAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvdXNiL2No
aXBpZGVhLmgNCisrKyBiL2luY2x1ZGUvbGludXgvdXNiL2NoaXBpZGVhLmgNCkBAIC02MSw2ICs2
MSw3IEBAIHN0cnVjdCBjaV9oZHJjX3BsYXRmb3JtX2RhdGEgew0KICNkZWZpbmUgQ0lfSERSQ19P
VkVSUklERV9QSFlfQ09OVFJPTAlCSVQoMTIpIC8qIEdsdWUgbGF5ZXIgbWFuYWdlcyBwaHkgKi8N
CiAjZGVmaW5lIENJX0hEUkNfUkVRVUlSRVNfQUxJR05FRF9ETUEJQklUKDEzKQ0KICNkZWZpbmUg
Q0lfSERSQ19JTVhfSVNfSFNJQwkJQklUKDE0KQ0KKyNkZWZpbmUgQ0lfSERSQ19QTVFPUwkJCUJJ
VCgxNSkNCiAJZW51bSB1c2JfZHJfbW9kZQlkcl9tb2RlOw0KICNkZWZpbmUgQ0lfSERSQ19DT05U
Uk9MTEVSX1JFU0VUX0VWRU5UCQkwDQogI2RlZmluZSBDSV9IRFJDX0NPTlRST0xMRVJfU1RPUFBF
RF9FVkVOVAkxDQotLSANCjIuMTQuMQ0KDQo=
