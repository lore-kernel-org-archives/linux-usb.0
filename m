Return-Path: <SRS0=HzBI=SQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795CBC10F13
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 07:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3530A2148E
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 07:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="fmJGlnb+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbfDNHkc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 03:40:32 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39775 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfDNHkc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 03:40:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id z9so10619775lfh.6
        for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2019 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ketmg7W9ZO3a3XZBsCW5yKqtQYoQw+bSuRqM/fnL+XU=;
        b=fmJGlnb+jSxTXg/VzZjgUBVUOT91cYGkKuBS6hALCFqGWnalyW5XmVfzXOUXPZQL5T
         ej5KyIOMsRXN5CgwhWS0Dn7mKls4mFLvjOvUqCzgr4YFXsHxIcTeyFK8PPGlJYbUcgHI
         iEDOJ/6l9MPNVH/S5U4oVaWu/eGW4ExVAYd5Ogp+XyUlthPs0dKQ8OoShvjPlsV0kyLr
         w1pMA1mPPOmeBZIgctU7Yd1BLWpehTGu/i7FXDyQpOt2yiwhctHCNt6nfSGQPbN81MgV
         ryXgx/g46f2YmqK6FJdnqCM5ecwYMNw2NdkJB7iNoXnHX7AFd8jfAOu4r0Md+n+9QX6n
         xPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ketmg7W9ZO3a3XZBsCW5yKqtQYoQw+bSuRqM/fnL+XU=;
        b=t4n0LLTG7xEraMX29W5iAHrA8LGdpSfNHWVHiTq+y9vgWQCv5gFkkPCZ+GDC1jrYDN
         bbW31g71wo4z+pxZd/1M/rH/yUooWUEm21i1E36O8x2RJWgWvCeuKWLYNhxz2e3tYDKr
         F60JrSRysryYCl7ewcgyzxOh84coPRrktHe530caxnCvrGPFh0mqiJjUiqGgZBQn6/dj
         xc95Cmnfv7gu613MQqwlLnHmeCIa1f057k0DSCbyXbh9ezlCmbeNw2kMhNr0pxyWmrOf
         evk0mlyu8wCNvJTY/Hn+wWUrRbTLWAMtyITv4vDwZh3Ss6c5RaSReSCL55lV79W/UOEP
         QuoQ==
X-Gm-Message-State: APjAAAUHjHkeZ2w1PTh3sKpZZdmt+OSe3uumKWaQpYfQ+7S5k9GOeXjo
        rz53zLiQwj0Mz0DgDYJx/8po1Y8I0LA=
X-Google-Smtp-Source: APXvYqyKY32JSEaFRAEZNbyINbXUb/aiYMxl6wvoNhsxCNdKRO4FiIOHk/42E64ywdklJzTG0z+jRQ==
X-Received: by 2002:ac2:5381:: with SMTP id g1mr36420490lfh.130.1555227630476;
        Sun, 14 Apr 2019 00:40:30 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.85.39])
        by smtp.gmail.com with ESMTPSA id k25sm9273830ljc.14.2019.04.14.00.40.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 00:40:29 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: typec: fusb302: Implement
 start_srp_connection_detect
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <20190413203955.10788-2-hdegoede@redhat.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <61b22729-1729-5f79-ce4e-f9e5cf679ada@cogentembedded.com>
Date:   Sun, 14 Apr 2019 10:40:16 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190413203955.10788-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190414074016.Mo6q5F-WwDOab1z4kC_n-Y9jBZ38hKW4OE23W47_tq8@z>

Hello!

On 13.04.2019 23:39, Hans de Goede wrote:

> When in single role port mode, we most start single-role toggling to

    Must, perhaps?

> get an interrupt when a device / cable gets plugged into the port.
> 
> This commit implements the tcpc_dev start_srp_connection_detect callback
> for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/usb/typec/tcpm/fusb302.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 6ea6199caafa..30413a45104f 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -876,6 +876,34 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
>   	return ret;
>   }
>   
> +static int tcpm_start_srp_connection_detect(struct tcpc_dev *dev,
> +					    enum typec_cc_status cc)
> +{
> +	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
> +						 tcpc_dev);
> +	int ret = 0;

    This initializer is useless.

> +
> +	mutex_lock(&chip->lock);
> +	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
> +	if (ret < 0) {
> +		fusb302_log(chip, "unable to set src current %s, ret=%d",
> +			    typec_cc_status_name[cc], ret);
> +		goto done;
> +	}
> +	ret = fusb302_set_toggling(chip, (cc == TYPEC_CC_RD) ?
> +					 TOGGLING_MODE_SNK : TOGGLING_MODE_SRC);
> +	if (ret < 0) {
> +		fusb302_log(chip,
> +			    "unable to start srp toggling, ret=%d", ret);
> +		goto done;
> +	}
> +	fusb302_log(chip, "start srp toggling");
> +done:
> +	mutex_unlock(&chip->lock);
> +
> +	return ret;
> +}
> +
>   static int tcpm_start_drp_toggling(struct tcpc_dev *dev,
>   				   enum typec_cc_status cc)
>   {
[...]

MBR, Sergei
