Return-Path: <SRS0=7ANT=6S=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CE5C3A5A9
	for <linux-usb@archiver.kernel.org>; Mon,  4 May 2020 14:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EC2320752
	for <linux-usb@archiver.kernel.org>; Mon,  4 May 2020 14:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgEDOYC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 May 2020 10:24:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37167 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728165AbgEDOYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 10:24:01 -0400
Received: (qmail 14714 invoked by uid 500); 4 May 2020 10:24:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 May 2020 10:24:00 -0400
Date:   Mon, 4 May 2020 10:24:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>,
        Felipe Balbi <balbi@kernel.org>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+zdN280v54=qbEA5ALuXuCB3u=8BO8YHN+ZMzxWBzsQYg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2005041018520.11213-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 4 May 2020, Andrey Konovalov wrote:

> One more question (sorry for so many :).
> 
> Looking at other fields of usb_request struct I see frame_number.
> AFAIU it's filled in by the UDC driver for ISO transfers. Does it make
> sense to expose it to userspace? I don't see any composite/legacy
> gadgets use that field at all.

Do any of those gadget drivers use isochronous endpoints?

In fact, it also looks like none of the drivers in gadget/udc/ touch
the frame_number field.  Maybe we should just get rid of it, since it
isn't being used.

Felipe, any preference?

Alan Stern

