Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2C5C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0ACC2084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oUIb39Pk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbfDZUqX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:46:23 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42302 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfDZUqX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:46:23 -0400
Received: by mail-vs1-f65.google.com with SMTP id w20so2693143vso.9
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tm6bYq/L1hYWL052OVXEAwFH2Ae6/TSWYjBRKME2rwo=;
        b=oUIb39PkYR2JLcmsFO7dF8tzTaIuEWxFE3a4YYTyYTMDrUjBhAdodvaFBLue32+HYM
         5c9ffu6dJr5pFgJ5ya2qadciVTVzR5eJFUi/GNQ1Bl/CF3Uxz4gdCHEaWZdphtZ9B21q
         4DP4XqcgqcLXsIBe3CQxy8qZ1hjx6uobcbiy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tm6bYq/L1hYWL052OVXEAwFH2Ae6/TSWYjBRKME2rwo=;
        b=SSCv+vt9PHHYshyTc0DBbcBVrCb5KU39DEXE5guGJoonLh0T4OpemkDBp+AgRu2jlu
         OelbEA2SMiugFVPvM/uegRZmrwCe4IlQqXrJhMw1MdiOswC90izNKCroQ/rpH28U17oF
         xSVnYmk5OTCr2vXRKbvYZwE7ihdRKtBsFkKa1fb7b+V587uCGpn5O0gsYjH3pboddDcC
         wZU0unNIg2LCrixYk2E89PljI+XaT1idigHnf5Dtf3iAAsDCcAYdqIjIyz7tWrj269/x
         I++hoOxZDwejJwW/VTRFe5ytF2peNjThBVfEf+77iGeVhzPscfbPZBP+tcADgFhnTGq8
         LcDw==
X-Gm-Message-State: APjAAAWe7ScS+aCd2DNdd73G3leVtQtAFIg3l9rzwTn9H/8+IyQSv38v
        367a1vGOmywZpKF9PZMHNaJyzVW4PVw=
X-Google-Smtp-Source: APXvYqw1NSy1k8l6QwMdwSoEEIEYD/lWqZH9gpiwZFqoPUiKVtgcmberdXBHmp4/xgMlEpiTNogSsw==
X-Received: by 2002:a67:f615:: with SMTP id k21mr24927109vso.136.1556311581998;
        Fri, 26 Apr 2019 13:46:21 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id l11sm2228606vkd.30.2019.04.26.13.46.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:46:21 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id t23so2689274vso.10
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:46:21 -0700 (PDT)
X-Received: by 2002:a67:b102:: with SMTP id w2mr7992049vsl.20.1556311580654;
 Fri, 26 Apr 2019 13:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
In-Reply-To: <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:46:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
Message-ID:
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] usb: dwc2: Add default param to control power optimization.
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
Message-ID: <20190426204609.YJpm34tcqi4H0HjBYxhIEcNTXylhJXOokUwiLOEStHE@z>

Hi,

On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> - Added a default param "power_saving" to enable or
>   disable hibernation or partial power down features.
>
> - Printed hibernation param in hw_params_show and
>   power_saving param in params_show.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>  drivers/usb/dwc2/core.h    |  3 +++
>  drivers/usb/dwc2/debugfs.c |  2 ++
>  drivers/usb/dwc2/params.c  | 19 +++++++++++++------
>  3 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 30bab8463c96..9221933ab64e 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -373,6 +373,8 @@ enum dwc2_ep0_state {
>   *                      case.
>   *                      0 - No (default)
>   *                      1 - Yes
> + * @power_saving:      Specifies if power saving is enabled or not. If it is
> + *                     enabled power_down functionality will be enabled.
>   * @power_down:         Specifies whether the controller support power_down.
>   *                     If power_down is enabled, the controller will enter
>   *                     power_down in both peripheral and host mode when

Why are you adding a new parameter?  power_saving should be exactly
the same as "power_down != DWC2_POWER_DOWN_PARAM_NONE".  Just use that
anywhere you need it.

Having two parameters like you're doing is just asking for them to get
out of sync.  ...and, in fact, I think they will get out of sync.  On
rk3288, for instance:

-> dwc2_set_default_params()
---> power_saving = true
---> dwc2_set_param_power_down()
-----> power_down = DWC2_POWER_DOWN_PARAM_PARTIAL
-> set_params(), which is actually dwc2_set_rk_params()
---> power_down = 0


...so at the end of dwc2_init_params() you will have power_saving =
true but power_down set to DWC2_POWER_DOWN_PARAM_NONE.  That seems
bad.  ...and, in fact:

# grep '^power' /sys/kernel/debug/*.usb/params
/sys/kernel/debug/ff540000.usb/params:power_saving                  : 1
/sys/kernel/debug/ff540000.usb/params:power_down                    : 0
/sys/kernel/debug/ff580000.usb/params:power_saving                  : 1
/sys/kernel/debug/ff580000.usb/params:power_down                    : 0


...so while you could fix all of the various set_params() functions,
it seems better to just drop this patch since I don't think it buys
anything.

-Doug
