Return-Path: <SRS0=OyIA=6M=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927B4C83000
	for <linux-usb@archiver.kernel.org>; Tue, 28 Apr 2020 13:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78FE4206A1
	for <linux-usb@archiver.kernel.org>; Tue, 28 Apr 2020 13:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgD1NRq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 28 Apr 2020 09:17:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60035 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726827AbgD1NRq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 09:17:46 -0400
Received: (qmail 6583 invoked by uid 500); 28 Apr 2020 09:17:45 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Apr 2020 09:17:45 -0400
Date:   Tue, 28 Apr 2020 09:17:45 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Dave Mielke <Dave@mielke.cc>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        Samuel Thibault <Samuel.Thibault@ens-lyon.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Writing to /sys/../power/autosuspend when not root.
In-Reply-To: <20200428092649.GI756@beta.private.mielke.cc>
Message-ID: <Pine.LNX.4.44L0.2004280909320.4958-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 28 Apr 2020, Dave Mielke wrote:

> [quoted lines by Greg KH on 2020/04/27 at 12:30 +0200]
> 
> >Have a udev rule that turns autosuspend off for each specific USB device
> >that you know does not work with autosuspend.  
> 
> Yes, thanks, that should work. I have another question, though. Our code first
> tries to write "-1" to power/autosuspend, and then, if that fails, it writes
> "0". I'm guessing that "-1" was an older way (but I've forgotten). How can a
> udev rule be written to accommodate that?

See the entry for "/sys/bus/usb/devices/.../power/autosuspend" in
Documentation/ABI/stable/sysfs-bus-usb, or the corresponding entry for
"/sys/devices/.../power/autosuspend_delay_ms" in
Documentation/ABI/testing/sysfs-devices-power.

In short, -1 means "don't autosuspend", whereas 0 means "autosuspend as 
soon as possible".

Alan Stern

