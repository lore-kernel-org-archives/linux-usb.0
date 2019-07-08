Return-Path: <SRS0=DU+6=VF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C249FC606C7
	for <linux-usb@archiver.kernel.org>; Mon,  8 Jul 2019 19:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9437D2064B
	for <linux-usb@archiver.kernel.org>; Mon,  8 Jul 2019 19:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0ZNdiHp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbfGHT6w (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Jul 2019 15:58:52 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:33904 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbfGHT6v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Jul 2019 15:58:51 -0400
Received: by mail-pl1-f176.google.com with SMTP id i2so8820375plt.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jul 2019 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7V+zYtHiOU5KbBa1aQMebYvCgwz3SI9LWyIoa1sCpdw=;
        b=a0ZNdiHp+0VEZkLH96+IsIPzVfrLFUQodgQDlJtv5AtKvFlAC3io0KALqBV4JIWeTC
         thdpoXJNRYoRKOfzue0XV4HE496MKdNnwLVRZZRATctzYDqnCywzG0hpBNi0yqZ9d0jy
         7LADGt+13Sc17C1LS1uqwILyj6y94fwque/MMxTrVLcmTgj9DoExayg6YvuJFAOdakjC
         Ux0iadFEjL/+lBFAfzfPGxuCq1EzXKoRYYQIXxpL0HBiehkkJZdFp03cBnevIxmgxYX6
         OPIQkQtKorHq3JrsxTZKy88Y08aMrC3vrSNpVh2xoKCiaTlFAYC6Jm/s1MgOVXfeam3r
         du4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7V+zYtHiOU5KbBa1aQMebYvCgwz3SI9LWyIoa1sCpdw=;
        b=awhye0EIjIefjyhAsAlszkRKbuVqXTmem/3eaeohLCG0bOq3rzg2sEXLmep6qBLk8G
         oSzxfJrcFueu/t99UkfCFAEI5gMq4nFGBSvzgPvgvqsDGfzRbK3yb1Vx4C5snhP+LTu1
         2k5tADT/vV1smgD71fKNc6NCT45Fyabej4AE4cUZCVbrv1zXbSlA9LYVwJtfiJdjMdez
         U7uEDIYUMzQT83U5quZeIdQbWIn/NFLfWelxz+NePnf/Lp1UridxPVdtW4hiFtoBsFaG
         Z2B1wOvh/OLv3QOyFSFrhLkHY3KlrWPx/4dKHaZeg0leoodNAC3lpkggONzJMyEu8nG2
         S3Ww==
X-Gm-Message-State: APjAAAUuZbaalgx95TImW4Q1TRDNwjPLzAjNwRRTyjCHSOYKinKg08JQ
        OH3CKtI+FTeelA8QLo4nXzCjhMSh35HEixMUNH8UdLt2
X-Google-Smtp-Source: APXvYqxH3R0FdHNLLSBDTVaB/T4dSnC0fI11bqlcK/0Fu+fuRYnKbK6E3AygjPYkaRLdzeAYDs8DAy8OAdGPaUTZ1ks=
X-Received: by 2002:a17:902:30a3:: with SMTP id v32mr27476800plb.6.1562615931000;
 Mon, 08 Jul 2019 12:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
 <20190706044627.GA21685@kroah.com>
In-Reply-To: <20190706044627.GA21685@kroah.com>
From:   yunhua li <yunhual@gmail.com>
Date:   Mon, 8 Jul 2019 12:58:40 -0700
Message-ID: <CAMqbrUjzZoTE9onNZtmDfwdVyBjDAwggv1=xRKgLjFGS10Ed7A@mail.gmail.com>
Subject: Re: Per USB device interrupt handler for xhci
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you Greg, So it seems xhci's interrupt based on it's rx/tx
queue(ring), the ring is shared by all USB device,  it is not aware of
"per USB device"?

Regards
Yunhua

On Fri, Jul 5, 2019 at 9:46 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 05, 2019 at 07:50:28PM -0700, yunhua li wrote:
> > Hi  all
> >
> > xhci_msi_irq is the interrupt handler for xhci, the controller it self
> > is a PCI device, on my system it is a Intel chip. I have multiple USB
> > device connect to this USB host controller,  xhci_msi_irq is interrupt
> > handler for the PCI device(USB Host controller).
> > Is it possible to have multiple IRQ, and different IRQ for different
> > USB device?
>
> Nope.  That is not how USB works.  Please read the xhci spec if you are
> curious as to why.
>
> greg k-h
