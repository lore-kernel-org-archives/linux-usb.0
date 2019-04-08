Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE20AC10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 14:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4B9020879
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 14:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfDHOso (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 10:48:44 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.209]:61947 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726372AbfDHOso (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 10:48:44 -0400
Received: from [67.219.247.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-d.us-east-1.aws.symcld.net id E0/1B-24217-94F5BAC5; Mon, 08 Apr 2019 14:48:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRWlGSWpSXmKPExsXi5LtOQNczfnW
  Mwds3GhaLlrUyW0z4fYHNgclj9t0fjB6fN8kFMEWxZuYl5VcksGac+/ODveApZ8WPmdeYGhiv
  cHYxcnEICaxilFh56gELhLOHUeLO3SOsXYycHGwChhLntrxlB7FFBLQkNje9ZO5i5OBgFtCQO
  L/JBMQUFlCQeLpKB6JCUeLHs2PMEHaSxMI/c5hAbBYBFYnbn7eA2bwC1hL3er+CTRcS8JFY/u
  0smM0p4Ctx/cU8RhCbUUBM4vupNWD1zALiEreezAezJQQEJJbsOc8MYYtKvHz8jxXClpd4/mk
  xO8RlmhLrd+lDtJpL9F7aADVGUWJK90N2iBMEJU7OfMICUi4EdNqcDVoTGMVmIVk2C2HQLCSD
  ZiEZNAvJoAWMrKsYTZOKMtMzSnITM3N0DQ0MdA0NjYC0roFeYpVuil5psW5qYnGJrqFeYnmxX
  nFlbnJOil5easkmRmAMphRwMexgfLM0/RCjJAeTkijvaufVMUJ8SfkplRmJxRnxRaU5qcWHGG
  U4OJQkeG/HAuUEi1LTUyvSMnOAyQAmLcHBoyTCyxwHlOYtLkjMLc5Mh0idYjTmOLDo4Vxmjrc
  Hn89lFmLJy89LlRLn/QcySQCkNKM0D24QLEldYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM
  2wKykCczrwRu3yugU5iATpmiA3ZKSSJCSqqBsdM2oXC/TEbM6z06OrJqJXIFklW7Ht/YvqYiI
  1yhKG2jcLObJLPA1uTCp6Gxz4999r7hdXft9uYQhoifr1fk+JywvWJtqf/55dPCO2f+c6Yoic
  YUZKzMzOqecv92QwPH4/yXh8Telpu+ZduWXrerYmm5ruu17qpKy0fP6j2ChBpuTuwT59BUYin
  OSDTUYi4qTgQAo4AMj00DAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-19.tower-425.messagelabs.com!1554734921!7584492!2
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32427 invoked from network); 8 Apr 2019 14:48:41 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-19.tower-425.messagelabs.com with SMTP; 8 Apr 2019 14:48:41 -0000
Received: from MTK-SMS-XCH05.digi.com (10.10.8.199) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 8 Apr 2019
 09:48:41 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0415.000; Mon, 8 Apr 2019 09:48:41 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMAgAADKICAAuoyAIAAH+eAgAAETwA=
Date:   Mon, 8 Apr 2019 14:48:40 +0000
Message-ID: <246F9117-E42F-4800-9B6D-EA484EFCB1F7@digi.com>
References: <Pine.LNX.4.44L0.1904081018530.1440-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904081018530.1440-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.30.39]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1081C942E44A994BA94215CED61E0FB7@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gQXByIDgsIDIwMTksIGF0IDk6MzMgQU0sIEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQuaGFy
dmFyZC5lZHU8bWFpbHRvOnN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+PiB3cm90ZToNCg0KU28g
bm8gZGlzYWdyZWVtZW50OyBpbiBib3RoIGNhc2VzIHRoZSBtYXhwYWNrZXQgdmFsdWVzIGFyZSAx
MDI0Lg0KQ2xlYXJseSB0aGlzIHdpbGwgbm90IHdvcmsgaWYgYSBTY2F0dGVyLUdhdGhlciBjb21w
b25lbnQgaGFzIGxlbmd0aA0KMzU4NC4NCg0KSW4gZmFjdCwgdGhpcyBidWcgaGFzIG5vdGhpbmcg
YXQgYWxsIHRvIGRvIHdpdGggVkhDSS4gIFlvdSB3b3VsZA0Kb2JzZXJ2ZSB0aGUgc2FtZSBwcm9i
bGVtIGlmIHlvdSBwZXJmb3JtZWQgYWxsIHRoZSBhY2Nlc3NlcyBvbiB0aGUNCmhvc3QgY29tcHV0
ZXIuDQoNCkluIHRoZW9yeSwgdGhlIGRldmljZSBzaG91bGQgcmVwb3J0IGEgYmxvY2sgc2l6ZSBv
ZiAxMDI0LiAgRG9lcyBpdA0KYWN0dWFsbHkgZG8gdGhpcz8gIEEgdXNibW9uIHRyYWNlIChvbiB0
aGUgaG9zdCkgc2hvd2luZyB3aGF0IGhhcHBlbnMNCndoZW4gdGhlIGRldmljZSBpcyBmaXJzdCBw
bHVnZ2VkIGluIHdpbGwgcHJvdmlkZSB0aGUgYW5zd2VyLiAgQ2FuIHlvdQ0KY29sbGVjdCBvbmUg
YW5kIHBvc3QgaXQ/DQoNCknigJl2ZSBfbmV2ZXJfIHNlZW4gdGhpcyBvbiB0aGUgcGh5c2ljYWwg
aG9zdC4gIE15IGFzc3VtcHRpb24gd2FzIGJlY2F1c2UgdGhlIHhoY2kgY29udHJvbGxlciBzdXBw
b3J0cyBzY2F0dGVyIGdhdGhlci4gIEkgd2lsbCBzcGVuZCBzb21lIG1vcmUgdGltZSB0cnlpbmcg
dG8gcmVwcm9kdWNlIG9uIHRoZSBwaHlzaWNhbCBtYWNoaW5lLg0KDQpJIHdpbGwgZ2F0aGVyIHRo
aXMgdHJhY2UsIGJ1dCBpdCBtaWdodCB0YWtlIGEgYml0IGFzIEnigJltIGxvY2tlZCBpbiBtZWV0
aW5ncy4NCg0KU2V0aA0K
