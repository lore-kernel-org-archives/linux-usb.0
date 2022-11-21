Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B9C4332F
	for <linux-usb@archiver.kernel.org>; Mon, 21 Nov 2022 07:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiKUHhH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Nov 2022 02:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKUHhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 02:37:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA21CD6;
        Sun, 20 Nov 2022 23:37:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 294C3B80D19;
        Mon, 21 Nov 2022 07:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2E2C433C1;
        Mon, 21 Nov 2022 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669016219;
        bh=UQLT+J4urxhzJLNhsAarTtM2K/ku7wYKlwsNM1VooQU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MKWG8nIwIshO8nJZgDE+PGYsnuOEq51F7ORAJxMzOrXNJadi6gzpOmK/noILiewbO
         bNtBhBoBW21Zn9xmJDktWYph6t5u39gXbwA3W0Z0e0bf67zObOc8tsd7ElbhQZCGlF
         9U9bH7f1ZqG4kfMCzvn6+uMBM0zstGfcpiIs1ebw=
Date:   Mon, 21 Nov 2022 08:36:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] usb: typec: pd: Add symlink to linked device
Message-ID: <Y3sql/3xgXvre6rT@kroah.com>
References: <20221121062106.2569297-1-pmalani@chromium.org>
 <Y3scND+8DVe8SGeD@kroah.com>
 <Y3sls9+NcQrdjb9y@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3sls9+NcQrdjb9y@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 07:16:03AM +0000, Prashant Malani wrote:
> Hi Greg,
> 
> Thanks for reviewing the patch.
> 
> On Nov 21 07:35, Greg Kroah-Hartman wrote:
> > On Mon, Nov 21, 2022 at 06:20:39AM +0000, Prashant Malani wrote:
> > >  
> > > +What:		/sys/class/usb_power_delivery/.../device
> > > +Date:		November 2022
> > > +Contact:	Prashant Malani <pmalani@chromium.org>
> > > +Description:
> > > +		Symbolic link to the directory of the device to which the USB PD object is linked.
> > 
> > Line is way too long.
> 
> Sorry about that. I'll try to make it more concise in the next version.

That's not the issue, the problem is that it needs to be properly
line-wrapped.

> > But wait, a "device" has a specific meaning in a sysfs file, and that is
> > not what is happening here.
> > 
> > Please don't make fake "device" symlinks when these are not really using
> > a device here.  Either fix it up to properly use the device structures
> > in the code, or call this something else.
> 
> Got it, sorry about using that specific term. How about:
> 1. "linked_device"
> 2. "base_device" ?

Why either?  What exactly is this "device" that you are trying to link
to?  And why not just use the real device symlink instead?

> I prefer 1.) but happy to use the other, or any other suggestion.
> 
> > 
> > What in userspace wants to see this symlink?
> 
> ChromeOS's userspace Type-C daemon. It listens for Type-C partner uevents, but the PD objects
> can be created later (and destroyed and then recreated again, for PD chargers which dynamically
> change their source caps), and this helps determine which partner does those events apply to.

Then set up the proper device symlink like the driver model supports,
then you don't have to create a new one, and you don't have to add the
documentation entry as it's implied.

thanks,

greg k-h
