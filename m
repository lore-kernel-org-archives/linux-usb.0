Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF960C00140
	for <linux-usb@archiver.kernel.org>; Sun, 21 Aug 2022 16:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiHUQlB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Aug 2022 12:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiHUQlB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 12:41:01 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B376186C1
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 09:41:00 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id d68so6641643iof.11
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=C92M2PLrVilOcqhMUcZUKJEO/Y+vScQ1iDrC4w6fuKo=;
        b=ONv6Ly1qqhY1nF0qDBIdE262CaSJWl2LSHPm2ApzpHCcrwE8eUcLLorV6QeCoKQ68U
         5RTAD6hscG0uMJClliMw8sNgl+XLv+THnhIMgjF6++cwYASs39A+JoJmCSDV8qY+MiwL
         Sko1ys4C3yEzGMcW0Zy39eSxNm8wgOIY3XtJBDSpaL28/2+mz+/hV1AbQ6LDGGuOeJM3
         vAW3kcHZ8AqyaoE9tRBi8p1LIb5lswtM/bGBzLWkCItwmZmdOgRxXOqbdWF1tXOE5O/N
         t+PuGcAHZWPDfEDwTODFFM8RmUOv7IJgL23qSofEt4U5P9/qzF/VvfggSZfu8IqTNEdt
         +a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=C92M2PLrVilOcqhMUcZUKJEO/Y+vScQ1iDrC4w6fuKo=;
        b=CBigc2hdMWPsY+yKXuRF25CXm7ID6tbSGoB+2uzAP3GIZrrD9CEZYfmB+Nke73fBhT
         U00Dxvfmy6M9d4CGyOzy27NbmDWXHydv6Cs5/obHSUgKwywQMDpfWbMhttXdvEFAAcIw
         6yC8nWUcHLYfPFAzem29uJPnlNu4ZqKF8fdpJ5a9GHxtE/OBgSbt8OLybOseD/Cu46I0
         2ma4cEeb3KSoBuDO5rWKXqG8pGc+BmlyvOavItAWWTEqasng7HW+Ww0EmbDyG93qkkqL
         xSviSUtZQZcTXgdLr7YDZ+VOVvrl4XijDlbwurXgUVRE+X1LwHc7NWuntDV57DUDsWfC
         NbKA==
X-Gm-Message-State: ACgBeo2AXKcXlviI/j9Jn7bCXHEpkfVfjtDOrqHimI+/aiLVF/EWYyzz
        jdGEZXuBE4uidC98TFx/NfEAzF7gEbQdoZsjgoKuhHkY+7Y=
X-Google-Smtp-Source: AA6agR6B8GAzfqR4x65wwhhElVKzZFN0pqGpG6z8ovKQD47h28KKrQjpZTrxZ7oswV5K9w3iEkqL8S3LdCtg0P9maY0=
X-Received: by 2002:a02:cb5b:0:b0:341:aebb:d13 with SMTP id
 k27-20020a02cb5b000000b00341aebb0d13mr7612587jap.176.1661100059807; Sun, 21
 Aug 2022 09:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu> <CAAMvbhFt+_x7a++n3MPPpTza4vfnSj0809pXtzkps9TEVLpDUA@mail.gmail.com>
In-Reply-To: <CAAMvbhFt+_x7a++n3MPPpTza4vfnSj0809pXtzkps9TEVLpDUA@mail.gmail.com>
From:   James Dutton <james.dutton@gmail.com>
Date:   Sun, 21 Aug 2022 17:40:23 +0100
Message-ID: <CAAMvbhFaFF-wJmVLsWY5yTU+Q_NWT9NVTpwwgOe9-+RaCcBE1A@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 21 Aug 2022 at 17:36, James Dutton <james.dutton@gmail.com> wrote:
>
> On Sun, 21 Aug 2022 at 15:47, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > > The reason being, I have a system that boots from a USB disk.
> > > Due to interference, the USB device disconnects for a second or two
> > > and then comes back, but Linux does not see it and I have to reboot
> > > Linux to recover. So, in this situation I wish Linux to be able to
> > > recover immediately, without needing a reboot.
> >
> > There is no way to do this.  For example, consider all those failed
> > writes that you get error messages about.  Once they have failed, the
> > system does not try to remember them in case there's a possibility of
> > trying them again later.  They're just lost.
> I guess the solution would have to include a "retry in 1 second's
> time" type failure mode, instead of just lost.
> I.e. differentiate between the disk responding that the media failed,
> and the link being down to the disk so the write message could not be
> sent.
> For example, NFS waits around for the network to return, maybe we
> could add that functionality between a filesystem and usb storage.

As a side note, I have seen USB links failing. Normally just to
something like a keyboard or mouse, so it just comes back without the
user knowing anything was wrong.
The problem is USB links to disks don't recover currently.
