Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3135C43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C44F12084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MAjqFCEN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfDZUoT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:44:19 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:47086 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbfDZUoT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:44:19 -0400
Received: by mail-vk1-f177.google.com with SMTP id x2so1062174vkx.13
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwiRKdnqqGj6bxYntPpAEzs5BDRdzkObi/6WbwHMQPY=;
        b=MAjqFCENk46uDiknSH1i1wALpYflaxcO31Cc1xmbCrgpYgzz2M4jymmYxywIx0XYiu
         qOLcMmtN6XELivb3E5AFfXwRT1edm1WXBkllhHZX7T9EO08LdRUTZnSmOnrVowF4I0oU
         rzZdzQ5jR1APR5CpIdkNgRO+KyeppsJKmyXZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwiRKdnqqGj6bxYntPpAEzs5BDRdzkObi/6WbwHMQPY=;
        b=X5DWV/dadlvj5fYB5RelOdmHTXwEjEjT3Eukg/W+TpsEz+ERArfZVOxOMLXjTxNu5c
         2l94SRG8cb1iNI/78AINL+K9mkVXfdBC23/hVF5+xssUtyE/EDuViQi5choUpZ2qAqZf
         gY+TuZ8Ra16HanQyRQIcRH3hKnVIkldAOLqgo++voIEYyy4+7RMfFlyWtjZNIziVmGvJ
         pleg19uy+18K3B8Pc9nH62X/ioXH0vAqRH4nMHxYgM6uGyoVP+yVNPy9pacAdy2CCExu
         UVPoD682e8M6MwCv8IKHWeXQ/ZNkIP8WqlQfjqFpTXsk7vXeK2H0AkmNaU/JP6ht38Nq
         CwPg==
X-Gm-Message-State: APjAAAWM5FMpLkJ71udzpELjT3SwADASqh2osOS4iEc+Mz/xV8Dx9OQU
        8DrBaVMGjPTosXcIW/VK7HwuyltL6oI=
X-Google-Smtp-Source: APXvYqzt9Rh1fat1XNuiv74Mzx5wy+e+g2wWNX5LHnk0rK6YiQ16xDmvJY2Rw+6qt1T1d0DmHXwABg==
X-Received: by 2002:a1f:6d46:: with SMTP id i67mr13144286vkc.50.1556311457406;
        Fri, 26 Apr 2019 13:44:17 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id b197sm26683648vkd.9.2019.04.26.13.44.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:44:16 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id j184so2680380vsd.11
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:44:16 -0700 (PDT)
X-Received: by 2002:a67:bc01:: with SMTP id t1mr26417271vsn.149.1556311456105;
 Fri, 26 Apr 2019 13:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <9eed02b9fe96805eedbeb9188d6bca711f6032cc.1555672441.git.arturp@synopsys.com>
In-Reply-To: <9eed02b9fe96805eedbeb9188d6bca711f6032cc.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:44:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vfu5NK6ozujn1uAcHH4hs+mDRPzYL52VhUSm4iNLVXsw@mail.gmail.com>
Message-ID:
 <CAD=FV=Vfu5NK6ozujn1uAcHH4hs+mDRPzYL52VhUSm4iNLVXsw@mail.gmail.com>
Subject: Re: [PATCH v1 03/14] usb: dwc2: Fix wakeup detected and session
 request interrupt handlers.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426204405.-o01kjzNDuPrxes7pDeE5ITOehBt9v6J38RCbgt3hAw@z>

Hi,

On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> @@ -426,8 +438,6 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>                 /* Change to L0 state */
>                 hsotg->lx_state = DWC2_L0;
>         } else {
> -               if (hsotg->params.power_down)
> -                       return;
>

nit: you leave an odd blank line here.  Please delete it.

-Doug
