Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19642C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB6FB206B6
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wgu1oUuG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbfDPVyk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 17:54:40 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:38626 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730708AbfDPVyj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 17:54:39 -0400
Received: by mail-ua1-f67.google.com with SMTP id t15so7243468uao.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aZn+GdxcQLNV9rNNFIxxXnN5hhRchD8i4/I2eKH3M5o=;
        b=Wgu1oUuGb5Fpsidxj26k8qFo6rzH1n1b1eWU2o50/BkvYcHj0padMXcgaAcgJ6XWlw
         HrTvc/nDDk3jB2mugPjbTL6QSLS850ndb7DFWNSIYjUkfhsHi056qRJwDt7xMiQTjKtR
         B+zfxmpov+s+VNAPC+Pp16v6b7SZOVYPAkBcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aZn+GdxcQLNV9rNNFIxxXnN5hhRchD8i4/I2eKH3M5o=;
        b=GQsG+fFvHhu5+7FJFdjVIvVt5uCQ5ePIJ7J5DZA1+8w+BgXz7/Bn632ATKFujmvcpv
         GS7qyj1fpI7orY3dv+OPv69Q+z5zh/5jP4XpCaqOS+KCJVUv/DyoKVPMUXieSj5M8xHO
         I3CSIX/oCyGwNB3woC5EVnzrSe4Pg/UyC7/vlEP+CdTMU4HuEcr6comQcNAS9Q1Mjalh
         n4XypWZDuPBHSkL3sBa1Om7oWwcoC96tsKIs6BoGK0FBmKzVLChV5olJFImPXn+pmg6b
         PcL9gZvb6kjH1JICJPriL/wNeOmvMqPuCjzZg+7ucrh+WZ2QNCX9x6ZkDDZxLYYzE8IA
         OwUQ==
X-Gm-Message-State: APjAAAWLuSpN5Tbi5/yWBNjXrw3pJLd+6YhYumR/mz6XnCn7C7ikRpGF
        oElTsnRuWzIy83Ju3l+X6cAY1fxhID8=
X-Google-Smtp-Source: APXvYqzAss0nmkCVmjED8knFbre1CFx9BqZQEfyN2VDySzfwksCWqNbjLI6FRtmIZVJnfywkLhqjLA==
X-Received: by 2002:ab0:2886:: with SMTP id s6mr4645619uap.93.1555451677953;
        Tue, 16 Apr 2019 14:54:37 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 110sm44396897uaq.7.2019.04.16.14.54.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 14:54:37 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id d8so12461934vsp.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 14:54:36 -0700 (PDT)
X-Received: by 2002:a67:1603:: with SMTP id 3mr43643535vsw.13.1555451676483;
 Tue, 16 Apr 2019 14:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190412224149.106971-1-dianders@chromium.org>
 <20190412224149.106971-3-dianders@chromium.org> <20190412235633.GY112750@google.com>
In-Reply-To: <20190412235633.GY112750@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 16 Apr 2019 14:54:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vy8A2PE+EeYJi7n7O8c2_JuCpvHLiMXL_Ad-kqW208QA@mail.gmail.com>
Message-ID:
 <CAD=FV=Vy8A2PE+EeYJi7n7O8c2_JuCpvHLiMXL_Ad-kqW208QA@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: dwc2: optionally assert phy reset when waking up
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alexandru M Stan <amstan@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>,
        Ryan Case <ryandcase@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Yunzhi Li <lyz@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416215423.o9ouDFFe3cuzSm89W8ioGxl86cw9nXTJW_LN_bf4E7M@z>

Hi,

On Fri, Apr 12, 2019 at 4:56 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > @@ -5271,11 +5282,10 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
> >               hsotg->hc_ptr_array[i] = channel;
> >       }
> >
> > -     /* Initialize hsotg start work */
> > +     /* Initialize work */
> >       INIT_DELAYED_WORK(&hsotg->start_work, dwc2_hcd_start_func);
> > -
> > -     /* Initialize port reset work */
> >       INIT_DELAYED_WORK(&hsotg->reset_work, dwc2_hcd_reset_func);
> > +     INIT_WORK(&hsotg->phy_reset_work, dwc2_hcd_phy_reset_func);
>
> You also want to make sure that the work is cancelled when the
> controller is stopped/removed. It seems dwc2_hcd_stop() would be a
> suitable place for that.

Good point.  dwc2_hcd_stop() doesn't work though because it's called
with interrupts disabled (because it's holding the hsotg->lock
spinlock).  I put it in dwc2_hcd_free() where there's another similar
cancel.

-Doug
