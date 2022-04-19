Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF80C433FE
	for <linux-usb@archiver.kernel.org>; Tue, 19 Apr 2022 14:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbiDSOfc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353351AbiDSOfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 10:35:32 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id F09281B792
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 07:32:48 -0700 (PDT)
Received: (qmail 593923 invoked by uid 1000); 19 Apr 2022 10:32:47 -0400
Date:   Tue, 19 Apr 2022 10:32:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 19, 2022 at 11:28:21AM +0200, Martin Kepplinger wrote:
> hi,
> 
> I'm seeing resets and re-enumerations on runtime-resume for one device
> a lot. It's a modem connected to the USB2642 Microchip (SMSC) USB2 hub,
> that's connected to an xhci HC.
> 
> A remote wakeup *sometimes* makes the hub say "physically disconnected"
> during resume in hub_activate(), and thus sets reset_resume. Then the
> device comes up as low-speed device once, which again is not allowed
> during normal runtime resume, so would itself trigger a reset.

Does the reset-resume always fail in this way?

> The Hub and device is permanently connected on the PCB, so the hub is
> interpreting it in a wrong way.

What is the hub is interpreting in a wrong way?  Why should a permanent 
connection on the PCB have anything to do with whether the resume 
signals are misinterpreted?

>  I found an email that describes what I
> see from Sarah Sharp in 2013 here:
> https://marc.info/?l=linux-usb&m=137754385421825&w=2 Where she says:
> 
> "Occasionally, the host controller was sending the SoFs too soon on
> resume, and the device would interpret it as a low-speed chirp.  The
> device would disconnect, and transform from a high speed device to a
> low speed device.  I don't think increasing the 10 ms time out will
> help at all in this case, but you did ask what USB device disconnect
> scenarios I've seen."

Read the following messages in that email thread.  Sarah said that she 
would fix the SoF signal timing in xhci-hcd ("I agree that this seems 
like an xHCI driver issue, and I'll fix it in the driver").  I have no 
idea whether this helped the faulty devices; my guess is that it didn't.

(She never did respond to my comment that there is no such thing as a 
"low-speed chirp".)

> I can't find any reference to that bug yet. Has anyone experienced
> something (similar) and knows where I can at least try to work around
> that?
> 
> I don't know Sarahs' current email, could we forward this question to
> her?

Sarah hasn't worked on Linux or xhci-hcd for many years.  It's probably 
not worth trying to ask her about this.

Alan Stern
