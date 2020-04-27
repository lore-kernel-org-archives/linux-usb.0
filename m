Return-Path: <SRS0=EUyb=6L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB96C5519A
	for <linux-usb@archiver.kernel.org>; Mon, 27 Apr 2020 10:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BD90206D9
	for <linux-usb@archiver.kernel.org>; Mon, 27 Apr 2020 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587983414;
	bh=o6HcIrDKw7gba4QcHj5zgbPydp6k6jWgPdkgLm31quU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iKCQVQJGhPl37H095odx3qoS89JRJoE+djgu5wV/eeHoh6a3DTj5Ad6y7xrdhxfvO
	 pqTcnmIARjg9H+17imJ6Sz1juMaG8nhtICuNp/x1yxtXj2DxAZhq9cuKxc9GsMgZ/V
	 krDwAhk7NZGVwagkqOO2nhPjuKfxVBWcKwS1BLf4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgD0KaN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 27 Apr 2020 06:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgD0KaM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 06:30:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A83B2064C;
        Mon, 27 Apr 2020 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587983411;
        bh=o6HcIrDKw7gba4QcHj5zgbPydp6k6jWgPdkgLm31quU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JYaCPpN4VoozD05QGLyyqW8orhiau0BfTQ7QslAECYn2ZzGCsT0qECX24dIHC2i8L
         fXHj6UMbNtNPdBQYdXkA8sg498nwCKQyJOSX5DwCxL04MUvkt2l9B97v0Wpg1cDnF2
         IBRqQ+WlZFcsQ3ys3AIA/A7C+aAGdDDzB4vZ7gV4=
Date:   Mon, 27 Apr 2020 12:30:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dave Mielke <Dave@mielke.cc>
Cc:     linux-usb@vger.kernel.org,
        Samuel Thibault <Samuel.Thibault@ens-lyon.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Writing to /sys/../power/autosuspend when not root.
Message-ID: <20200427103009.GA2362731@kroah.com>
References: <20200426190838.GU756@beta.private.mielke.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426190838.GU756@beta.private.mielke.cc>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 26, 2020 at 03:08:38PM -0400, Dave Mielke wrote:
> We're working on getting brltty to run as an unprivileged user with just a few
> required capabilities. We don't want one of those required capabilities to be
> CAP_DAC_OVERRIDE (bypass file permission checks).
> 
> Some USB-connected braille devices don't respond very well to being
> autosuspended. We get around this, when running as root, by writing to the
> SYSFS power/autosuspend file associated with the device. Our problem is that
> only the root user can write to it.
> 
> Other than using CAP_DAC_OVERRIDE (which we don't want to do), what other
> way(s) might we be able to use to overcome this restriction? For example, is
> there some kind of safe (enough) udev rule?

Have a udev rule that turns autosuspend off for each specific USB device
that you know does not work with autosuspend.  Do you have such a list?

If so, we can add it to the USB core with the
USB_QUIRK_DISCONNECT_SUSPEND flag.  Or is it the USB_QUIRK_NO_LPM that
they need?  I can't remember, but you can test it out from userspace
by reading about those in the
Documentation/admin-guide/kernel-parameters.txt file.

Hope this helps,

greg k-h
