Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1167C10F13
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 01:12:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 742F420869
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 01:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRPZ6tuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfDLBMp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 21:12:45 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34589 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDLBMo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 21:12:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id r186so3131139wmf.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 18:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6t9fDuLGcu+F3sQB7g2ficOIVeXLxhNqKwl9GmNOHE=;
        b=yRPZ6tuIJ8qTSy3AYcGz9Vimw4SGUiH6/6xdFBD6xllQCoGYzJK2iZPSTH+MvV4ACF
         n+p2vkJMXfaVFYl58duMQhiVMEFvgoT0h/Y7FcOYFMVDQTVD1C6363Ute6pSRt5d8L7V
         5MKjlkiwuTBZUf66CFNKvRwCeDop6gJO/34nKaxo82HjoMdSFAFe9WygWUhYVecdgoXZ
         Nz7GUKzw6dtDaM3ogJ9W5sZ6PJH3QTUDgvmMyVqMQ2Y6TpV7+jz5C9FMCyMOpgBVcZoW
         xuRVh5uv46cC50DiezLLSziaED0hZIEBpqHYE43YuFWIA9KCsbvPjBG2lQH1Awdi23y+
         Z1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6t9fDuLGcu+F3sQB7g2ficOIVeXLxhNqKwl9GmNOHE=;
        b=Mu1EoX7TxrJofwFtxQ2RXrgypQmxNQc5puXC1LUDOnsYzdwlT3ywGqXZDQTd7gSmub
         z5jaMKNRfyJO92kptaLYAqWqGllgLEOg9ZIwlOA1P99D7GKMgDplKwMHno/3V/ZFj0vB
         WEwz66quUFeF1NIiijuYkAxB/thohiN69O3WVLtE60943S85F9t+TIe5tEE2DFeKQ8TH
         CpjQfafYPta6RpvWVPhel6/SlMBGwlB2Nq987hzRZwhLz67D4RocC9iiYopT38buh4/c
         1tMqQ7GROggk4kMqgzvKGE5pYcREsvRRd8fXauF5zASIBFPwP7RCoXmJnHRrf81ENyl5
         zIXA==
X-Gm-Message-State: APjAAAW0b+mwFWmTHEQghFky5F0/ZrCjmBp2WmVz22pJJ6P5mGzsmcIt
        pSwbyIYRSfBqvB/mimw9BYIsoctRmHGVvPO9ggcyvg==
X-Google-Smtp-Source: APXvYqwYuRDeUgwOa9EiKKBjsIxY1nRhXsSMG4LlmEAt0MXG+Zv9NmSEmInkrpRSEySYfHClcM4otK9ut+dM6HxszQ4=
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr8196227wmh.81.1555031562719;
 Thu, 11 Apr 2019 18:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190329041409.70138-1-chenyu56@huawei.com> <20190329041409.70138-10-chenyu56@huawei.com>
In-Reply-To: <20190329041409.70138-10-chenyu56@huawei.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 11 Apr 2019 18:12:30 -0700
Message-ID:
 <CALAqxLUQW03waz0LETcnYpc7qhm=RG6RfwbGVZ7MQz00jTZSWQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] usb: roles: Add usb role switch notifier.
To:     Yu Chen <chenyu56@huawei.com>
Cc:     Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Zhuangluan Su <suzhuangluan@hisilicon.com>,
        Kongfei <kongfei@hisilicon.com>,
        "Liuyu (R)" <liuyu712@hisilicon.com>, wanghu17@hisilicon.com,
        butao <butao@hisilicon.com>, chenyao11@huawei.com,
        fangshengzhou@hisilicon.com,
        Li Pengcheng <lipengcheng8@huawei.com>,
        songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>,
        xuyoujun4@huawei.com, Yudongbin <yudongbin@hisilicon.com>,
        Zang Leigang <zangleigang@hisilicon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412011230.FlqpYggbif_3E0HortvxIFWHdpXJmO4VUxB5L0KA6Ao@z>

On Thu, Mar 28, 2019 at 9:14 PM Yu Chen <chenyu56@huawei.com> wrote:
>
> This patch adds notifier for drivers want to be informed of the usb role
> switch.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>

Hey Yu Chen!
   Thanks again for sending this patch out! As mentioned in my
comments with the other patches, I've got one proposal I wanted to
share to try to avoid  state initialization races that I've seen with
this patchset.

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index f45d8df5cfb8..e2caaa665d6e 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -58,6 +61,20 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
>
> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +                                     struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_register(&sw->nh, nb);
> +}
> +EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);

As noted earlier, one issue I've seen is that the hisi_hikey_usb
driver's notifier may not get called early enough to receive
notification of the initial usb state.

It seems like on registration here, we should take the lock, read the
role state and immediately call the notifier to properly initialize
it? I suspect that should close the window for any state races around
driver probe timings and

Does that make sense? I have roughly prototyped this but need to do
additional testing.

thanks
-john
