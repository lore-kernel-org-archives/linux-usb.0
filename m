Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE55C10F12
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 02:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AA7E2075B
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 02:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9rAgUIk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfDPCuu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 22:50:50 -0400
Received: from mail-it1-f176.google.com ([209.85.166.176]:35112 "EHLO
        mail-it1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfDPCuu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 22:50:50 -0400
Received: by mail-it1-f176.google.com with SMTP id w15so30231935itc.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 19:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nm1Zp8gJIcdSF3XT1t003gt+S6IruSNDpfB+9oFYg7M=;
        b=K9rAgUIkFqG8k/o5UBfOzw7olfRNU4TJvx3D611vNYOfT+ZdlONVe+loEo/MVAFwh2
         x6aZ1E+ikFB0YWXfnY1Ujb13GS9fG2+rCkYeD1fuMLIIBBuGNA8ndlFZqwrnR656EOl6
         D2CHQREVzbk1usg6KQEUeqZRN4hKDNPEs1k7mCC8aFZ9Qo0vLKvHVqRQiZEHQZ4esArl
         uAVH2TIS2rxfjbMUwDjWCwqQ5yk4lSgYpq+yED572bu77sRPvxcXopYfbJPHcFlwWu67
         FZ8MNGOJlFOnCKXDGtNrs9bNwUj+oCaRZY7aZOLKtAxmc+UURyXmP5UOynBTnx0At1Vi
         zGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nm1Zp8gJIcdSF3XT1t003gt+S6IruSNDpfB+9oFYg7M=;
        b=J1juY9RHLs7bp/4OKBP74T7TRSxQwgkN27GHjwyH11kCuW5liLnX9qEGtqAUuKEMP/
         vSvewy5iPc4Q5kLlcqj9qN99I01OW1jzZu66b5Go7owPf0mK4N+glBzJeUq9M1uj/jHL
         O/6WwpmTWTzmV3BY4qDbSXYU9YwD1wiZs43fZCZtQVJEOlIAR4kC76wKnonwMEa4aCxu
         nKQAijwHl9TNz83P7Dg6KBPCnTANjZwQiiMXT2eOw9uXvnX4GpGLwtMrrSJeXFMgpIJW
         QbWddw544og8sA6u91TGaZiRFjlnoKWdmpo6g5wSdwOs9+1LVXslxRmTTS+1OLcWqYMl
         U8YA==
X-Gm-Message-State: APjAAAWlwRvL/89frHU73GgtSeUiYkgfog+V7xih5zeeChb7c8M9hybT
        X9JXpM9d7GTq8f5SxbO/Uyuwv6gNQOSYhOpra9E=
X-Google-Smtp-Source: APXvYqzUaoTGCAR9DENQtQDYbkcj0MbX61jV4zzCZi0rMW7jPmKjm5oNypxVMM8U4PM94UTkvkt65AzbXlCID3An/70=
X-Received: by 2002:a24:8c:: with SMTP id 134mr24171876ita.24.1555383049370;
 Mon, 15 Apr 2019 19:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB5327CD7017881B1F0D70730A8B560@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87tvfghh5u.fsf@linux.intel.com> <VI1PR04MB5327F6BA759FD5B0FDADC71C8B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com> <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <17c2afd6-0390-d3e7-eae1-718234aeca6f@gmail.com> <VI1PR04MB53278B8F18FBCC3544C04A4B8B2F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <f1b63809-8a67-29d4-f2b5-ddb6f3f99034@gmail.com>
In-Reply-To: <f1b63809-8a67-29d4-f2b5-ddb6f3f99034@gmail.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 16 Apr 2019 10:50:38 +0800
Message-ID: <CAL411-pRoPbxutmKr0HGDTVpt2cGLG7uP94zAU1CdvnnhVHtaw@mail.gmail.com>
Subject: Re: [EXT] Re: Why there is a refcnt check when we change configfs property
To:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 15, 2019 at 5:40 PM Andrzej Pietrasiewicz
<andrzejtp2010@gmail.com> wrote:
>
> Hi Peter,
>
> <snip>
>
> >>
> >> Can you please describe your use case?
> >>
> >> Andrzej
> >
> > I would like to change parameters for function driver through configfs, below is the example for ncm and f_sourcesink cases,
> > thanks.
> >
> > if [ "$FUNC" == "ncm" ]; then
> > mkdir functions/$FUNC".0"
> > ln -s functions/$FUNC".0" configs/c.1
> > echo 10 > functions/ncm.0/qmult
> > echo "12:a5:cf:42:92:fd" > functions/ncm.0/host_addr
> > echo "5e:bc:ca:27:92:b1" > functions/ncm.0/dev_addr
> > fi
> >
> > if [ "$FUNC" == "ss" ]; then
> > cd /sys/kernel/config/usb_gadget
> > cd g1
> > echo "0x0525" > idVendor
> > echo "0xa4a0" > idProduct
> > export FUNC="SourceSink"
> > mkdir functions/$FUNC".0"
> > ln -s functions/$FUNC".0" configs/c.1
> > cd functions/$FUNC".0"
> > echo 1 > pattern
> > echo 1 > isoc_interval
> > echo 1024 > isoc_maxpacket
> > echo 2 > isoc_mult
> > #isoc_maxburst
> > echo 1024 > bulk_buflen
> > echo 16 > bulk_qlen
> > echo 16 > iso_qlen
> > fi
> >
> > Peter
> >
>
>
> I think I don't quite understand the problem: just postpone issuing
> ln -s until after echo <something> > <configfs attribute>.
>

Andrzej, thank you very much. My problem can be fixed by your
suggestion.

Peter
