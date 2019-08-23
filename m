Return-Path: <SRS0=IKu2=WT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EDFC3A5A2
	for <linux-usb@archiver.kernel.org>; Fri, 23 Aug 2019 10:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E09AC21726
	for <linux-usb@archiver.kernel.org>; Fri, 23 Aug 2019 10:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE9gw94w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392186AbfHWKHe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 23 Aug 2019 06:07:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36591 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392180AbfHWKHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 06:07:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id r5so1228960lfc.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2019 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qf0tKIGUzLMHo8897bxI7RBcbf3ra5As2xUShZTHVXk=;
        b=jE9gw94w/pgz7UVZYcAdoir7gdHC599uaFqAZfv/f+xhZWcVIzW5ycibkKiuc64Fij
         2v4MmF0EjLuSL4ozfNyabI2Cc/9hXbI0/l/SABfxMRUQavmZTxEU/1lU8V+4aZQ2q8Ui
         EKZdNO+7tNhDCjhevzqHhf4C+hZUmRkl4WzOqEr4wvi++7J1ScnWHKKyI1Vl/wCB8N4X
         UdG8vhkdJVDgmJ/eHPOJPZ0VvHYVn98u2Wjy2/iNGBFAR/AabPqBsR3aiOL3+g9VEOH/
         1blIdDdH2RH0IUiC0ieXO+TdZFiJnlJFCrkbsHOZ1+tb+sGi/F54Zm4fSWtYHKthO+L2
         hLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qf0tKIGUzLMHo8897bxI7RBcbf3ra5As2xUShZTHVXk=;
        b=KbvjvkulnsvRKc0k4oxEzsFCuplN5vnsdMShI8MEJxHZZoP2wJhmtl68B1f6yb8RfC
         xlkM2/6vHIu7EJIrdgDLZplJr3jWv5NajnK1XbVxbL5uY0NOt9X9uoCMCycE3nrpkt4H
         GT1Y4SyA3nnebdh9RQyvaEXShRirZna2R8JyWmh2lbJUXHWvW9uyfUk2WP/dkzYaowiN
         WlkQKmiohKPjCbeYqVCfP49KMl9/gWH/hP6MhTgs+RD6Hl88TSC6iis8gdubVuzyQMuB
         p0+5YGyj/LsTzmruadeq153smMG1zU3WbVsOWmQHM6C7Ci/ZsfZHNITTwG0471sn7qSv
         5g2w==
X-Gm-Message-State: APjAAAXoJJy6Y7iLDTmVogZTdoBVgKFGmmSMDXadpqbq9zAAr814o7Fn
        rZ5gRffN5OCn/EU6FWXBpSejGepAnA03nlOCqpcPEQ==
X-Google-Smtp-Source: APXvYqz/i+Y3ogiFU/vofGIhUoKotD90TSylBi/yYuyP+ATnMPS5RQPyrHi8LuwHLISNXwEhRblFyeyDZpGORCQSiqo=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr2378472lfp.61.1566554852633;
 Fri, 23 Aug 2019 03:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1566547041-20804-1-git-send-email-chunfeng.yun@mediatek.com> <1566547041-20804-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1566547041-20804-4-git-send-email-chunfeng.yun@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 12:07:20 +0200
Message-ID: <CACRpkdbr9PjFAvrq14DJmX1OSKYJxYFPaQZpVJaT_Q1_DUW=sw@mail.gmail.com>
Subject: Re: [PATCH next v10 03/11] dt-bindings: usb: add binding for USB GPIO
 based connection detection driver
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 23, 2019 at 9:58 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> It's used to support dual role switch via GPIO when use Type-B
> receptacle, typically the USB ID pin is connected to an input
> GPIO, and also used to enable/disable device when the USB Vbus
> pin is connected to an input GPIO.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v9~v10 no changes

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
