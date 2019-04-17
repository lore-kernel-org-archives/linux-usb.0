Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BF8C10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 03:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 805FE20835
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 03:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC9yQgHl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfDQDng (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 23:43:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39856 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfDQDnf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 23:43:35 -0400
Received: by mail-pf1-f195.google.com with SMTP id i17so11417159pfo.6
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/8MKdsYBOZd+4O9Ccw4NrekS70rn9BYxX2nrKeEQWb0=;
        b=fC9yQgHlealf+gW7jtCPSPe/R0m9UUYZMkfPBWnhqSO5x5wzAOrZ8c+3/9OkmkXqTQ
         lplDap7htdn8eezUEO1LI+y8BCG2Gyb3jDOIZFZROgNqCOBHmpjEPsCjfAE0kbNuNMIn
         k0HJbMHRlErWzoPPUZKVbc91BafyR7WbnlMfHb/dIHzPrrPyV3VQ/sm725S1QhtYZdD+
         4eqMeKfXLbyjMnMrb7XQUTwjhlIvyYsE3Dr0C5rCwZJKmvqsykmz7R9nN28K2DN4mUEM
         PsM2ubEo4yHQmQEQ7ymPwJojqFY0ZKpr+IEeL4OrqdV/4nnJfA78vuhhmnhjBQcxp3qQ
         zPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8MKdsYBOZd+4O9Ccw4NrekS70rn9BYxX2nrKeEQWb0=;
        b=cdu48rM+GQXGwnPkEX06Sf5dA6dRj/pZgVyZcuhbkT2NmzelACcsVXLvN8WbFwz04X
         1La8Hd2MYkE/Dc6o6VHAVuQKbK4Jurnpcvt2a2k+dewmB0ymWcMZ+01SUOkVgIrrTJLK
         VZPcW2wvUIyUGOCt+ZM7Mkue3Yoghzdj25MnykhtZjKb8dn5Our0Voi/6eQM5gipm8MV
         03+fxEjFV9rlVd73Jm1cY3wYY1F3LzDfPxPD9r2A1gbM++UlPG8MikST1VBHxJSnKp7x
         YwFlUbQxOMECNDDN350n0/PnV84PgM0pWTdZZ2GwyVPBYIEY7dPFfyKzClr/mYDBEv2n
         4uYA==
X-Gm-Message-State: APjAAAVsNDRFoZ9UX0XOiCksJ91Rs9alXxeHmFhAkhGhLQaMXcht2Gqm
        ilgkXPi5jM7IP4lybzBoTQ6z2p2T
X-Google-Smtp-Source: APXvYqzHjAGINwSQ108bgAF7PEi7HmygSmXtr/6gTYLtKxZkLBBpYV9/v8djZT5S5T91EnzkdcT5XQ==
X-Received: by 2002:a63:1749:: with SMTP id 9mr77351851pgx.94.1555472614947;
        Tue, 16 Apr 2019 20:43:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm67945810pgo.13.2019.04.16.20.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 20:43:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] usb: typec: fusb302: Implement start_toggling for
 all port-types
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190416200754.2826-1-hdegoede@redhat.com>
 <20190416200754.2826-2-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <47b7d24a-c369-d5d8-acf2-09f6aad4bfd4@roeck-us.net>
Date:   Tue, 16 Apr 2019 20:43:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416200754.2826-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417034333.E900E5-YMBDu7zWzqSD2ieKQfGhEtoe_zcRiJZ08akw@z>

On 4/16/19 1:07 PM, Hans de Goede wrote:
> When in single-role port mode, we must start single-role toggling to
> get an interrupt when a device / cable gets plugged into the port.
> 
> This commit modifies the fusb302 start_toggling implementation to
> start toggling for all port-types, so that connection-detection works
> on single-role ports too.
> 
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> -Adjust for the tcpm core renaming start_drp_toggling to start_toggling,
>   instead of adding a new start_srp_connection_detect callback
> ---
>   drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 6d83891cc895..ba030b03d156 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -882,10 +882,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>   {
>   	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
>   						 tcpc_dev);
> +	enum toggling_mode mode = TOGGLING_MODE_OFF;
>   	int ret = 0;
>   
> -	if (port_type != TYPEC_PORT_DRP)
> -		return -EOPNOTSUPP;
> +	switch (port_type) {
> +	case TYPEC_PORT_SRC:
> +		mode = TOGGLING_MODE_SRC;
> +		break;
> +	case TYPEC_PORT_SNK:
> +		mode = TOGGLING_MODE_SNK;
> +		break;
> +	case TYPEC_PORT_DRP:
> +		mode = TOGGLING_MODE_DRP;
> +		break;
> +	}
>   
>   	mutex_lock(&chip->lock);
>   	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
> @@ -894,7 +904,7 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>   			    typec_cc_status_name[cc], ret);
>   		goto done;
>   	}
> -	ret = fusb302_set_toggling(chip, TOGGLING_MODE_DRP);
> +	ret = fusb302_set_toggling(chip, mode);
>   	if (ret < 0) {
>   		fusb302_log(chip,
>   			    "unable to start drp toggling, ret=%d", ret);
> 

