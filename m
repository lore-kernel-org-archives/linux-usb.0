Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9314C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 10:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AC5220818
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 10:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="blV4sA8E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfDIKgR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:36:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45000 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfDIKgR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 06:36:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id h18so3483168lfj.11
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UAw9QiYDP8ZLR6rjqbOsp057BTBy4N/6x7Ni502ccbM=;
        b=blV4sA8E2tZ0+Gj2ekGzQGWHuPSgSyxG/zW1xetjm/mlCakJ88/z/wh7ZMu2CFOMGq
         av1Ho5mN+m1qZdyL8f5TcaoEJCnX8nWB8Zutaw/70hQNW1ATZ1sxOpnizUVQeixkshH6
         NayXs8IKKbUm8gPWpbFqKNecbz0gJUdC1F9pj4RN7vsj/t6ilVlEcTwHo9AfaViIrh7u
         KUxiS7zztefUqo7wSJsLAk+gyIfbguaDMpU5JCuTCF8I4OgCfUUdtAogKllDkey6k5XI
         ZQIkXilwB7kZ09pJ/7iqs2aUVaAt8F/wmTjMd25RyjcHvBBedSbysxpWKei1U7NV4StF
         T2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UAw9QiYDP8ZLR6rjqbOsp057BTBy4N/6x7Ni502ccbM=;
        b=ViNgQZi78JDl/8M7ekf/9NsJeZYdeBXaTEBDtIK3EVAWVKI1VeOX8hDbmv9dcyoP0M
         M/ODRlifyJJyR7e8V9LztvvA5GPZ/e5fefwXeTqIZPOo6kebvl1KBBHr/aBMp4Y3ryj0
         AE+uDGtdfbacdahrPpWLNM0SYHIUATWgAuyrhuonBW9YGCHgeAtExI4wwCISI6RNGZ+U
         /KHvqTYlJpjHt2/DGhPFJe0R8EGuf0H/seoKjR4Fa8g3jxsP0rU9/qH/tYFsDyyLR4LY
         RSaOyTa8gKh4XT3hISyg/IYpgdDcj8As6yv67L/LNYJ2UpweOD6AgSlnzlmdCiLEBMbv
         IWNQ==
X-Gm-Message-State: APjAAAVpGfe3pzQc/hCc4SwJmFov/CJOCBeBBSnT/WbhNet22+jAXL93
        Yl0Va5BLi2l7b0ZFbndeI6Xcpg==
X-Google-Smtp-Source: APXvYqy2mabD3xIsJEgr4+SjQt0GXR4BE6NUZHwOv5sQiYKZrh6xm3WLuAKC417d7KZv+WEXZl0rxw==
X-Received: by 2002:a19:7503:: with SMTP id y3mr19059196lfe.83.1554806175295;
        Tue, 09 Apr 2019 03:36:15 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.225])
        by smtp.gmail.com with ESMTPSA id q5sm5129872lff.30.2019.04.09.03.36.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 03:36:14 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] usb: ohci-da8xx: let the regulator framework keep
 track of use count
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190409082855.15373-1-brgl@bgdev.pl>
 <20190409082855.15373-3-brgl@bgdev.pl>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7c968006-0cdc-d4cf-622f-9cda52490aa1@cogentembedded.com>
Date:   Tue, 9 Apr 2019 13:36:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190409082855.15373-3-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190409103612.o2qAzDEYY3DC0BsTWfnpq6bV7kIQ_93TLw0MvVVplSk@z>

On 04/09/2019 11:28 AM, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There's no reason to have a separate variable to keep track of the
> regulator state. The regulator core already does that. Remove
> reg_enabled from struct da8xx_ohci_hcd.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
>  drivers/usb/host/ohci-da8xx.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index ca8a94f15ac0..9c6d1f03b871 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
[...]
> @@ -100,21 +99,18 @@ static int ohci_da8xx_set_power(struct usb_hcd *hcd, int on)
>  	if (!da8xx_ohci->vbus_reg)
>  		return 0;
>  
> -	if (on && !da8xx_ohci->reg_enabled) {
> +	if (on) {
>  		ret = regulator_enable(da8xx_ohci->vbus_reg);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable regulator: %d\n", ret);
>  			return ret;
>  		}
> -		da8xx_ohci->reg_enabled = 1;
> -
> -	} else if (!on && da8xx_ohci->reg_enabled) {
> +	} else if (!on) {

  This can be reduced to simple *else* now.

>  		ret = regulator_disable(da8xx_ohci->vbus_reg);
>  		if (ret) {
>  			dev_err(dev, "Failed  to disable regulator: %d\n", ret);
>  			return ret;
>  		}
> -		da8xx_ohci->reg_enabled = 0;
>  	}
>  
>  	return 0;

MBR, Sergei
