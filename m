Return-Path: <SRS0=FRkZ=UV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A8DC43613
	for <linux-usb@archiver.kernel.org>; Sat, 22 Jun 2019 00:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3876A2070B
	for <linux-usb@archiver.kernel.org>; Sat, 22 Jun 2019 00:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfFVAsh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Jun 2019 20:48:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56667 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726058AbfFVAsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 20:48:37 -0400
Received: (qmail 32664 invoked by uid 500); 21 Jun 2019 20:48:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Jun 2019 20:48:36 -0400
Date:   Fri, 21 Jun 2019 20:48:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Harutyun Khachatryan <kh_harut@mail.ru>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: USB bug
In-Reply-To: <0de30c70-76b0-863c-98c5-2a465d1ef399@mail.ru>
Message-ID: <Pine.LNX.4.44L0.1906212042580.32253-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 22 Jun 2019, Harutyun Khachatryan wrote:

> Dear Alan Stern,
> 
> I thought that I should wait Mathias's response. I am terribly sorry for 
> that. I am sending dmesg log and trace content as you asked. I tried the 
> procedure on kernel 5.1.12-050112-generic since it's most recent now and 
> the bug still exists in it. If you need for 5.0 write me back. Thank you 
> in advance.

The linux-usb mailing list does not accept email messages in HTML 
format.  Please resend your message using plain text only.

Also, I'm not the xHCI maintainer -- Mathias is.  You should send your 
messages to him along with (or instead of) me.

Finally, posting the logs isn't very useful if you don't say what you 
were doing at the time.  When you resend your message, include a 
detailed description of exactly what you did while the logs were being 
collected.

Alan Stern

