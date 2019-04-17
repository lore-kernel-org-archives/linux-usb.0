Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2C3C10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 03:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C58720835
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 03:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA0+nPKp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfDQDoD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 23:44:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34694 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfDQDoD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 23:44:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id v12so11352812pgq.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 20:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kxkg2up5dNSEscCpvIE34ruv/snExaIt0hVZAcbuTTk=;
        b=iA0+nPKpxgLLB5e0BPBm2iNv/ZwlFU4rumi1a+he+p2lZHdAu57TNP97N24JJntDmJ
         lATAvkLVc0TvH6hCN86mZ5fPXXT1SHXy/t032logp9Y4GTT6shmnOe6ASLCwgj538hfb
         gfUbA42o/OoGbDVoe1wuUaqHZoxcIX3y64eQ5RtX1/mkouxclzWRHZptEsQPAFZmAEot
         lyHRi9QUEAiFGSP6nHljRdDZtKQMJgb//cxdipzQAf9eYr4a/bzWOTvCxN8Okctc/qpn
         CnAzqh7f0tfr1neHvw1DACkYqDl+PC2+lIsH2mvQXZmkpHySN7C/80kXO7WLZxUNSV4z
         UwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kxkg2up5dNSEscCpvIE34ruv/snExaIt0hVZAcbuTTk=;
        b=TOz/OZKd4UElO+wpf/Pr7eqP+5nmfMcVwP1uKdPL5LUKjMdkyl1CmqPFaN2LH3e1KW
         SrFceLaHwhaQosiPQ+tIOh1zO8vuCm7miRvo/5YQKZrRsJG6JV/x9w8020nlOKIHZ6EN
         Is3JgT8Qyovwd2dW49VG0LbONd0BTAbmWSfvmQz6RTQiWFD3quqbi8QuphypyoyU2CSY
         kzsgBSLBekjJerMIPjnaVfay/kcog+QSz2FoCurQ0fv6YZ1NdH6WEgH7NbOOIvk5pmSh
         ud5ib5x1dcS4ppOuTIzThcmOo44c/zbJKCi5JXBCEyDi2xDjt+tNkE1+notDIwIe3spw
         e9bA==
X-Gm-Message-State: APjAAAWI41ln/WD3X50LWCKdUnrJNmndKFSIbPz96PZqA+Sp5lflUp07
        p55s/JiC47tW0VBKOOWz6M2uiYdu
X-Google-Smtp-Source: APXvYqxyaJT73ZAfxyAjpLaYZLQxdw8dojSSiZa76SdRCH5WFXs4AHonDM0FgRbgMZviI+y1q+C8wA==
X-Received: by 2002:a63:c40c:: with SMTP id h12mr68658555pgd.39.1555472642605;
        Tue, 16 Apr 2019 20:44:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c5sm35525190pgh.5.2019.04.16.20.44.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 20:44:02 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] usb: typec: fusb302: Revert "Resolve fixed power
 role contract setup"
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190416200754.2826-1-hdegoede@redhat.com>
 <20190416200754.2826-3-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <34f5ec89-0164-e403-6bf1-38a3743281ea@roeck-us.net>
Date:   Tue, 16 Apr 2019 20:44:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416200754.2826-3-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417034401.jlxwsOomzZuopSms6nJB3UpcOd4gdwHfCAqaaW4uWus@z>

