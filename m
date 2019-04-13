Return-Path: <SRS0=jcui=SP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341D8C10F11
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 11:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 084D320869
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 11:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfDMLh7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 13 Apr 2019 07:37:59 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:54738 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726417AbfDMLh6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Apr 2019 07:37:58 -0400
Received: from [67.219.250.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-west-2.aws.symcld.net id 1D/6B-24076-41AC1BC5; Sat, 13 Apr 2019 11:37:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRWlGSWpSXmKPExsXi5LtOQFfk1MY
  Yg81rRCwWLWtltpjw+wKbA5PH7Ls/GD0+b5ILYIpizcxLyq9IYM14ceg6W8F9joqbZ/cxNTBe
  4Ohi5OIQEtjLKHHi1luWLkZODjYBQ4lzW96yg9giAloSm5teMncxcnAwC2hInN9kAmIKCyhIP
  F2lA1GhKPHj2TFmkDEiArsYJV7dX8oKkmARUJV4276UDcTmFbCW+PB2GiOILSTgI7H2+y1mEJ
  tTwFfi4b1FYDajgJjE91NrmEBsZgFxiVtP5oPZEgICEkv2nGeGsEUlXj7+xwphK0hM2fSMEeI
  0TYn1u/QhWs0lVhw7zQ5hK0pM6X7IDnGCoMTJmU9YJjCKzEKyYRZC9ywk3bOQdM9C0r2AkXUV
  o0VSUWZ6RkluYmaOrqGBga6hoZGuoTGINtdLrNJN1Cst1i1PLS7RNdJLLC/WK67MTc5J0ctLL
  dnECIytlIKm0h2MV5anH2KU5GBSEuVtWLExRogvKT+lMiOxOCO+qDQntfgQowwHh5IEb81JoJ
  xgUWp6akVaZg4wymHSEhw8SiK8GiBp3uKCxNzizHSI1ClGY44Dix7OZeZ4e/D5XGYhlrz8vFQ
  pcV6PE0ClAiClGaV5cINgyecSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeQ5CFPJl5JXD7
  XgGdwgR0yhSd1SCnlCQipKQaGG9f/LY56bHuYZOg8y6T1Bj3TXHPPGV91yNJ5/96VwEf/bqcf
  t3YnRafVfl7ahQCdokeOnnjqtG0/n9PNew3bG1TCXculnRIVlv3VNIt7urXv67sW37VWX0zCz
  HZOLnxV+Mus745+39sDeC0Yd49nSN3cl9DtOEfkWTmCROn5G762r/qj2b4MiWW4oxEQy3mouJ
  EAK+V9bM5AwAA
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-6.tower-325.messagelabs.com!1555155475!7777651!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22260 invoked from network); 13 Apr 2019 11:37:56 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-6.tower-325.messagelabs.com with SMTP; 13 Apr 2019 11:37:56 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Sat, 13 Apr 2019 06:37:55 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMAgAADKICAAuoyAIAAH+eAgAAgmYCAAA8VAIAAEicAgAAIsQCAAANzgIABLpUAgAAiuYCAAAo4gIAANTmAgAAB4QCAATgfAIAAEVoAgANZeYCAAHX4AA==
Date:   Sat, 13 Apr 2019 11:37:54 +0000
Message-ID: <BBF6E1CC-E4A9-43E9-B94E-FC917E52B0EB@digi.com>
References: <Pine.LNX.4.44L0.1904121358510.1648-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904121358510.1648-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.124]
Content-Type: text/plain; charset="UTF-8"
Content-ID: <EED41CCEC7C1DE4BB789CB38B87B7ABC@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190413113754.LVUTbEI8SE87yWvCUrV6WYxKEFz49cwbKUP5T7msx_8@z>

PiBPbiBBcHIgMTIsIDIwMTksIGF0IDE6MDEgUE0sIEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQu
aGFydmFyZC5lZHU8bWFpbHRvOnN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+PiB3cm90ZToNCj4N
Cj4gQW55IG1vcmUgdGVzdCByZXN1bHRzPyAgSSBuZWVkIHRvIGtub3cgdGhhdCB5b3UncmUgY29u
ZmlkZW50IHRoZSBwYXRjaA0KPiB3b3JrcyBva2F5DQoNClRoZSBwYXRjaCBkaWRu4oCZdCBhcHBs
eSBmb3IgbWUuICBJIGZpZ3VyZWQgYSBjb3B5IHBhc3RlIHByb2JsZW0sIHNvIEkgbWFkZSB0aGUg
Y2hhbmdlcyBieSBoYW5kLg0KDQpZb3VyIGNoYW5nZXMgZml4IG15IHByb2JsZW0uDQoNCklmIGl0
4oCZcyBub3QgdG9vIG11Y2ggdG8gYXNrLCBwbGVhc2Ugc2VuZCBtZSBhIG1lc3NhZ2UgaWYgeW91
IGZpbmQgcGF0Y2hlcyB0aGF0IGZpeCBzaW1pbGFyIGlzc3VlcyB3aXRoIFNHIGFuZCB2aGNpLiAg
OikgIEnigJltIHN1cmUgd2XigJlsbCBydW4gaW50byB0aG9zZSBwcm9ibGVtcyBpZiB0aGV5IGV4
aXN0Lg0KDQo+IEFsYW4gU3Rlcm4NCj4NCj4gUFM6IEkgY2hhbmdlZCBteSBtaW5kIGFuZCBkZWNp
ZGVkIHRvIGtlZXAgdGhlDQo+IGJsa19xdWV1ZV91cGRhdGVfZG1hX2FsaWdubWVudCgpIGNhbGwu
ICBJdCBwcm9iYWJseSBkb2Vzbid0IGh1cnQgKHRoZQ0KPiBkYXRhIGJ1ZmZlcnMgYXJlIG1vc3Qg
bGlrZWx5IGFscmVhZHkgYWxpZ25lZCkgYW5kIHNvbWUgaG9zdCBjb250cm9sbGVycw0KPiBtYXkg
aGF2ZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLg0KDQpPaywgSeKAmWxsIGFkZCB0aGF0IGNhbGwg
YmFjay4NCg0KVGhhbmtzIQ0KDQpTZXRoDQoNCg0K
