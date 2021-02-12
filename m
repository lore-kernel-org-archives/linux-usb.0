Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7764C433DB
	for <linux-usb@archiver.kernel.org>; Fri, 12 Feb 2021 15:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC7664DFF
	for <linux-usb@archiver.kernel.org>; Fri, 12 Feb 2021 15:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhBLPgt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Feb 2021 10:36:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:56134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232076AbhBLPfk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Feb 2021 10:35:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2077B64E70;
        Fri, 12 Feb 2021 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613144099;
        bh=Eudgr6W2WdMGc/N0flqQbV9GpcdtUOmheMb/s+je14U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F0WMSKq1s3GPsU+Wp4968BXysk8nz+5ZP1TLfAnZKOaV+lz6emedbVjHqj35EuG13
         AnoNfFKiHwMc8qwg3GcOtUBWU1kdWKFABbHvAA/1IxtcDpUqK7sICg8HQZ/vhXxw45
         nPa9P/MsNntAVOTux9BkZAYIZQ8jGaMN1NgY46qI=
Date:   Fri, 12 Feb 2021 16:34:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yorick de Wid <ydewid@gmail.com>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v4] Goodix Fingerprint device is not a modem
Message-ID: <YCagIeWw3bNmSkhJ@kroah.com>
References: <6da4b774afccbd0ad2f9727800164728130a67f6.camel@suse.com>
 <20210212140838.196763-1-ydewid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212140838.196763-1-ydewid@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 12, 2021 at 03:08:39PM +0100, Yorick de Wid wrote:
> The CDC ACM driver is false matching the Goodix Fingerprint device against the USB_CDC_ACM_PROTO_AT_V25TER.
> 
> The Goodix Fingerprint device is a biometrics sensor that should be handled in user-space.
> libfprint has some support for Goodix fingerprint sensors, although not for this particular one.
> It is possible that the vendor allocates a PID per OEM (Lenovo, Dell etc).
> If this happens to be the case then more devices from the same vendor could potentially match the ACM modem module table.

Can you wrap these lines at 72 columns and resend?

thanks,

greg k-h
