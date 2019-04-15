Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF640C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0B9120825
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="PtA4LB4Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfDON3W (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 09:29:22 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:32518 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727186AbfDON3V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 09:29:21 -0400
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 2C/7C-23123-B2784BC5; Mon, 15 Apr 2019 13:29:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSWUwTURTt60ynAzLyKGivCCbWJXFppS60aqL
  G+FGjRjQaE0VxoENb05am0yqaaOoCKKRBI2pECygoiW1ECCa4oeJaotFAjDuRWBUX3GrciEun
  U1z+zr3n3HvOe7k0oeigUmmu0MU57axVRcWT5glx09XjSpqzM3Z0jdZvrW2g9G+u7ZPqS/2nS
  H3rh+NS/eGjRYQ+dOiGdBZlqGlyG6qCiwznfQG54V3rHcpw6otHbgg3Dcuilsss9tyCwtUyc9
  Nbr9TRpyn0VQ/2oICmFMXTJG4g4FxFn0woFHiPFHZXlVNi0Y3Ae+JkpIijKayH3defRIkU/Bx
  Be4dfXopomsArYH9nuqBJxkvgRGVALuAUvBR2FO0jRTwbQjfC0T0kHgWN3q6ohsEsfHpQj0Sz
  iwj8Xa+jojg8A7YFz0SHEU6HT5v9hIAJrIQHoWqpgAFjqDt7ixDxIHj59KdM1HMQ3HIPif3xc
  PNuCAk5AQ8H7xNSbKdDR3VZrL0AerxpQgTAjxCUH/ks6x/tPL4rZqWHurKi2KwDPtb2xjRpsP
  3qj5iVh4JH3xkBK3AevPfdlIv9YXDM202KBrcJePG4mRD/bQw0nJ6wE42p/OdllX8ZsT0cKsq
  65ZXR30qC4P4QWYPIY0iX67SYzC4ba7GqtRkZaq12olo7dYpal6lhN6hZDedWr+N4l1qrYdfx
  Gn69Lc9q1Ng5VxOKXJbRcWl+C+qqN7WhIbRUNYhpdDdnKwbmFhjXm1nenON0Wzm+DaXRtAqY9
  qIIl+TkTFxhvsUaOc9+GugEVQrjFGiGd7A23mISqXY0ib5wuNtH0L0XX/gIBWkvsHOpSiYsSL
  EgNbvtfxb1n3oHSk9NZpBEIlEkODinzeL6n3+FlDRSJTPlwpYEi931x+9VJIo0EqVivF+I4mL
  /UqketEsXmqO7v7KzZOjc195SSfXGl1kLe0ft3FoxIjFHlz10sXtelXvT6hnFwdpipXGbPHCn
  /sDMnGVX8s8ltlLXwiUXilOULcsyJQMvfz30bI42kLDWGP/B1PPZvoTwtLX02C7vDU/O8/yaN
  npk8aWjQ/q+hVadzRywaFNm3pqD5/Pjvj1coyJ5M6sdSzh59jdYZRu15QMAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-19.tower-268.messagelabs.com!1555334954!5375015!1
X-Originating-IP: [104.47.9.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31787 invoked from network); 15 Apr 2019 13:29:15 -0000
Received: from mail-ve1eur03lp2059.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.59)
  by server-19.tower-268.messagelabs.com with AES256-SHA256 encrypted SMTP; 15 Apr 2019 13:29:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvQKfKaeg6u2pCQXLp/bzpFrYvovrdzdE4BtQLxizXA=;
 b=PtA4LB4QyPn5z+FOtCPW0O7/PUuYt6skAajkX0PFMDzGZV2GDx/DvuvAb+J3S8lRfJAh3W4qML37r3Q2psCe/cj2aQnTognYgmlBKIjkZpVsYDiOMqWh5/omNgsCzmosMe64lovb+zfJIf4E4h/otO+kYrkqIhYYW6OC8XQQZaI=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1011.EURPRD10.PROD.OUTLOOK.COM (10.169.154.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Mon, 15 Apr 2019 13:28:51 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%4]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 13:28:51 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
