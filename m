Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF65C10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31E1E20879
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbfDHTMX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 15:12:23 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.213]:37106 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726068AbfDHTMX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 15:12:23 -0400
Received: from [67.219.250.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-west-2.aws.symcld.net id 59/76-26556-51D9BAC5; Mon, 08 Apr 2019 19:12:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRWlGSWpSXmKPExsXi5LtOQFdk7uo
  Yg61PzC0WLWtltpjw+wKbA5PH7Ls/GD0+b5ILYIpizcxLyq9IYM3o2X2BreArZ8XD/81MDYxP
  OLsYuTiEBFYxSqzb1sAO4exhlPj7o4+ti5GTg03AUOLclrfsILaIgJbE5qaXzF2MHBzMAhoS5
  zeZgJjCAgoST1fpQFQoSvx4dowZwq6TOHD8EtgUFgEViaUX5rKA2LwC1hIfzpwCqxES8JFY+P
  MLmM0p4Csx79hHVhCbUUBM4vupNUwgNrOAuMStJ/PBbAkBAYkle84zQ9iiEi8f/2OFsOUl5tw
  6zQ5xmabE+l36EK3mEncOroYaoygxpfshO8QJghInZz5hASkXAjptzgatCYxis5Asm4UwaBaS
  QbOQDJqFZNACRtZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hsYmuoZGFnqJVbpJeqXFuuWpxSW6R
  nqJ5cV6xZW5yTkpenmpJZsYgZGYUtDWsIPx0/L0Q4ySHExKorwnWlfHCPEl5adUZiQWZ8QXle
  akFh9ilOHgUJLgDZ0NlBMsSk1PrUjLzAGmBJi0BAePkgjvSZA0b3FBYm5xZjpE6hSjMceBRQ/
  nMnO8Pfh8LrMQS15+XqqUOK/+LKBSAZDSjNI8uEGwVHWJUVZKmJeRgYFBiKcgtSg3swRV/hWj
  OAejkjDvZJCFPJl5JXD7XgGdwgR0yhQdsFNKEhFSUg2MC5WL9LxfSZTsZtpnffKh13V2vfZZ7
  2ocOrRfJyQUfw6e8d2UM8jvTrRJkttiDn7VdS1zUrbuMznDXjd7X5WO5AydHdMfSb9UuNYaHP
  +j5bejfn39JbvWtza5kqL13x8kK76zz2xu2PRg5ZkTyh0me4IXJx0KVZu9bEnJjEuXPS6Y8k5
  9XGWjxFKckWioxVxUnAgA9TBZqVADAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-9.tower-345.messagelabs.com!1554750740!7057660!2
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18040 invoked from network); 8 Apr 2019 19:12:20 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-9.tower-345.messagelabs.com with SMTP; 8 Apr 2019 19:12:20 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 8 Apr 2019
 14:12:19 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH03.digi.com ([fe80::484d:c326:e7f1:a9fd%16]) with mapi id
 14.03.0439.000; Mon, 8 Apr 2019 14:12:19 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMAgAADKICAAuoyAIAAH+eAgAAgmYCAAA8VAIAAEicAgAAIsQCAAANzgA==
Date:   Mon, 8 Apr 2019 19:12:19 +0000
Message-ID: <C22C24B7-A1A1-44E4-9559-ED576ABE8CFF@digi.com>
References: <Pine.LNX.4.44L0.1904081453480.1440-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904081453480.1440-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.81.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C09542FA8E164248945444DF95BC868E@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiBBcHIgOCwgMjAxOSwgYXQgMTo1OSBQTSwgQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5o
YXJ2YXJkLmVkdTxtYWlsdG86c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT4+IHdyb3RlOg0KDQo+
IE5vLCB0aGF0IHRyYWNlIGRpZCBub3Qgc2hvdyBhbnkgZmFpbHVyZS4gIERpZCB5b3Ugc2VlIHRo
ZSBjb3JyZXNwb25kaW5nDQo+IGVycm9yIG1lc3NhZ2VzIGluIHRoZSBrZXJuZWwgbG9nIHdoaWxl
IHlvdSB3ZXJlIGNvbGxlY3RpbmcgdGhlIHRyYWNlPw0KPiBNYXliZSB5b3UgY2FuIHRyeSBhZ2Fp
bi4NCg0KSeKAmW0gY2VydGFpbiB0aGUgbGFzdCB0cmFjZSBJIHNlbnQgc2hvdWxkIGhhdmUgY29u
dGFpbmVkIHRoZSByZWFkLg0KDQpidWxrIEEgMDAwMDA0YmYgdHkgMDMgc3QgMDAwMDAwMDAgVCAz
NTg0IEwgMCBjaCAwMDAwMDA4MSBlcCAxIGZsIDANCkJJIGNvbXBsZXRpb246IHN0IDAgc3RhdCAt
NzUgQUwgMCBlYyAwIHJldHVybmluZyAtNzUNCg0KPiBQUzogV2h5IGRvZXNuJ3QgeW91ciBlbWFp
bCBjbGllbnQgaW5zZXJ0IHNvbWUgc29ydCBvZiAicmVwbHkgaW5kZW50Ig0KPiBzdHJpbmcsIHN1
Y2ggYXMgIj4gIj8gIExvb2tpbmcgYXQgdGhlIG1lc3NhZ2VzIHlvdSBzZW5kLCBpdCdzIG5vdCBz
bw0KPiBlYXN5IHRvIHRlbGwgd2hpY2ggcGFydHMgd2VyZSB3cml0dGVuIGJ5IHlvdSBhbmQgd2hp
Y2ggeW91IGFyZSByZXBseWluZw0KPiB0by4NCg0KTXkgYXBvbG9naWVzLiAgSSB0ZXN0ZWQgaXQg
dXNpbmcgbXkgZ21haWwgYW5kIEkgc2VlIHRoZSDigJw+IOKAnCwgc28gSSB0aG91Z2h0IGl0IHdh
cyBzZXQgdXAgY29ycmVjdGx5LiAgVW5mb3J0dW5hdGVseSBteSBjb21wYW55IGRvZXNu4oCZdCBn
aXZlIG1lIGEgY2xpZW50IHRoYXQgd2lsbCBlYXNpbHkgc3VwcG9ydCB0aGF0LiAgSeKAmWxsIHRy
eSBhbmQgZG8gaXQgYnkgaGFuZC4NCg0KDQo=
