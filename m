Return-Path: <SRS0=MsX+=C7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873CC2D0E2
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 12:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD108239A1
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 12:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XbIZFEX5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVMLM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Sep 2020 08:11:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:49278 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgIVMLL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 08:11:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600776670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ixF9c+z/unmfEj6OGF+/pDUyaTJ8vYdDVd2OqyFf+uc=;
        b=XbIZFEX5kdJgbFTgQC3BZLH082UFnz3umpJvB2PbuTWDZhGRlLXaq9k3//fBuDPNBMs5JG
        jqYBA5mrYBjUbNtO8mUd9k6CuDIBZvAwaHy0L/1MTKcMH4uhsGGh0SFm8Lim/aXLiFmNQI
        OZ0tk7nnd0QaVQrSk5TcgT3r0k6/zWE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 80E79B52E;
        Tue, 22 Sep 2020 12:11:47 +0000 (UTC)
Message-ID: <1600776653.6926.21.camel@suse.com>
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Tue, 22 Sep 2020 14:10:53 +0200
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> This series adds support for handling broken union descriptors by
> falling back to "combined-interface" probing.
> 
> The first patch drops some bogus altsetting sanity checks which would
> otherwise have had to be needlessly reproduced for consistency. The
> third patch drops the driver specific data class define in favour of the
> common one. The last one, cleans up the no-union-descriptor handling by
> probing for a "combined-interface" before falling back to the
> call-management descriptor.
> 
> Note that I changed my mind on the stable tag; we can't be overly
> paranoid about a theoretical risk of breaking some quirky devices. And
> if we do, we still want to know about it, right?

Acked-by: Oliver Neukum <oneukum@suse.com>