Thread-Topic: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
Thread-Index: AQHU8jkUQ4gr3hBo80qiT37u564Y7KY9CBxggAACAACAAC82IA==
Date:   Mon, 15 Apr 2019 13:28:50 +0000
Message-ID:
 <AM5PR1001MB099485208A9BF446332A38C3802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <AM5PR1001MB0994B21356503AC1041171E7802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <5bf45d6e-3b72-4b99-b05d-54fe96d11a48@redhat.com>
In-Reply-To: <5bf45d6e-3b72-4b99-b05d-54fe96d11a48@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b0c2397-4a19-4dfb-e338-08d6c1a64c73
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1011;
x-ms-traffictypediagnostic: AM5PR1001MB1011:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB10116F431756128EC334E394A72B0@AM5PR1001MB1011.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39850400004)(366004)(396003)(51444003)(51914003)(199004)(189003)(6116002)(3846002)(72206003)(14454004)(74316002)(6436002)(33656002)(25786009)(7696005)(6506007)(305945005)(446003)(7736002)(11346002)(2906002)(229853002)(476003)(102836004)(53546011)(55236004)(186003)(5660300002)(486006)(105586002)(76176011)(478600001)(26005)(106356001)(256004)(14444005)(6246003)(86362001)(71190400001)(71200400001)(54906003)(53936002)(8936002)(68736007)(81166006)(99286004)(4326008)(110136005)(81156014)(316002)(52536014)(66066001)(9686003)(55016002)(97736004)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1011;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LMV9MPfREVgY0Dp7OnKQY4MSSqCxJwmZqGEqviic91znkKcvt7KS5JfLeAhDY8YIamN+o0OP0c0yEKXIw1WL/mFNxffvSRFNOADDClIxsCU1QMArndINjmJbXdgVIBopEsaaQmCeMUyzQLgfwP01p8bQt8EQTfIhMtsUoJL7MktzQ3R44G+bmvWH0mFQuAKMkGwi36e1/8PdGh8TR5MkWJqF9qvunHeSKa0pCfZ9lkAzIL+CDem8v4EYDD93oPx8MF4j3824K5QqpKr5u0lrHBYN1RH2e0IIKxw5JBgLKBDaAEu+9Nmr6z20rEIdd1iWTUY4NJYnVyRwimLzpGmiqfCV+KksSI53FCpSxjgaeU0M8uI23K4IzHvpLAiy791TADuDtr7grSJNiArgPcb8LAXufsEES1LUNpCKVnO78uw=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0c2397-4a19-4dfb-e338-08d6c1a64c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 13:28:51.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1011
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415132850.0FwmGs00pElgQoneEBV02A0keXdtMiIyS2M9uOMiLy0@z>

