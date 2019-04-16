Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE95C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53F5020868
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfDPIoD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:44:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35255 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfDPIoD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:44:03 -0400
Received: by mail-ed1-f67.google.com with SMTP id y67so3878188ede.2;
        Tue, 16 Apr 2019 01:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rW0ln/owuAupu2zpCW2fZdNQMfO6p4rtnIyiMVieUGU=;
        b=AZDDOQXenhaAiCM67rl/d77ZUN9HT6iUrbwZmu7iQf4qheoVXO8j7FMIUPSialZU5b
         xvWB56LZN1Ii0Dql7jPk876myz2d6WWXXh8hsWTqB8I7rbAWNDZ7J2nkZm9hlxwHOS+v
         N2lna297RJ/MWAtJYIFrOyfWBwUvBWh4WevwKtD8CrvJz9iw7o1MzLLeQjOd2dKEBCjr
         9zyaUexyAF5UHGx4dbNkTDHX9w6BcewRM3uztdeI0gMHrpUB4Cr2e4cHGNrwRIsBrAvu
         yKGQzkRmDtuTE+EZpm6NQ74gK1kUKgE/FLXJhHOEA2CMrYMksRW7qwDR2rq/KIo8Ao2y
         KNvg==
X-Gm-Message-State: APjAAAWFOR1KX5R17II2XB4CxC4Y4ahAQ+s/9t44RAsN6C9u3U6NkhHM
        GXfRnzWodcDibXwzsYBHA+4jAt7A4h8=
X-Google-Smtp-Source: APXvYqyrI4AY9HuXhGElPc9igJjOdffUMhuCnK+P54KoyG2o1MxsKN3vGKPifCEWcnEAeLCRFQjfNA==
X-Received: by 2002:a50:b2e1:: with SMTP id p88mr50283347edd.62.1555404241342;
        Tue, 16 Apr 2019 01:44:01 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id j18sm15821311edj.92.2019.04.16.01.44.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 01:44:00 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id h18so24156307wml.1;
        Tue, 16 Apr 2019 01:44:00 -0700 (PDT)
X-Received: by 2002:a7b:c76c:: with SMTP id x12mr25932284wmk.97.1555404240275;
 Tue, 16 Apr 2019 01:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
 <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 16 Apr 2019 16:43:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
Message-ID:
 <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: Remove useless phy-names from
 EHCI and OHCI
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416084348.2Jv4DBtz9yBuXKQAoYMIt8TLrPZLh_n56nB6RMMXaVc@z>

On Tue, Apr 16, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Neither the OHCI or EHCI bindings are using the phy-names property, so we
> can just drop it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

for all the DT patches in this series.
