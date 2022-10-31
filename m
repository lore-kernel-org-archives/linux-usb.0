Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC46CC38A02
	for <linux-usb@archiver.kernel.org>; Mon, 31 Oct 2022 03:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiJaDzN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 30 Oct 2022 23:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJaDzM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Oct 2022 23:55:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC895E49
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 20:55:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 4so9719697pli.0
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 20:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WCvTJj9Vnocwle91BOR1TEJWVvho/MKXA8PnUmNt0yU=;
        b=F2vRMTtp6tbaza00E4e7nmV6VVCEnXX+lOpyp+/CcdvWXZS+h4B0Y+GkRgJoNw8h/B
         0vEAQCo0+AdpZDZCa/mOa9eTvQsxAGtD06hE9rZcAYgMt16zZKqc/rRPtWlHTxKwwo0m
         p8aITnz/nm/o35k62CjzSEX7pySTSxBlIvTw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCvTJj9Vnocwle91BOR1TEJWVvho/MKXA8PnUmNt0yU=;
        b=uA6Pd8gADN9khUn/y2l5pWlfPBwdoALzulNQswnh5JQbM1qIgX3DyDudOFhPFs6y0a
         Y/hwbt+5WuIlkmdRuso0MzWvpFgYm5J7rcSchqUFadAXKOyQinckEXPpxp960cmLi9OP
         Qdwwoi6G2Z/qHcdUILKd+bJKZLnc3lZV3RslwXCYi3PJOv8iJP1X2Cn6kXDnGiPsN+2L
         5OKEMKg5OJwQKZ7rShMHTT/XJNGBKAsm/vvL9CaXmwhp4M5rlmsDYPNi56ikL1UVh4Ot
         8unPpwQImf3EufEBATuw8Y9+rKgZflaJcVPOm6GxdVxz54ltB+dLkgt5/QaNhgvhxlnQ
         heSw==
X-Gm-Message-State: ACrzQf3i7xdbluQc/2fnXrPgpobkpngx1dSlGAJ/YQEsrlIoWfeWBVLp
        U+DIcjgF6kUGK6kg45MrjF4IC+CwrEO/hvWqgbE4xA==
X-Google-Smtp-Source: AMsMyM6PTvlqYddM1IFg8wUHH18DuJYejrdHTWl1pZvETBG301X3mVatB6v8e8uEzbnpuu1EGwvkCs5N+k/0jGYQoxg=
X-Received: by 2002:a17:90a:7061:b0:213:da75:f149 with SMTP id
 f88-20020a17090a706100b00213da75f149mr4538921pjk.85.1667188510339; Sun, 30
 Oct 2022 20:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221027053407.421783-1-rekanorman@chromium.org>
 <Y1ohUyZJItFh3xDs@kroah.com> <CAEmPcwtZt0RoksByW0OnkNsBiPJ-wHqzR9nuZEwAn3d2m=fyOA@mail.gmail.com>
 <Y1tyldAD/nDIoL3d@kroah.com>
In-Reply-To: <Y1tyldAD/nDIoL3d@kroah.com>
From:   Reka Norman <rekanorman@chromium.org>
Date:   Mon, 31 Oct 2022 14:54:59 +1100
Message-ID: <CAEmPcwvCs3c0z5BhicGfagNyDCLTkWkYYW2ftb0guR5Y+8uoHA@mail.gmail.com>
Subject: Re: [PATCH] xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 28, 2022 at 5:10 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 28, 2022 at 10:56:56AM +1100, Reka Norman wrote:
> > On Thu, Oct 27, 2022 at 5:11 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 04:34:07PM +1100, Reka Norman wrote:
> > > > ADL-N systems have the same issue as ADL-P, where a large boot firmware
> > > > delay is seen if USB ports are left in U3 at shutdown. So apply the
> > > > XHCI_RESET_TO_DEFAULT quirk to ADL-N as well.
> > > >
> > > > This patch depends on "xhci: Add quirk to reset host back to default
> > > > state at shutdown".
> > >
> > > What is the git commit id of that change?
> >
> > It hasn't been merged in mainline yet, only in the xhci tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=feb0b04b09c82589af65c84398b7d3fefaa7b7ac&head=for-usb-linus
> > Should I add the commit id from there? Or add the lore link?
>
> This is in linux-next already as 34cd2db408d5 ("xhci: Add quirk to reset
> host back to default state at shutdown") right?

Yes it is, my bad. Added in v2.

>
> Please use that.
>
> > > And is this needed in stable kernels?  If so, how far back?
> >
> > Sorry, I'm not sure how to answer that properly.
> > It looks like most ADL-N support was added starting from 5.16.
> > The issue it fixes is a ~20s boot delay in the specific case of booting from S5.
> > It probably makes sense for it to go wherever the ADL-P patch goes.
>
> Then properly mark it with that information.

Done in v2.

Thanks.

>
> thanks,
>
> greg k-h
