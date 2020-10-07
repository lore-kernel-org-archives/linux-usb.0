Return-Path: <SRS0=hcfR=DO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B56EC4363D
	for <linux-usb@archiver.kernel.org>; Wed,  7 Oct 2020 09:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC612083B
	for <linux-usb@archiver.kernel.org>; Wed,  7 Oct 2020 09:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8VM3Lt7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgJGJOU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 7 Oct 2020 05:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgJGJOT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 05:14:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68ED6C0613D3
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 02:14:19 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h20so1212666lji.9
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R38D306cOdCH6gNOKn2dfXzMIdx9cVWTJ2EnhMSHPgI=;
        b=K8VM3Lt7he4DbXomcBl3P1LJNqMltD6OgLwpi66vIZr+U4091oDg8WzFZwthUfNZxM
         7C3DSeIGUrUU442GfpAuHECgrAXYpLu2i7jiJ+tc6NndlzfBRXWLyNPCYaNORPl5LkFO
         j3yVM1TBGLTi9OzIO8xmg8KIb9XE9xmNm50yhZZUafUFC94LNH6xELqQcJEXdcb/FW4z
         44xqj1ig+cU6YFysClUu3zjTOkqGuvBvWXZiSdDxbhsSmOFnipKSHBKJ+wUCBXNHBrs5
         uGh4kXbK7c8M4OfTPTFIVLc9+ICXIqD7n5c2eMHJ2raESyevz/KFuf+fgzJR7Sc1K+iE
         CkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R38D306cOdCH6gNOKn2dfXzMIdx9cVWTJ2EnhMSHPgI=;
        b=Mhx4Y2Q2BNRedC9slIjZLDoeFcjom62DSajzK44QKUV0Ud0wvMWBfcCvkW/+cPYOX/
         xd+nuoyWG+sH7EAi6yMZ8iOGxMBF2YW+KyPHMprKBO8xhjtITp5POgFLX8BuYbwApacK
         CQSnFaN77XL0yAMcNnL0tatsNNjmJvpRZpTv9pA0odgUGBbbpNejVeCHkvTATuHTV7GN
         wjB+mMUYqtOCAFk7KakMwLu9q/3DdKkorqs6CbLpgCPzcaYwaWsFtq7xoLt7Pa7aqhId
         0DZZooN5iVchyVrYLzSAsIaQcx+VAzpdCZkFieAdGVDFM5h+HlXfD4iWmuAhG5aVsG58
         cvQQ==
X-Gm-Message-State: AOAM532BkR6cjSuz2RDb8gbxykvRY4xT4GIEkQB+GMWsc+KIsoCLCTMV
        VB8JacI3Za1fx4nuFCSbs/uhgjb5R5Bfwtjpt3X3lg==
X-Google-Smtp-Source: ABdhPJxbc/bmd6ODDC9I5vRdhThK0GMJxuWPkDmiYh8tJC4/GZdchNUlcn3p1SbgotwVnTnpAIL7su86RHImnlHNlZE=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr941823ljg.100.1602062057729;
 Wed, 07 Oct 2020 02:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com> <20201004162908.3216898-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201004162908.3216898-2-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:14:06 +0200
Message-ID: <CACRpkdbscEpV6oP7q1AcbCcR-XUBG2PnnapQ695xug63VQ830w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] PCI: Add the IDs for Etron EJ168 and EJ188
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 4, 2020 at 8:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Add the vendor ID for Etron Technology, Inc. as well as the device IDs
> for the two USB xHCI controllers EJ168 and EJ188.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(...)

>  #define PCI_VENDOR_ID_REDHAT           0x1b36
>
> +#define PCI_VENDOR_ID_ETRON            0x1b6f
> +#define PCI_DEVICE_ID_ETRON_EJ168      0x7023
> +#define PCI_DEVICE_ID_ETRON_EJ188      0x7052

If you're defining that here, I think it should also be
removed in
drivers/usb/host/xhci-pci.c
by including this file instead?

Yours,
Linus Walleij
