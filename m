Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1C8C433B4
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 14:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5020861439
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 14:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbhEMO1D (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 May 2021 10:27:03 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46385 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230252AbhEMO1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 10:27:02 -0400
Received: (qmail 968340 invoked by uid 1000); 13 May 2021 10:25:52 -0400
Date:   Thu, 13 May 2021 10:25:52 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     syzbot <syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        nic_swsd <nic_swsd@realtek.com>
Subject: Re: [syzbot] WARNING in rtl8152_probe
Message-ID: <20210513142552.GA967812@rowland.harvard.edu>
References: <0000000000009df1b605c21ecca8@google.com>
 <7de0296584334229917504da50a0ac38@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7de0296584334229917504da50a0ac38@realtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 13, 2021 at 03:13:36AM +0000, Hayes Wang wrote:
> syzbot <syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com>
> > Sent: Wednesday, May 12, 2021 5:40 PM
> [...] 
> > usb 1-1: New USB device found, idVendor=045e, idProduct=0927, bcdDevice=89.4f
> > usb 1-1: New USB device strings: Mfr=0, Product=4, SerialNumber=0
> > usb 1-1: Product: syz
> > usb 1-1: config 0 descriptor??
> 
> The bcdDevice is strange. Could you dump your USB descriptor?

Syzbot doesn't test real devices.  It tests emulations, and the emulated 
devices usually behave very strangely and in very peculiar and 
unexpected ways, so as to trigger bugs in the kernel.  That's why the 
USB devices you see in syzbot logs usually have bizarre descriptors.

Alan Stern
