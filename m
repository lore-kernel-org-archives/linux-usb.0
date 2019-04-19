Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A49C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 862A82054F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698800;
	bh=Nwz6MB47owPeWVb24oGS4ZPsfgfpLOqrJ6XmgqtytVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aSKwBkQbJPG/FJEZICH/Qb6zT5c/wXBveP55KuaEkdiBNGPaL9OiIgRO7wCvY3W4E
	 N3KOusPZXzu8KSvS26pghGzX8Nh3mhZ/dpY0WTBRAFe2cG24+sTB1z6mWgxCBpnrBb
	 OIj0pcM+o15+VIvMq1645d26A5ka+hN4gMJqB6sw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfDSSdN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbfDSS3R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D79921925;
        Fri, 19 Apr 2019 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555676186;
        bh=Nwz6MB47owPeWVb24oGS4ZPsfgfpLOqrJ6XmgqtytVM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AVRNnI+tCaxmxotIT5e1bJXk6hnEG72mMz8GhppQSPmBY+lK65ok+j9PaucF+UjVT
         MJfpfPcAJ1Qk8Q+825vsIiLC//kYnrDcuMUx1LeX2uiPt4LiQKrGevTCaUeX3QkURV
         x2ZkqZI6iYA9X1QqvQwoxW00iJtog/yNG8u/pgg0=
Date:   Fri, 19 Apr 2019 14:16:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-usb@vger.kernel.org, groeck@chromium.org, oneukum@suse.com,
        djkurtz@chromium.org, zwisler@chromium.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Torokhov <dtor@chromium.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3] usb/hcd: Send a uevent signaling that the host
 controller had died
Message-ID: <20190419121624.GA12209@kroah.com>
References: <20190417190316.10032-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190417190316.10032-1-rrangel@chromium.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419121624.Hm0USVH8sb37UeXP6_FyorwX15PJlTRB0IQK3aGvkFE@z>

On Wed, Apr 17, 2019 at 01:03:16PM -0600, Raul E Rangel wrote:
> This change will send an OFFLINE event to udev with the ERROR=DEAD
> environment variable set when the HC dies.
> 
> By notifying user space the appropriate policies can be applied.
> i.e.,
>  * Collect error logs.
>  * Notify the user that USB is no longer functional.
>  * Perform a graceful reboot.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

I'll wait for a v4 to fix up the bugs 0-day found in this before
reviewing :)

thanks,

greg k-h
