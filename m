Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36E8C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:17:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 954D9204FD
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="fsi9nnwl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K5U41Hz1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfDSTRj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:17:39 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51359 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726280AbfDSTRj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 15:17:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 5A8B1220A5;
        Fri, 19 Apr 2019 15:17:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 19 Apr 2019 15:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=m/UNKjgwZ3IyV6twhiVmmfCxIdg
        I2jJXsG7hvOdNJDg=; b=fsi9nnwl5eveVB4qfbELhBSt1irPSaTBiGmbWUUbJ77
        4kvZ2So5EkFpfi/4a/7obCW9R+RNPVKlJ4+xrj81FdpuADHI7ybdfgbi1cAg7P03
        PmZVWqmm8qXhk803d5ROGPhB1tMykIVAIrh8h9gC9CwAtmtxfaXsX7fLp+AQMSlQ
        QBI4NQFtbTwxPcYplpgB3nu1yShimyH98m6uWoCNao8f2mjVwuNdebfIdB68sLVe
        nHYR3o4NXlvvz2VfgjY/9pELa3Gcv+HbnZj4FxjzBa3OI/eUZZPePMHgX5SPQswb
        58rluK0DtFB8uSmSXf2tffYV/2DBWegcQBdziYW1v5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=m/UNKj
        gwZ3IyV6twhiVmmfCxIdgI2jJXsG7hvOdNJDg=; b=K5U41Hz1AVBMoXWPBCnpL+
        HsuetBRgLIimvQw7krqDdRjhxYwXQXD/TMK0gaNBo2cZlToURvCR/jMJLa0wCdwX
        Sh2UAybjxj2ULUDznPq5zA0/Ov4OWKnW+xtGC+40ukNu7zGkF4lh+NgLDs+LHzsO
        15TlVyUcIhr7cCeFAQ/3z0CqMuCtFDwAatLBsGkjO0PqfziNzQi0ur2PSIxeNLHh
        FWmRK74vfa+ihm+7/gf6qPlu2EkulKj3xjl9ThWlZVmETnGUKhc4McAtXlnmv/Ar
        7SZ59xtM9vW/miOJqI1Rb+cJT1QbEiThKHcMM6IbP2ohRJFRpNrAXqDKMTpoFqXA
        ==
X-ME-Sender: <xms:0h66XN9C8pV0cXYrCK7LQcgmsSv79CcIswC6miAbv2bE8hRPKzz_cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeekgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
    lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:0h66XITA9Reu9sPcaDWLPvsZTprYZq0qWkpngvVtUT2rIN0iA4XbTA>
    <xmx:0h66XHwlTeAEy0JPzbQAEvm6lkJkA6NYjCeAVBD9Te_mhACnIEPp3g>
    <xmx:0h66XKFIOYlllxF-5q7CR-wasTNABC3ym8ZOWv1oKXKJ3vv5O4w38A>
    <xmx:0h66XDQfvB1agsjQwmhhwiVQiDz4wevKS-E2qXWub2JylVU6OY9OpA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 577ECE4122;
        Fri, 19 Apr 2019 15:17:37 -0400 (EDT)
Date:   Fri, 19 Apr 2019 21:17:35 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzkaller-bugs@googlegroups.com,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Fix bug caused by duplicate interface PM
 usage counter
Message-ID: <20190419191735.GA5970@kroah.com>
References: <Pine.LNX.4.44L0.1904191348580.1406-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1904191348580.1406-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419191735.hwqGJHZT_IlTPl2vAuy0wpUjXQdFNJFJzJVvMt8_oxU@z>

On Fri, Apr 19, 2019 at 01:52:38PM -0400, Alan Stern wrote:
> The syzkaller fuzzer reported a bug in the USB hub driver which turned
> out to be caused by a negative runtime-PM usage counter.  This allowed
> a hub to be runtime suspended at a time when the driver did not expect
> it.  The symptom is a WARNING issued because the hub's status URB is
> submitted while it is already active:
> 
> 	URB 0000000031fb463e submitted while active
> 	WARNING: CPU: 0 PID: 2917 at drivers/usb/core/urb.c:363  
> 
> The negative runtime-PM usage count was caused by an unfortunate
> design decision made when runtime PM was first implemented for USB.
> At that time, USB class drivers were allowed to unbind from their
> interfaces without balancing the usage counter (i.e., leaving it with
> a positive count).  The core code would take care of setting the
> counter back to 0 before allowing another driver to bind to the
> interface.
> 
> Later on when runtime PM was implemented for the entire kernel, the
> opposite decision was made: Drivers were required to balance their
> runtime-PM get and put calls.  In order to maintain backward
> compatibility, however, the USB subsystem adapted to the new
> implementation by keeping an independent usage counter for each
> interface and using it to automatically adjust the normal usage
> counter back to 0 whenever a driver was unbound.
> 
> This approach involves duplicating information, but what is worse, it
> doesn't work properly in cases where a USB class driver delays
> decrementing the usage counter until after the driver's disconnect()
> routine has returned and the counter has been adjusted back to 0.
> Doing so would cause the usage counter to become negative.  There's
> even a warning about this in the USB power management documentation!
> 
> As it happens, this is exactly what the hub driver does.  The
> kick_hub_wq() routine increments the runtime-PM usage counter, and the
> corresponding decrement is carried out by hub_event() in the context
> of the hub_wq work-queue thread.  This work routine may sometimes run
> after the driver has been unbound from its interface, and when it does
> it causes the usage counter to go negative.
> 
> It is not possible for hub_disconnect() to wait for a pending
> hub_event() call to finish, because hub_disconnect() is called with
> the device lock held and hub_event() acquires that lock.  The only
> feasible fix is to reverse the original design decision: remove the
> duplicate interface-specific usage counter and require USB drivers to
> balance their runtime PM gets and puts.  As far as I know, all
> existing drivers currently do this.

Nice work, that took a lot of debugging, thanks for resolving this.

greg k-h
