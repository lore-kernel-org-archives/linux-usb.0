Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF46C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1895E2064B
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfDIOvk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 10:51:40 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.213]:34171 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbfDIOvk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 10:51:40 -0400
Received: from [67.219.246.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id 69/F5-25987-A71BCAC5; Tue, 09 Apr 2019 14:51:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRWlGSWpSXmKPExsXi5LtOQLdq45o
  Yg1Zli0XLWpktJvy+wObA5DH77g9Gj8+b5AKYolgz85LyKxJYM2a8uMZYMIG74tbtI4wNjOs5
  uxi5OIQE9jBKPO1+wt7FyMnBJmAocW7LWzBbREBLYnPTS+YuRg4OZgENifObTEBMYQEFiaerd
  CAqFCV+PDvGDGF3MUr87Q4FsVkEVCQWvD7DAmLzClhLND1/ygaxah2jxP01WxhBEpwCNhKH97
  9iBbEZBcQkvp9awwRiMwuIS9x6Mh/MlhAQkFiy5zwzhC0q8fLxP1YIW17i+afF7BD1OhILdn9
  ig7DNJZ71XoGaoy2xbOFrZogjBCVOznzCMoFRZBaSFbOQtM9C0j4LSfssJO0LGFlXMZomFWWm
  Z5TkJmbm6BoaGOgaGhrpmuuaG+glVukm65UW66YmFpfoGuollhfrFVfmJuek6OWllmxiBMZVS
  gG72w7GE0vTDzFKcjApifIu7FwTI8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC13UDUE6wKDU9tS
  ItMwcY4TBpCQ4eJRHeBSBp3uKCxNzizHSI1ClGS44Dix7OZeb40v4ISO6592wusxBLXn5eqpQ
  472OQBgGQhozSPLhxsCR0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzvIFJ7MvBK4ra+A
  DmICOmiKzmqQg0oSEVJSDYwpH3UlWlyy9c9c+GnBav7l2Z64jNak50ZvlwgrntCLuuW5Kv68X
  lQu+82Dmy+cfK+oOaMwtnRt9vamh/wy/FKGHCctVOTE+PN3+M3/Iulc0Zt4QGGZkIjbBx9xjh
  VynZ1GUUunxl39cnpjyDKxB2s+9s62ZJgdwb+Tbd2GkhfzZz1bn18V8USJpTgj0VCLuag4EQD
  zjusSPQMAAA==
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-11.tower-405.messagelabs.com!1554821497!7188260!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17659 invoked from network); 9 Apr 2019 14:51:37 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-11.tower-405.messagelabs.com with SMTP; 9 Apr 2019 14:51:37 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Tue, 9 Apr 2019 09:51:37 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMAgAADKICAAuoyAIAAH+eAgAAgmYCAAA8VAIAAEicAgAAIsQCAAANzgIABMrSAgAAWyQA=
Date:   Tue, 9 Apr 2019 14:51:36 +0000
Message-ID: <C85E6688-562E-4852-8D91-0270C6383D11@digi.com>
References: <Pine.LNX.4.44L0.1904081453480.1440-100000@iolanthe.rowland.org>
 <C22C24B7-A1A1-44E4-9559-ED576ABE8CFF@digi.com>
 <81BA7AE9-F21B-4BF1-B9A0-FDC82996EBA5@digi.com>
In-Reply-To: <81BA7AE9-F21B-4BF1-B9A0-FDC82996EBA5@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.30.39]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBA2F51124C1D0478052ECD7F0A8065A@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> No, that trace did not show any failure.  Did you see the corresponding 
> error messages in the kernel log while you were collecting the trace?
> Maybe you can try again.

This xhci debug spew might be helpful.

ffff800073097780 342993897 S Bi:8:003:1[  341.533219] xhci-hcd xhci-hcd.1.auto: Babble error for slot 3 ep 2 on endpoint
[  341.541655] xhci-hcd xhci-hcd.1.auto: Cleaning up stalled endpoint ring
[  341.548262] xhci-hcd xhci-hcd.1.auto: Finding endpoint context
[  341.554087] xhci-hcd xhci-hcd.1.auto: Cycle state = 0x1
[  341.559305] xhci-hcd xhci-hcd.1.auto: New dequeue segment = ffff800073da9b40 (virtual)
[  341.567214] xhci-hcd xhci-hcd.1.auto: New dequeue pointer = 0xf710a750 (DMA)
[  341.574254] xhci-hcd xhci-hcd.1.auto: Queueing new dequeue state
[  341.580254] xhci-hcd xhci-hcd.1.auto: Set TR Deq Ptr cmd, new deq seg = ffff800073da9b40 (0xf710a000 dma), new deq ptr = ffff0000099c5750 (0xf710a750 dma), new cycle = 1
[  341.595373] xhci-hcd xhci-hcd.1.auto: // Ding dong!
[  341.600243] xhci-hcd xhci-hcd.1.auto: Giveback URB ffff800071760540, len = 3072, expected = 3584, status = -75
[  341.610241] xhci-hcd xhci-hcd.1.auto: Ignoring reset ep completion code of 1
[  341.617283] xhci-hcd xhci-hcd.1.auto: Successful Set TR Deq Ptr cmd, deq = @f710a750
 -115 13 <
ffff[  341.625130] xhci-hcd xhci-hcd.1.auto: Transfer error for slot 3 ep 2 on endpoint

