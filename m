Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF8FC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 15:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDAEF2148D
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 15:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ID9y5FEA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389102AbfDRPzF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 11:55:05 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:37320 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388495AbfDRPzF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 11:55:05 -0400
Received: by mail-vk1-f195.google.com with SMTP id o187so560884vkg.4
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZfr0dfYVyVMEvcvS40jmVaisVuMSGO4nxRrWwy98wU=;
        b=ID9y5FEA4pwe/H0FEThOAFig//4eVQNDyf30JX/Npl7oEnVxVg9qQaWmNb7JavlVz/
         hYWLb83L/gjCSZG0v7Eoc3L1f+JnkCUL8ItGORSAIwWLNdfgMdI2nC6gGOebJagXraKv
         kYEpdqHqK8moEA0q7fMvAmCWKM2OePFyboU8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZfr0dfYVyVMEvcvS40jmVaisVuMSGO4nxRrWwy98wU=;
        b=afAeU2PfTePOSFjGvsCpScX8uPCADeV5nzBZJ6UQAOey9UVpeYFh6OI/4e8rdVjjZN
         MqZK+9mtox58pEbb56in5xaCdkhhdm3PD9Vw0od2xgAYvFNhfLMkKmVCtK8n6mSevmP9
         s77B1/Wk+aCpytV2D9rGVIs33elj9M6LlsfCK7feof2+297+PWFgmWWyZ0nUOf+Jwgux
         zEZ9u1Yg5uEwIQZS+hxvFRIcFp6TruWRuZPBqXfJ9v9A8MyPzvS0SSCxghnCiiKBMPAD
         uS9IxnTwfStifhLtccsKncKiTb4w9VGtGcqnTaFuFvIFpMmaoXvV6cf59aY7vaChWhOr
         L3Vw==
X-Gm-Message-State: APjAAAWVtBNj0FF3qfJSfyMbri72lwm3CCEjmR29ZJVnKRwrZ3MRl7fy
        23Al4NosK29Z5IcodYwS+EAMo36QS5I=
X-Google-Smtp-Source: APXvYqwjKxC/y731ADq1jpU3vvUIgue2ysGalY8yvuKr2Pej56QlWH+fGHFPXBNMSgpUDEApoIvYCg==
X-Received: by 2002:a1f:56:: with SMTP id 83mr20077368vka.16.1555602904342;
        Thu, 18 Apr 2019 08:55:04 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id u6sm1390825vke.54.2019.04.18.08.55.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 08:55:02 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id s11so1442335vsn.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 08:55:01 -0700 (PDT)
X-Received: by 2002:a67:bc01:: with SMTP id t1mr52844206vsn.149.1555602901359;
 Thu, 18 Apr 2019 08:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190418001356.124334-1-dianders@chromium.org> <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
In-Reply-To: <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Apr 2019 08:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDLqcdq_BypUYsJHKX+DY0VWvCACYgZiHeG8E3Dbwxcw@mail.gmail.com>
Message-ID: <CAD=FV=XDLqcdq_BypUYsJHKX+DY0VWvCACYgZiHeG8E3Dbwxcw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend; enable for rk3288-veyron
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        "amstan@chromium.org" <amstan@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>,
        "zyw@rock-chips.com" <zyw@rock-chips.com>,
        "mka@chromium.org" <mka@chromium.org>,
        "ryandcase@chromium.org" <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jon Flatley <jflat@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 18, 2019 at 5:41 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> Did you consider/reviewed patch series from Artur Petrosyan "[PATCH
> 00/14] usb: dwc2: Fix and improve power saving modes" (submitted on
> April 12) which fixing partial power down and hibernation flows for both
> modes: host and device?
> I suspect that this both patch series can be in conflict.

No, I wasn't aware of them.  I'd like to try them out, but it looks
like it's currently impossible because they're not archived anywhere
that I can find.

1. LKML wasn't copied, so I can't find them on lore.kernel.org.  It is
suggested to CC LKML on all patches.

2. The Linux USB patchwork only has the cover letter plus the first 6
patches.  See <https://patchwork.kernel.org/cover/10898333/>

3. Searching my own archives I only see the cover letter plus the
first 6 patches.

Maybe you have some other pointer to how I can retrieve them?  I guess
I could try the first 6 patches without the later 8 but I'd rather get
the whole set...


-Doug
