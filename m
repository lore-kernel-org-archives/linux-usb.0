Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B45CC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 09:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B4F220684
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555408054;
	bh=qZvLR3xfyuHonZf1BWm2yt6R2dPHI/aS6OyoOdzinmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BtrYfeRW7GCpWwl6I3y5pdgRUq6z5XsSHTnj4Rheu0rNTmx32/he63Xf/nTQcEPSb
	 g5K2d1hhWGgfYTah4Qe0FDEfhm/bdrgWhMwasEPuXYMlhows7XVEQziNZHekixHUXv
	 YztplOOlsBglvu+oJElT4uwYVVokNC7sNZ/yjxs4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbfDPJrd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 05:47:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfDPJrd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 05:47:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFD1920684;
        Tue, 16 Apr 2019 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555408052;
        bh=qZvLR3xfyuHonZf1BWm2yt6R2dPHI/aS6OyoOdzinmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=apjA1gBJnuwYVMPp+nUkjXmZwRn48rWUAaCXkBxkmp9FiPaPDE9EV7uzHStVITZZO
         iEp8FQWd7Y7wq+euu+pfTE9tnmXY3S3QkC3x6JP+CiS+6qPAXaK6KuYdkwk/3AxvNG
         LIM6bbdvOvPhEImiBUczKfMqx2O2UiXIZQk7+G4E=
Date:   Tue, 16 Apr 2019 11:47:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Xiao <92siuyang@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Null pointer deference in function stk_camera_probe and
 s2255_probe
Message-ID: <20190416094729.GB896@kroah.com>
References: <CAKgHYH1avWuhnsTf++5J4o+hbXq5eyckE7LrXAmrqx7Y_4O=ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgHYH1avWuhnsTf++5J4o+hbXq5eyckE7LrXAmrqx7Y_4O=ww@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 11, 2019 at 10:51:47AM +0800, Yang Xiao wrote:
> Hi,
> 
> There are NULL pointer deferences in the function stk_camera_probe in
> drivers/media/usb/stkwebcam/stk-webcam.c and function s2255_probe in
> drivers/media/usb/s2255/s2255drv.c, which allows proximate attackers
> to cause a denial of service via a crafted endpoints value in USB
> device descriptor.
> 
> 1286 static int stk_camera_probe(struct usb_interface *interface,
> 1287		const struct usb_device_id *id)
>         ...
> 1351	iface_desc = interface->cur_altsetting;
> 1352
> 1353	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
> 1354		endpoint = &iface_desc->endpoint[i].desc;
> 1355
> 1356		if (!dev->isoc_ep
> 1357			&& usb_endpoint_is_isoc_in(endpoint)) {
> 1358			/* we found an isoc in endpoint */
> 1359			dev->isoc_ep = usb_endpoint_num(endpoint);
> 1360			break;
> 1361		}
> 1362	}
> 
> The driver expects at least one valid endpoint. If given malicious
> descriptors that specify 0 for the number of endpoints, it will crash
> in the probe function (NULL POINTER DEFERENCE in line 1354).
> 
> The same reason to function s2255_probe.
> 
> The reason of this vulnerability is the same as CVE-2016-2188, which
> was fixed in commit 4ec0ef3a82125efc36173062a50624550a900ae0.

Can you please resend your patch in a format that I can apply it in?

Actually, it needs to go to the correct maintainer/subsystem, please use
scripts/get_maintainer.pl on your patch to determine that.

thanks,

greg k-h
