Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C94C0015E
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jul 2023 13:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjGMNye (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjGMNyd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 09:54:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8391BB
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 06:54:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8C2961255
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 13:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627E3C433C8;
        Thu, 13 Jul 2023 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689256472;
        bh=B4Lvk6AUKt0Nsjj4k6UseOh6iaJkeqs6YutypOKJoFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qu/9fPz2oEQgjKTlzyp8MKaHBXOKPOdsNeO3PebNybNfL/VN8zmmPlQZlntLXBkNK
         dQfuVWj2DQnxnDn/yI95/hUTiz3YyasJtCnSyF4VynHzj+97oySK5qCu0+ldrdqmMp
         R451GtC1WO9a3gN9EMTKRHS6Fkodd1yZ8tMRZSrc=
Date:   Thu, 13 Jul 2023 15:54:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: question on uapi
Message-ID: <2023071302-earthlike-groin-da0a@gregkh>
References: <dfb234d2-9ee0-313f-d1a2-16c3767ccab6@suse.com>
 <2023071349-lunar-slate-1339@gregkh>
 <50eeac98-f790-4532-d067-b9da6e925e30@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50eeac98-f790-4532-d067-b9da6e925e30@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 13, 2023 at 03:49:32PM +0200, Oliver Neukum wrote:
> 
> 
> On 13.07.23 15:22, Greg KH wrote:
> > On Thu, Jul 13, 2023 at 12:39:09PM +0200, Oliver Neukum wrote:
> > > Hi,
> > > 
> > > what is the policy on uapi. It being for user space means
> > > that it should be as complete as possible, even if the kernel does not need stuff,
> > > should it not?
> > 
> > If the kernel does not need it, why add it to a uapi .h file as there is
> > nothing that userspace could do with it, right?
> > 
> > Or are you talking about USB protocols/structures that userspace can use
> > by talking to a USB device directly?
> > 
> > Specifics would be great to have, thanks.
> 
> Hi,
> 
> I wanted to get this clarified in principle.

There's no principle, only specifics :)

> In this particular case I found that we are lacking definitions
> in uapi for authentication descriptors. User space can definitely
> see them.

Then we should add them where needed.

thanks,

greg k-h
