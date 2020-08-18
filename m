Return-Path: <SRS0=A6ac=B4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D42C433E1
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 16:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C0042076E
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 16:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENux4DIr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgHRQ1J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Aug 2020 12:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgHRQ0o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:26:44 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A35EC061342
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:26:44 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id t15so21843309iob.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o/YfmjeNFqhb5pexfCcE7Z8ungwl2bHyC5O/sNv2uS4=;
        b=ENux4DIr1qVhk9LgoudnoBlQ6qxqA9L4ARkSCq1xG6RCL9VLbg713HoknsZlmgIgLd
         +voFevbm4tc5K7OC7Du/6uJDNsnAITliqECuykT248YcOz2baBNc/m8y0f8dREyFHx2Z
         mg4dDVatPi2KIhmz//XJDVl2G4kSO32yh4Jaxbfzn9WxzaJhNV6zhDr4taSbitVdFuqx
         4SyVM65lSFJ6sG1oUAIJv6p2mmN0lsn8A6N/C1SFYv+f6nxiwoIilv00rLcGmihjtnLD
         2E06FKj/5D6di7h8EYq32DDTKa6X8EfBmVemhbWkzHu93LzrTt4KbkBrnMp6mfwTIQNI
         Wr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o/YfmjeNFqhb5pexfCcE7Z8ungwl2bHyC5O/sNv2uS4=;
        b=E8UXb8eHPblaqZODsHktpeXrPMv+LQ/RniaA8uUn6SpEvXAsHiFU++Lek6dtWwXnZZ
         TBtbOhfeqa2D1jRpyxstlwETZwdbxb+Gtks/Demwm8H2g5NeyMGWItg0seRQP5hzRr5o
         4N5ztfisAtUTGcdNIwhCJncF2ScnNNz9hir5vb20LUmSJjVvKa8Eh4C4Pv+r/x7CNhUN
         2YQk3ETMITwE80Ju2n/phe8PypQwrw+/Kia9GwYX83DvaVYK9Lw+GfFuHh8i+I/06/WU
         BZZcjGi1RttgP3OlXJ8n7KO4V4tZI5qPYMbbZSbxgLAZr8NOat7P3d8g3xRVK4ZFgDqW
         2LPA==
X-Gm-Message-State: AOAM530MSgM4aBToqJDexJujiaylmTlUVZqmtOAikWmfpUUrDshw+zEi
        m97jGmNUgoc1bt2pPZZxHhNs6pi4CiQqIlvAiA01Ig==
X-Google-Smtp-Source: ABdhPJyjMRp1+G3XgKHNtowgofhG5dKyMZibePCrzqviOcqezdE8vORnHuFn5Kwfi9QaEmUtlIYfeGezZfAbf1Zze3I=
X-Received: by 2002:a5d:80cb:: with SMTP id h11mr16696469ior.189.1597768003729;
 Tue, 18 Aug 2020 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200806161643.1694266-1-lorenzo@google.com> <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
 <CAHo-Oow8sZ8QaX3HNuFoJFmF01XximkOwbmxn6iWQF+a9vPkXw@mail.gmail.com>
In-Reply-To: <CAHo-Oow8sZ8QaX3HNuFoJFmF01XximkOwbmxn6iWQF+a9vPkXw@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 01:26:32 +0900
Message-ID: <CAKD1Yr05HwJa3PXj8kjMUa_6t4yjcfYNeqgkFsczWVmRPybdjg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 7, 2020 at 2:41 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
> btw. it looks like irq throttling in the same file:
>
> @@ -598,9 +599,10 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *sk=
b,
> -       /* throttle highspeed IRQ rate back slightly */
> +       /* throttle high/super speed IRQ rate back slightly */
>         if (gadget_is_dualspeed(dev->gadget))
> -               req->no_interrupt =3D (dev->gadget->speed =3D=3D USB_SPEE=
D_HIGH)
> +               req->no_interrupt =3D (dev->gadget->speed =3D=3D USB_SPEE=
D_HIGH ||
> +                                    dev->gadget->speed =3D=3D USB_SPEED_=
SUPER)
>
> should also be fixed to be >=3D SUPER and not =3D=3D.

That code was removed by fd9afd3cbe40 ("usb: gadget: u_ether: remove
interrupt throttling").
