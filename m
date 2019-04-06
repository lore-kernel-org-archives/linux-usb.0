Return-Path: <SRS0=peg9=SI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD8C10F06
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 15:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DFE320B1F
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 15:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfDFP5G (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Apr 2019 11:57:06 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.115]:44249 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726435AbfDFP5G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Apr 2019 11:57:06 -0400
Received: from [67.219.250.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-west-2.aws.symcld.net id E3/9C-26000-F4CC8AC5; Sat, 06 Apr 2019 15:57:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRWlGSWpSXmKPExsXi5LtOQNf/zIo
  Ygw3TJSwWLWtltpjw+wKbA5PH7Ls/GD0+b5ILYIpizcxLyq9IYM34fekcU8E1rooPD1ezNjAe
  4epi5OIQEtjDKPHo7HLmLkZODjYBQ4lzW96yg9giAloSm5tegsWZBawlpq+5zdjFyMEhLKAg8
  XSVDkSJosSPZ8eYIWw3ia4XB5hAbBYBFYnnd+eA2bxArZOmrmADsYUEfCXu37nJCGJzCvhJXF
  n/EKyGUUBM4vupNUwQq8Qlbj2ZD2ZLCAhILNlznhnCFpV4+fgfK4StINE09T87yDnMApoS63f
  pQ5jmEt077SGmKEpM6X7IDnGBoMTJmU9YJjCKzEKyYBZC8yyE5llImmchaV7AyLqK0SKpKDM9
  oyQ3MTNH19DAQNfQ0EjX0NhE19DSQC+xSjdJr7RYtzy1uETXSC+xvFivuDI3OSdFLy+1ZBMjM
  K5SCtr27WB8sTz9EKMkB5OSKC///hUxQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4954CygkWpa
  anVqRl5gAjHCYtwcGjJML7EiTNW1yQmFucmQ6ROsVoyXFg0cO5zBx77j0Dkm8PPp/LLMSSl5+
  XKiXO++QkUIMASENGaR7cOFgSusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcPyBSezLwS
  uK2vgA5iAjrIonQ+yEEliQgpqQbGgj36Oec8TIWdxD83xzw7blZw8IbLiv9Xlt8Qq43LXLJtl
  cLRLVvTZ53gvD07wCp7qi9jiGnY9OwpHc9fn9Z89lJCgOtSl3l7UGDwIuYtbk6ehloen05Wtc
  yYK6uX/rDt2p5wZtnLU+7WGJVH/ly+3PHkEvP4Q2YdktNz5F+rM3EZ/Kqv6S1UYinOSDTUYi4
  qTgQAuOP0WT0DAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-22.tower-345.messagelabs.com!1554566222!6920458!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4497 invoked from network); 6 Apr 2019 15:57:03 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-22.tower-345.messagelabs.com with SMTP; 6 Apr 2019 15:57:03 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Sat, 6 Apr 2019 10:57:02 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMA
Date:   Sat, 6 Apr 2019 15:57:02 +0000
Message-ID: <ABA60E4B-AA6E-4FB9-8D74-AAA0C8045222@digi.com>
References: <Pine.LNX.4.44L0.1904061132460.19196-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904061132460.19196-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.183]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C40716B14463F479519C69414D795DF@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gQXByIDYsIDIwMTksIGF0IDEwOjM0IEFNLCBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhh
cnZhcmQuZWR1PG1haWx0bzpzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pj4gd3JvdGU6DQoNCldo
eSBkb2VzIGEgMy1LQiByZWFkIGNhdXNlIGEgZmFpbHVyZT8gIEl0IHNob3VsZCB3b3JrIHBlcmZl
Y3RseSB3ZWxsLg0KDQpJIHRob3VnaHQgYmVjYXVzZSB0aGUgc2NzaSBjb21tYW5kIGFza2VkIHRv
IHJlYWQgMzJLLg0KDQpJZiBJ4oCZbSBpbmNvcnJlY3QgaW4gbXkgYXNzdW1wdGlvbiwgYW5kIHRo
ZSBjaHVua2VkIHJlYWQgc2hvdWxkIHdvcmssICBkbyB5b3UgaGF2ZSBhbnkgdGhlb3JpZXM/ICBJ
IGVuYWJsZWQgZGVidWcgc3BldyBvbiB4aGNpLCBidXQgbm90aGluZyBwcmVzZW50ZWQgaXRzZWxm
IG1vcmUgdGhhbiB0aGUgRU9WRVJGTE9XIGJlaW5nIHNldCB3aGVuIGl0IGRldGVjdHMgYmFiYmxl
LiAgSSB3b3VsZCBhcHByZWNpYXRlIGFueSBkZWJ1ZyBndWlkYW5jZSB5b3UgbWlnaHQgYmUgYWJs
ZSB0byBvZmZlci4gIDopDQoNClsgIDE3OS4zMzAwNDddIHVzYiAyLTEuMzogdXNiZGV2X2RvX2lv
Y3RsOiBTVUJNSVRVUkINClsgIDE3OS4zMzQ3NjFdIHVzYiAyLTEuMzogdXNlcnVyYiAwMDAwZmZm
ZjcwMDAxNjQwLCBlcDEgYnVsay1pbiwgbGVuZ3RoIDM1ODQNClsgIDE3OS4zNDE1NjVdIHVzYiAy
LTEuMzogdXNiZGV2X2RvX2lvY3RsOiBTVUJNSVRVUkINClsgIDE3OS4zNDE1NjldIHhoY2lfaGNk
IDAwMDE6MDE6MDAuMDogQmFiYmxlIGVycm9yIGZvciBzbG90IDggZXAgMiBvbiBlbmRwb2ludA0K
WyAgMTc5LjM0MTU3NF0geGhjaV9oY2QgMDAwMTowMTowMC4wOiAvLyBEaW5nIGRvbmchDQpbICAx
NzkuMzQxNTc4XSB4aGNpX2hjZCAwMDAxOjAxOjAwLjA6IEdpdmViYWNrIFVSQiBmZmZmODAwMDcz
YjQ4YTgwLCBsZW4gPSAzNTg0LCBleHBlY3RlZCA9IDM1ODQsIHN0YXR1cyA9IC03NQ0KWyAgMTc5
LjM0MTU4MV0gdXNiIDItMS4zOiB1cmIgY29tcGxldGUNCg0KU2V0aA0K
