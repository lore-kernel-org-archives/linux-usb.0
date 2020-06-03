Return-Path: <SRS0=gvS/=7Q=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D96C433E2
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 23:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF7FE20734
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 23:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFBCYcYT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgFCXeN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Jun 2020 19:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgFCXeC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 19:34:02 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4F1C08C5C0
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 16:34:01 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id 7so879795oof.8
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2020 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSD4cyLN89wIxmMWB7W5TGbTgtY8haH7mLJm0b1UJd0=;
        b=uFBCYcYTgVgPixK7Khp7Oq7tBvbX51eP3uV5zv+w63ywz0jaMUszTxpHAkmWcD7Aq2
         jwQxCk6kzB8WOgCH7VdeaXgDFKTaO/4QUtR80fIavMm578jUPDrI4u8kZlcd9BDDZCud
         /xbRkj/No0PJKoxPQRddabBF268MerGErcd6C6IrHSfyu66I7OJ8RO6iqzxMqwUmc3yG
         XdXytPepfGPWq3Yh1BDCpv4DQ5Tf8L2+2HSsnlrXtoJFlNOSOqusqYVdX5quNbAuMLuA
         j0P0yK3ZZ9KSWZ8wAUlcv5tepPz/nZTswoL60iSwcvIvHW2+nBd90LSL3jF+kjus200X
         qmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSD4cyLN89wIxmMWB7W5TGbTgtY8haH7mLJm0b1UJd0=;
        b=fTbV72SJCKvqJe1E3KgC1v0/yldkj2eqPXaBeg1Wfplbc8XZZ4BmmTJ47KI+yRnPUL
         fqM6Y6GVUYtJ2vmecfFhFIGmO39ZaDZkpOQc9vuTroj8n+mvMAw0+FJC7gql05ZgGR9l
         PpABH8F726iOxXqlmApJKNWety5PMeeq+xj+jZyP5Vm6IWhKREjecA9DGcJNz4YEdg2e
         RE8xrGhg30GQ9mNpq79HSxTYCaR6A8LU3xIe5v3UsDGkoIKNFlrjnzqIBbjW1qKAlF2L
         V8qGkh3JeM+mzfED0egK7EiqdVliPGIVLCyCdoKRmrOlJbwpp21SQGk4S+f1IcOwfwvf
         jRng==
X-Gm-Message-State: AOAM531pR1t0zIMbMkYcqK6sBSrEALw9nEsLvn1qzx1Nomx7g9mtBOLm
        9BPqvpWZC726JBx+r14RAVf9lziJRG1QzgMvl2a6bQ==
X-Google-Smtp-Source: ABdhPJwERLYkKZYtedWy3poLrj9WDzNTP6BEPbyGqOyHCdTDP8haYe4kHMTCNDzADoPeVg0NqcOQeTtYY3ma9A0v74g=
X-Received: by 2002:a4a:2412:: with SMTP id m18mr1825170oof.36.1591227240820;
 Wed, 03 Jun 2020 16:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200603010251.38273-1-jun.li@nxp.com>
In-Reply-To: <20200603010251.38273-1-jun.li@nxp.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 3 Jun 2020 16:33:49 -0700
Message-ID: <CALAqxLUDgRwkYG55MLCCz55OkAc4Jmuv=yn14dM64==Lret0OQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpci_rt1711h: avoid screaming irq causing
 boot hangs
To:     jun.li@nxp.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 2, 2020 at 6:18 PM <jun.li@nxp.com> wrote:
>
> From: Li Jun <jun.li@nxp.com>
>
> John reported screaming irq caused by rt1711h when system boot[1],
> this is because irq request is done before tcpci_register_port(),
> so the chip->tcpci has not been setup, irq handler is entered but
> can't do anything, this patch is to address this by moving the irq
> request after tcpci_register_port().
>
> [1] https://lore.kernel.org/linux-usb/20200530040157.31038-1-john.stultz@linaro.org
>
> Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
> Cc: John Stultz <john.stultz@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Thanks so much for this, and sorry for my delay here.

Tested-by: John Stultz <john.stultz@linaro.org>


thanks
-john