T24gMTUgQXByaWwgMjAxOSAxMTozOCwgSGFucyBkZSBHb2VkZSB3cm90ZToNCg0KPiBPbiAxNS0w
NC0xOSAxMjozMSwgQWRhbSBUaG9tc29uIHdyb3RlOg0KPiA+IE9uIDEzIEFwcmlsIDIwMTkgMjE6
NDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+ID4NCj4gPj4gU29tZSB0Y3BjIGRldmljZS1kcml2
ZXJzIG5lZWQgdG8gZXhwbGljaXRseSBiZSB0b2xkIHRvIHdhdGNoIGZvcg0KPiA+PiBjb25uZWN0
aW9uIGV2ZW50cywgb3RoZXJ3aXNlIHRoZSB0Y3BjIHdpbGwgbm90IGdlbmVyYXRlIGFueQ0KPiA+
PiBUQ1BNX0NDX0VWRU5UcyBhbmQgZGV2aWNlcyBiZWluZyBwbHVnZ2VkIGludG8gdGhlIFR5cGUt
QyBwb3J0IHdpbGwgbm90IGJlDQo+IG5vdGljZWQuDQo+ID4+DQo+ID4+IEZvciBkdWFsLXJvbGUg
cG9ydHMgdGNwbV9zdGFydF9kcnBfdG9nZ2xpbmcoKSBpcyB1c2VkIHRvIHRlbGwgdGhlDQo+ID4+
IHRjcGMgdG8gd2F0Y2ggZm9yIGNvbm5lY3Rpb24gZXZlbnRzLiBCdXQgZm9yIHNpbmdsZS1yb2xl
IHBvcnRzIHdlJ3ZlDQo+ID4+IHNvIGZhciBiZWVuIGZhbGxpbmcgYmFjayB0byBqdXN0IGNhbGxp
bmcgdGNwbV9zZXRfY2MoKS4gRm9yIHNvbWUNCj4gPj4gdGNwYy1zIHN1Y2ggYXMgdGhlDQo+ID4+
IGZ1c2IzMDIgdGhpcyBpcyBub3QgZW5vdWdoIGFuZCBubyBUQ1BNX0NDX0VWRU5UIHdpbGwgYmUg
Z2VuZXJhdGVkLg0KPiA+Pg0KPiA+PiBUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IHN0YXJ0X3NycF9j
b25uZWN0aW9uX2RldGVjdCBjYWxsYmFjayB0bw0KPiA+PiB0Y3BjX2RldiBhbmQgd2hlbiB0aGlz
IGlzIGltcGxlbWVudGVkIGNhbGxzIHRoaXMgaW4gcGxhY2Ugb2Ygc3RhcnRfZHJwX3RvZ2dsaW5n
DQo+IGZvciBTUlAgZGV2aWNlcy4NCj4gPj4NCj4gPj4gRml4ZXM6IGVhM2I0ZDU1MjNiYygidXNi
OiB0eXBlYzogZnVzYjMwMjogUmVzb2x2ZSBmaXhlZCBwb3dlciByb2xlDQo+ID4+IC4uLiIpDQo+
ID4+IENjOiBBZGFtIFRob21zb24gPEFkYW0uVGhvbXNvbi5PcGVuc291cmNlQGRpYXNlbWkuY29t
Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
Pg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYyB8IDggKysr
KysrKysNCj4gPj4gICBpbmNsdWRlL2xpbnV4L3VzYi90Y3BtLmggICAgICB8IDYgKysrKysrDQo+
ID4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+PiBiL2RyaXZlcnMvdXNi
L3R5cGVjL3RjcG0vdGNwbS5jIGluZGV4IGEyMjMzZDcyYWU3Yy4uMWFmNTRhZjkwYjUwDQo+ID4+
IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+PiAr
KysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+PiBAQCAtMjU1Myw2ICsyNTUz
LDE0IEBAIHN0YXRpYyBib29sIHRjcG1fc3RhcnRfZHJwX3RvZ2dsaW5nKHN0cnVjdA0KPiA+PiB0
Y3BtX3BvcnQgKnBvcnQsDQo+ID4+ICAgCQkJcmV0dXJuIHRydWU7DQo+ID4+ICAgCX0NCj4gPj4N
Cj4gPj4gKwlpZiAocG9ydC0+dGNwYy0+c3RhcnRfc3JwX2Nvbm5lY3Rpb25fZGV0ZWN0ICYmDQo+
ID4+ICsJICAgIHBvcnQtPnBvcnRfdHlwZSAhPSBUWVBFQ19QT1JUX0RSUCkgew0KPiA+PiArCQl0
Y3BtX2xvZ19mb3JjZShwb3J0LCAiU3RhcnQgU1JQIGNvbm5lY3Rpb24gZGV0ZWN0aW9uIik7DQo+
ID4+ICsJCXJldCA9IHBvcnQtPnRjcGMtPnN0YXJ0X3NycF9jb25uZWN0aW9uX2RldGVjdChwb3J0
LT50Y3BjLCBjYyk7DQo+ID4+ICsJCWlmICghcmV0KQ0KPiA+PiArCQkJcmV0dXJuIHRydWU7DQo+
ID4+ICsJfQ0KPiA+PiArDQo+ID4NCj4gPiBJcyBpdCBhIGxpdHRsZSBtaXNsZWFkaW5nIHdoZW4g
cmVhZGluZyB0aGUgc3RhdGUgbWFjaGluZSBjb2RlIHRoYXQNCj4gPiB3ZSdyZSBjYWxsaW5nDQo+
ID4gdGNwbV9zdGFydF9kcnBfdG9nZ2xpbmcoKSB0byBhY3R1YWxseSBzdGFydCBTUlAgZGV0ZWN0
aW9uPyBNYXliZSB3ZQ0KPiA+IGNvdWxkIHJlbmFtZSB0aGlzIGZ1bmN0aW9uIGFuZCB0aGUgYXNz
b2NpYXRlZCBzdGF0ZSB0byBjb3ZlciBib3RoIFNSUA0KPiA+IGFuZCBEUlAsIG9yIGFsdGVybmF0
aXZlbHkgYWRkIGEgbmV3IHN0YXRlIGZvciBTUlBfREVURUNUSU9OLCBqdXN0IHRvDQo+ID4ga2Vl
cCBsb2dnaW5nIGFuZCBjb2RlIHJlYWRhYmlsaXR5IGNsZWFyIGFuZCB0aGVuIG1vdmUgdGhlIGFi
b3ZlIGNvZGUNCj4gPiB0byBhIGRpZmZlcmVudCBmdW5jdGlvbiBqdXN0IGZvciBTUlA/DQo+IA0K
PiBJJ20gbm90IGluIGZhbiBvZiBhZGRpbmcgYSBzZXBhcmF0ZSBzdGF0ZSBmb3IgdGhpcy4gRXZl
biB0aG91Z2ggY29ubmVjdGlvbg0KPiBkZXRlY3Rpb24gaXMgbm90IHJlYWxseSB0b2dnbGluZywg
SSd2ZSBjb25zaWRlcmVkIGNoYW5naW5nIHRjcG1fc3RhcnRfZHJwX3RvZ2dsaW5nDQo+IHRvIHRj
cG1fc3RhcnRfdG9nZ2xpbmcgYW5kIHJlbmFtZSB0aGUgc3RhdGUgdG8gbWF0Y2guDQo+IEkgdGhp
bmsgdGhhdCBpZiB3ZSB3YW50IHRvIGRyb3AgZHJwL0RSUCBmcm9tIHRoZSBuYW1lcywgdGhhdCB1
c2luZw0KPiB0Y3BtX3N0YXJ0X3RvZ2dsaW5nIC8gVE9HR0xJTkcgaXMgdGhlIGJlc3Qgc29sdXRp
b24uDQo+IA0KPiBBbHNvIG5vdGUgdGhhdCBvbiB0aGUgZnVzYjMwMiwgd2hpY2ggaXMgdGhlIHRj
cGMgd2hpY2ggbmVlZHMgU1JQIGNvbm5lY3Rpb24NCj4gZGV0ZWN0aW9uLCB0aGlzIGlzIGRvbmUg
dXNpbmcgdGhlIHRvZ2dsaW5nIGVuZ2luZS4gU28ganVzdCBjaGFuZ2luZyB0aGUgbmFtZXMgZnJv
bQ0KPiBkcnAtdG9nZ2xpbmcgdG8gdG9nZ2xpbmcgc2VlbXMgYmVzdC4NCg0KWWVwLCB0aGF0J3Mg
ZmluZSB3aXRoIG1lLiBUaGFua3MgZm9yIHRoZSBlZmZvcnRzIG9uIHRoaXMuDQoNCj4gDQo+IFJl
Z2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCj4gDQo+ID4NCj4gPiBGdW5jdGlvbmFsbHkgdGhv
dWdoLCB0aGUgY2hhbmdlIG1ha2VzIHNlbnNlIHRvIG1lLg0KPiA+DQo+ID4+ICAgCXJldHVybiBm
YWxzZTsNCj4gPj4gICB9DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Vz
Yi90Y3BtLmggYi9pbmNsdWRlL2xpbnV4L3VzYi90Y3BtLmgNCj4gPj4gaW5kZXgNCj4gPj4gMGM1
MzJjYTNmMDc5Li5iZjJiYmJmMmUyYjIgMTAwNjQ0DQo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgv
dXNiL3RjcG0uaA0KPiA+PiArKysgYi9pbmNsdWRlL2xpbnV4L3VzYi90Y3BtLmgNCj4gPj4gQEAg
LTEyNSw2ICsxMjUsMTAgQEAgc3RydWN0IHRjcGNfY29uZmlnIHsNCj4gPj4gICAgKgkJT3B0aW9u
YWw7IGlmIHN1cHBvcnRlZCBieSBoYXJkd2FyZSwgY2FsbGVkIHRvIHN0YXJ0IERSUA0KPiA+PiAg
ICAqCQl0b2dnbGluZy4gRFJQIHRvZ2dsaW5nIGlzIHN0b3BwZWQgYXV0b21hdGljYWxseSBpZg0K
PiA+PiAgICAqCQlhIGNvbm5lY3Rpb24gaXMgZXN0YWJsaXNoZWQuDQo+ID4+ICsgKiBAc3RhcnRf
c3JwX2Nvbm5lY3Rpb25fZGV0ZWN0Og0KPiA+PiArICoJCU9wdGlvbmFsOyBpZiBzdXBwb3J0ZWQg
YnkgaGFyZHdhcmUsIGNhbGxlZCB0byBzdGFydCBjb25uZWN0aW9uDQo+ID4+ICsgKgkJZGV0ZWN0
aW9uIGZvciBzaW5nbGUgcm9sZSBwb3J0cy4gQ29ubmVjdGlvbiBkZXRlY3Rpb24gaXMgc3RvcHBl
ZA0KPiA+PiArICoJCWF1dG9tYXRpY2FsbHkgaWYgYSBjb25uZWN0aW9uIGlzIGVzdGFibGlzaGVk
Lg0KPiA+PiAgICAqIEB0cnlfcm9sZToJT3B0aW9uYWw7IGNhbGxlZCB0byBzZXQgYSBwcmVmZXJy
ZWQgcm9sZQ0KPiA+PiAgICAqIEBwZF90cmFuc21pdDpDYWxsZWQgdG8gdHJhbnNtaXQgUEQgbWVz
c2FnZQ0KPiA+PiAgICAqIEBtdXg6CVBvaW50ZXIgdG8gbXVsdGlwbGV4ZXIgZGF0YQ0KPiA+PiBA
QCAtMTQ5LDYgKzE1Myw4IEBAIHN0cnVjdCB0Y3BjX2RldiB7DQo+ID4+ICAgCQkJIGVudW0gdHlw
ZWNfcm9sZSByb2xlLCBlbnVtIHR5cGVjX2RhdGFfcm9sZSBkYXRhKTsNCj4gPj4gICAJaW50ICgq
c3RhcnRfZHJwX3RvZ2dsaW5nKShzdHJ1Y3QgdGNwY19kZXYgKmRldiwNCj4gPj4gICAJCQkJICBl
bnVtIHR5cGVjX2NjX3N0YXR1cyBjYyk7DQo+ID4+ICsJaW50ICgqc3RhcnRfc3JwX2Nvbm5lY3Rp
b25fZGV0ZWN0KShzdHJ1Y3QgdGNwY19kZXYgKmRldiwNCj4gPj4gKwkJCQkJICAgZW51bSB0eXBl
Y19jY19zdGF0dXMgY2MpOw0KPiA+PiAgIAlpbnQgKCp0cnlfcm9sZSkoc3RydWN0IHRjcGNfZGV2
ICpkZXYsIGludCByb2xlKTsNCj4gPj4gICAJaW50ICgqcGRfdHJhbnNtaXQpKHN0cnVjdCB0Y3Bj
X2RldiAqZGV2LCBlbnVtIHRjcG1fdHJhbnNtaXRfdHlwZQ0KPiA+PiB0eXBlLA0KPiA+PiAgIAkJ
CSAgIGNvbnN0IHN0cnVjdCBwZF9tZXNzYWdlICptc2cpOw0KPiA+PiAtLQ0KPiA+PiAyLjIxLjAN
Cg==
