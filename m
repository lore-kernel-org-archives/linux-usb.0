Return-Path: <SRS0=PVOx=U3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7929C4321A
	for <linux-usb@archiver.kernel.org>; Fri, 28 Jun 2019 17:34:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEAAB214AF
	for <linux-usb@archiver.kernel.org>; Fri, 28 Jun 2019 17:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QL+daD/S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfF1Rem (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 28 Jun 2019 13:34:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34417 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfF1Rem (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 13:34:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so7136629wrl.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wfYsXjgMtSJMKRVcej6axjnBpa0bNSgyGbaA3V/sZW0=;
        b=QL+daD/S/+WS/smsjeTHTw9ZQlYVxzs1Hk5IrT5MoLHHxjQ41/WsN9x5rSz4rDY8cq
         bGs7JwpqrM9VhUGjWwn5AdA6O2FuhYND40p1hLKl9RN9eU1pMf2a9YXqVJsKKXjQ5fkM
         SbVL+xlN3Jmu1cGTVZ3M/3H2z4NUS7sldsTH1yONdPed0mfjY5JukxMYzhksHSUPdFnw
         CMIikWvPv1u0IEE/KSDTJEOHQrTaHyLQQTMvBuI+uDVJNaBk5D7CBu0UYTbr+4NIBm0p
         HMatXjCaSvKgTVQRKqFj6Bu+TObQ4ahJ9esshlrJqKbmLdEWZzc8oi5MSSwWAH6eQgZ7
         1XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wfYsXjgMtSJMKRVcej6axjnBpa0bNSgyGbaA3V/sZW0=;
        b=h3fanIIVOmNb2gyyFEHu7XDW1ULVrwMF0s0mLI/mG2zx9mJ8hDJ1gmgLPno4DKEUyj
         WsyCd/FRnvCkGx1tIvJaZHN2WYWquoqSWOmtv62L6ekx5RsMYqufjW78o1wlEoYChVnE
         pf92aBJh6hcDAddzEHIxQXBk0cR2Who/9mBi+iiDqkzIQCSY9EUViRI56Yg8mO5Qadb9
         wbOAfsts0djtq1SRvMADcKWQcElUtHulKzoXFOPFhhwRZ6LC6wme3nIgtMr5mvvIlfCH
         CQurS5I31lvNMQRY1YKIs+9zFZkRjPH1i70oebBx7N9m3iUMvMi5U4A2Kkj9/HalLhZH
         8nFw==
X-Gm-Message-State: APjAAAVisgfDMw+a3Oq6Ghrfv/Fs26leeicQRxkE4QQ1szPKSOzWTqVi
        e0iMEUlrlGxffRFOCBRq7c+BUptsXizviSYAA4Z+DQ==
X-Google-Smtp-Source: APXvYqwIMk+3js1vyyzfs0+8+SEezw5y0QHn3rHvhObht78rWwNV0/WRBUzjVvVk8VSbC/m9LLKB7FyHHrzBYPwfAQE=
X-Received: by 2002:adf:afe8:: with SMTP id y40mr8241222wrd.328.1561743279906;
 Fri, 28 Jun 2019 10:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190627205240.38366-1-john.stultz@linaro.org>
 <20190627205240.38366-9-john.stultz@linaro.org> <20190628055414.GA3380@jackp-linux.qualcomm.com>
In-Reply-To: <20190628055414.GA3380@jackp-linux.qualcomm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 28 Jun 2019 10:34:27 -0700
Message-ID: <CALAqxLWop2uYWJSz3P8i+bqGqJD0v6mcYTjJ8szHma3qfkT5LA@mail.gmail.com>
Subject: Re: [PATCH 4.19.y 8/9] Revert "usb: dwc3: gadget: Clear
 req->needs_extra_trb flag on cleanup"
To:     Jack Pham <jackp@codeaurora.org>
Cc:     stable <stable@vger.kernel.org>, Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 27, 2019 at 10:54 PM Jack Pham <jackp@codeaurora.org> wrote:
> On Thu, Jun 27, 2019 at 08:52:39PM +0000, John Stultz wrote:
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 879f652c5580..843586f20572 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -177,8 +177,6 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
> >       req->started = false;
> >       list_del(&req->list);
> >       req->remaining = 0;
> > -     req->unaligned = false;
> > -     req->zero = false;
>
> Given that these structure members are removed in Patch 1/9, wouldn't
> having these lines remain until this revert patch present compilation
> errors when applying the patches in this series individually?
>
> For bisectability would it be better to fix-up Patch 1 to also convert
> these two flags to req->needs_extra_trb in one shot? Alternatively you
> could sandwich Patch 1 between Patch 8 & 9.

Ah. Good point! I'll respin this.  Thanks for looking this over!

thanks
-john
