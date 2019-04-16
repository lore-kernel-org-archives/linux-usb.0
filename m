Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B711C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0908420868
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfDPUHR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 16:07:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53269 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfDPUHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 16:07:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id q16so577604wmj.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 13:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V7upDKtXChnzZTNiof1Jd59nTVFk02XFnl5meaZAkVw=;
        b=BsJXoyUH7AJtuNqK75hiTxHLAKScWaPzclzpa6rmgvVTp1kfKaxmSErnttMm2TurkC
         rZCzS9vQUwYIGkrdlwrAywqjcg1Jl9urOWhHR6jFE3QHwUJvOh/ybzvHEJ6D1DaDU1EO
         GPV5Qwcd8W7Jdu1/zW7VkRBAo9oyeVa/c9EAAAco7Y04v4D5oGJIVer2bgddxht5FTcL
         wVpE/TczCd9BX1TMhpqQKxb3JcspCs4LDWKl3k036nm9EBVy5HseusyV46rVKka2IHoP
         Sc56m19IXTpEkioKqSlVLGWGP1fW00w4lRtlnal4ApgrRJGbpFmy+2hBVSvv3QoNEfiR
         hIaA==
X-Gm-Message-State: APjAAAWO29MeFyCGvlB9SqcmOmcIyW7Tau5n/HPWrIS3IFmc3xU7vgQi
        gITwC4XJmofiIVfY4SqumQeHbijLit8=
X-Google-Smtp-Source: APXvYqyzX9Sls3Yd2jQ7Xcf/RS0k0VN8jYSZ+kkVOElOTlHvagPhM9i4d2w6WPmkjod928q2EprnIw==
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr28502669wmm.30.1555445234776;
        Tue, 16 Apr 2019 13:07:14 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id a11sm52033974wrx.5.2019.04.16.13.07.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 13:07:14 -0700 (PDT)
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <20190415155113.GB7292@roeck-us.net>
 <c66d328e-0cea-9962-1fb6-009f78bf946e@redhat.com>
 <20190415183851.GC22463@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bfdfc19d-f6c3-ea1a-ea71-a2aa8a50c4eb@redhat.com>
Date:   Tue, 16 Apr 2019 22:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415183851.GC22463@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416200713.SaqziC4sa1iJVeFl1mcP9tEtnU2KKaQ4poflMhYBI8E@z>

Hi,

On 15-04-19 20:38, Guenter Roeck wrote:
> On Mon, Apr 15, 2019 at 07:53:58PM +0200, Hans de Goede wrote:
>> Hi Guenter,
>>
>> On 15-04-19 17:51, Guenter Roeck wrote:
>>> On Sat, Apr 13, 2019 at 10:39:53PM +0200, Hans de Goede wrote:
>>>> Some tcpc device-drivers need to explicitly be told to watch for connection
>>>> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
>>>> being plugged into the Type-C port will not be noticed.
>>>>
>>>> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
>>>> watch for connection events. But for single-role ports we've so far been
>>>> falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
>>>> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>>>>
>>>> This commit adds a new start_srp_connection_detect callback to tcpc_dev
>>>> and when this is implemented calls this in place of start_drp_toggling
>>>> for SRP devices.
>>>>
>>>
>>> Do we indeed need an additional callback for this purpose, or would a single
>>> "start_connection_detect" call to replace start_drp_toggling be sufficient ?
>>> If necessary, we could add the port type as argument (if the low level driver
>>> doesn't already know that).
>>
>> A single "start_connection_detect" call to replace start_drp_toggling will be
>> sufficient AFAICT.
>>
>> If you prefer that option, I can rework the patch-set accordingly.
>>
> 
> Yes, I do. I find it quite pointless to have two callbacks if exactly one
> is ever called.

Ok, I've refactored this as requested for v2.

Regards,

Hans


>>>> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
>>>> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>   drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
>>>>   include/linux/usb/tcpm.h      | 6 ++++++
>>>>   2 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>> index a2233d72ae7c..1af54af90b50 100644
>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>> @@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port *port,
>>>>   			return true;
>>>>   	}
>>>> +	if (port->tcpc->start_srp_connection_detect &&
>>>> +	    port->port_type != TYPEC_PORT_DRP) {
>>>> +		tcpm_log_force(port, "Start SRP connection detection");
>>>> +		ret = port->tcpc->start_srp_connection_detect(port->tcpc, cc);
>>>> +		if (!ret)
>>>> +			return true;
>>>> +	}
>>>> +
>>>>   	return false;
>>>>   }
>>>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
>>>> index 0c532ca3f079..bf2bbbf2e2b2 100644
>>>> --- a/include/linux/usb/tcpm.h
>>>> +++ b/include/linux/usb/tcpm.h
>>>> @@ -125,6 +125,10 @@ struct tcpc_config {
>>>>    *		Optional; if supported by hardware, called to start DRP
>>>>    *		toggling. DRP toggling is stopped automatically if
>>>>    *		a connection is established.
>>>> + * @start_srp_connection_detect:
>>>> + *		Optional; if supported by hardware, called to start connection
>>>> + *		detection for single role ports. Connection detection is stopped
>>>> + *		automatically if a connection is established.
>>>>    * @try_role:	Optional; called to set a preferred role
>>>>    * @pd_transmit:Called to transmit PD message
>>>>    * @mux:	Pointer to multiplexer data
>>>> @@ -149,6 +153,8 @@ struct tcpc_dev {
>>>>   			 enum typec_role role, enum typec_data_role data);
>>>>   	int (*start_drp_toggling)(struct tcpc_dev *dev,
>>>>   				  enum typec_cc_status cc);
>>>> +	int (*start_srp_connection_detect)(struct tcpc_dev *dev,
>>>> +					   enum typec_cc_status cc);
>>>>   	int (*try_role)(struct tcpc_dev *dev, int role);
>>>>   	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
>>>>   			   const struct pd_message *msg);
>>>> -- 
>>>> 2.21.0
>>>>
