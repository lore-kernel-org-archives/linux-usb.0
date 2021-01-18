Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F896C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 12:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AAB222286
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 12:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404231AbhARMrY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:47:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404185AbhARMrL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 07:47:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D00BC22286;
        Mon, 18 Jan 2021 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610973991;
        bh=EihlOCikHGGsyoWxbPXtuypFjW4pboj8N0NS8F/XrvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NMGlThgbjD5FWn0F/c8Q3Ptlljbc044BZGPblZ+dYYLHQwRBtYRGnFH/3LiPjm/nQ
         GXy5tJUH2EabnIBKEG1K5BjqZfXrdXZeLKVhWbVG13lxQaZdNNHznNbpxWvhHVejYM
         RktlhwWuSJ07fCubPvuB9ORuKyFnSO21bHqhYbYQ=
Date:   Mon, 18 Jan 2021 13:46:28 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] USB: serial: drop short control-transfer checks
Message-ID: <YAWDJN8B03VU4sOw@kroah.com>
References: <20210118111426.5147-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118111426.5147-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 12:14:20PM +0100, Johan Hovold wrote:
> There's no need to check for short control transfers when sending data
> so remove the redundant sanity checks from the drivers that had them.

It seems impossible to do a "short write", so I wonder why we even check
it...

Anyway, nice cleanups:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