On 4/16/19 1:07 PM, Hans de Goede wrote:
> Some tcpc device-drivers need to explicitly be told to watch for connection
> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
> being plugged into the Type-C port will not be noticed.
> 
> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
> watch for connection events. But for single-role ports we've so far been
> falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
> 
> Commit ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role
> contract setup") fixed SRPs not working because of this by making the
> fusb302 driver start connection detection on every tcpm_set_cc() call.
> It turns out this breaks src->snk power-role swapping because during the
> swap we first set the Cc pins to Rp, calling set_cc, and then send a PS_RDY
> message. But the fusb302 cannot send PD messages while its toggling engine
> is active, so sending the PS_RDY message fails.
> 
> Struct tcpc_dev now has a new start_srp_connection_detect callback and
> fusb302.c now implements this. This callback gets called when we the
> fusb302 needs to start connection detection, fixing fusb302 SRPs not
> seeing connected devices.
> 
> This allows us to revert the changes to fusb302's set_cc implementation,
> making it once again purely setup the Cc-s and matching disconnect
> detection, fixing src->snk power-role swapping no longer working.
> 
> Note that since the code was refactored in between, codewise this is not a
> straight forward revert. Functionality wise this is a straight revert and
> the original functionality is fully restored.
> 
> Fixes: ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> -No changes
> ---
>   drivers/usb/typec/tcpm/fusb302.c | 55 ++++++++++++++++++++++++++------
>   1 file changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index ba030b03d156..4328a6cbfb69 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -606,19 +606,16 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
>   			    FUSB_REG_SWITCHES0_CC2_PU_EN |
>   			    FUSB_REG_SWITCHES0_CC1_PD_EN |
>   			    FUSB_REG_SWITCHES0_CC2_PD_EN;
> -	u8 switches0_data = 0x00;
> +	u8 rd_mda, switches0_data = 0x00;
>   	int ret = 0;
> -	enum toggling_mode mode;
>   
>   	mutex_lock(&chip->lock);
>   	switch (cc) {
>   	case TYPEC_CC_OPEN:
> -		mode = TOGGLING_MODE_OFF;
>   		break;
>   	case TYPEC_CC_RD:
>   		switches0_data |= FUSB_REG_SWITCHES0_CC1_PD_EN |
>   				  FUSB_REG_SWITCHES0_CC2_PD_EN;
> -		mode = TOGGLING_MODE_SNK;
>   		break;
>   	case TYPEC_CC_RP_DEF:
>   	case TYPEC_CC_RP_1_5:
> @@ -626,7 +623,6 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
>   		switches0_data |= (chip->cc_polarity == TYPEC_POLARITY_CC1) ?
>   				  FUSB_REG_SWITCHES0_CC1_PU_EN :
>   				  FUSB_REG_SWITCHES0_CC2_PU_EN;
> -		mode = TOGGLING_MODE_SRC;
>   		break;
>   	default:
>   		fusb302_log(chip, "unsupported cc value %s",
> @@ -637,6 +633,12 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
>   
>   	fusb302_log(chip, "cc := %s", typec_cc_status_name[cc]);
>   
> +	ret = fusb302_set_toggling(chip, TOGGLING_MODE_OFF);
> +	if (ret < 0) {
> +		fusb302_log(chip, "cannot set toggling mode, ret=%d", ret);
> +		goto done;
> +	}
> +
>   	ret = fusb302_i2c_mask_write(chip, FUSB_REG_SWITCHES0,
>   				     switches0_mask, switches0_data);
>   	if (ret < 0) {
> @@ -655,10 +657,45 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
>   		goto done;
>   	}
>   
> -	ret = fusb302_set_toggling(chip, mode);
> -	if (ret < 0)
> -		fusb302_log(chip, "cannot set toggling mode, ret=%d", ret);
> -
> +	/* enable/disable interrupts, BC_LVL for SNK and COMP_CHNG for SRC */
> +	switch (cc) {
> +	case TYPEC_CC_RP_DEF:
> +	case TYPEC_CC_RP_1_5:
> +	case TYPEC_CC_RP_3_0:
> +		rd_mda = rd_mda_value[cc_src_current[cc]];
> +		ret = fusb302_i2c_write(chip, FUSB_REG_MEASURE, rd_mda);
> +		if (ret < 0) {
> +			fusb302_log(chip,
> +				    "cannot set SRC measure value, ret=%d",
> +				    ret);
> +			goto done;
> +		}
> +		ret = fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
> +					     FUSB_REG_MASK_BC_LVL |
> +					     FUSB_REG_MASK_COMP_CHNG,
> +					     FUSB_REG_MASK_COMP_CHNG);
> +		if (ret < 0) {
> +			fusb302_log(chip, "cannot set SRC interrupt, ret=%d",
> +				    ret);
> +			goto done;
> +		}
> +		chip->intr_comp_chng = true;
> +		break;
> +	case TYPEC_CC_RD:
> +		ret = fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
> +					     FUSB_REG_MASK_BC_LVL |
> +					     FUSB_REG_MASK_COMP_CHNG,
> +					     FUSB_REG_MASK_BC_LVL);
> +		if (ret < 0) {
> +			fusb302_log(chip, "cannot set SRC interrupt, ret=%d",
> +				    ret);
> +			goto done;
> +		}
> +		chip->intr_bc_lvl = true;
> +		break;
> +	default:
> +		break;
> +	}
>   done:
>   	mutex_unlock(&chip->lock);
>   
> 

