Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53F8C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 13:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D08E206BA
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 13:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoPDMUDr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfDONWW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 09:22:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40555 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfDONWW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 09:22:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id c207so8589298pfc.7
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k823784193+Wbwx+hkiLr5rxpPkmZThfRfkjHzlz5ew=;
        b=WoPDMUDrxIi6ns6AGQphxLi58iaYeHsedZxvIc1tJ+ijbhTRJMOwgK8zg5DxpY1qRd
         CVzsf4ESHAcSvwBz0Dib7W25gGTKh/gh/t+4VbF0y7mRZyOw5TucqpxOd4dBS2WmF6tq
         ioQRLsDNql2ZP/Z2PQKQeXyMrCbBWN/WWPJsNONP4AV0BknHZKUNO1wtwNG8qQzN8gIT
         rK1InhFABUgXFfwWloweZwLj21VChIfM3Ozgvw+rS3sxzOxpMLEkgo75Enf6QrXbMjcd
         1fIuqp9bhGLRpKtpvMX6koeMTOkYNbi73xZQLbLVfKBgl+XL6KiFA6fae+0t/zPDs1au
         jhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k823784193+Wbwx+hkiLr5rxpPkmZThfRfkjHzlz5ew=;
        b=jN7eogvyFqKOyKNRPBGpZ/QITm8vP1qIncYAlQfyETxt9ohbEMJsui2kxlENQJKChE
         uSwe8pl0XEXikC4Km3A/fQpxvuotSTisSnNlgBy93XAh1rwQTrJAWgnbKsto7lBhRWqo
         QOAr5yo5j1P+McpUob30sL1Ceachz5vPS+ThQ2vhKb7mhOALP60aYbNFk55YJ84N4aUL
         bTgRBc+XrodtjfsCOG6WQa9xmwFyhCPLPtX/VHJyyB8gkx6mQZAxk7Z4excI5hLThQwV
         N++OI7aC6wLGZDXZ8yeqcdt9BvQreb02BErVgX7uLCLGuNkwUn5ZqBJu6KnJeSdcHb1+
         N9aA==
X-Gm-Message-State: APjAAAWcZR665YnWQ3uTZo/23E9Urxsr96xku50HAPUCWXg1MLImPCwm
        gULosjKHeLjkDyyN2hAwvVaLo5so
X-Google-Smtp-Source: APXvYqw8tTm8lh66z+j3Vo4R5m/+d1e09FqZ2wLjJRK4hfGboJ7PCr/Fjh1E8FlH8HejO2fd3LhpXQ==
X-Received: by 2002:a63:ef09:: with SMTP id u9mr70420922pgh.126.1555334541164;
        Mon, 15 Apr 2019 06:22:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a72sm41512702pge.0.2019.04.15.06.22.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 06:22:20 -0700 (PDT)
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
To:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <AM5PR1001MB0994B21356503AC1041171E7802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <5bf45d6e-3b72-4b99-b05d-54fe96d11a48@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9b13f77a-300b-0f20-4903-f71538d9c38d@roeck-us.net>
Date:   Mon, 15 Apr 2019 06:22:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5bf45d6e-3b72-4b99-b05d-54fe96d11a48@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415132219.u90aXXyU2FIVYcvnK9UkvzrtvstHg8x6ZE_87DjYqUc@z>

On 4/15/19 3:37 AM, Hans de Goede wrote:
> Hi,
> 
> On 15-04-19 12:31, Adam Thomson wrote:
>> On 13 April 2019 21:40, Hans de Goede wrote:
>>
>>> Some tcpc device-drivers need to explicitly be told to watch for connection
>>> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
>>> being plugged into the Type-C port will not be noticed.
>>>
>>> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to watch for
>>> connection events. But for single-role ports we've so far been falling back to just
>>> calling tcpm_set_cc(). For some tcpc-s such as the
>>> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>>>
>>> This commit adds a new start_srp_connection_detect callback to tcpc_dev and
>>> when this is implemented calls this in place of start_drp_toggling for SRP devices.
>>>
>>> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
>>> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
>>>   include/linux/usb/tcpm.h      | 6 ++++++
>>>   2 files changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index a2233d72ae7c..1af54af90b50 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port
>>> *port,
>>>               return true;
>>>       }
>>>
>>> +    if (port->tcpc->start_srp_connection_detect &&
>>> +        port->port_type != TYPEC_PORT_DRP) {
>>> +        tcpm_log_force(port, "Start SRP connection detection");
>>> +        ret = port->tcpc->start_srp_connection_detect(port->tcpc, cc);
>>> +        if (!ret)
>>> +            return true;
>>> +    }
>>> +
>>
>> Is it a little misleading when reading the state machine code that we're calling
>> tcpm_start_drp_toggling() to actually start SRP detection? Maybe we could rename
>> this function and the associated state to cover both SRP and DRP, or
>> alternatively add a new state for SRP_DETECTION, just to keep logging and code
>> readability clear and then move the above code to a different function just for
>> SRP?
> 
> I'm not in fan of adding a separate state for this. Even though connection
> detection is not really toggling, I've considered changing
> tcpm_start_drp_toggling to tcpm_start_toggling and rename the state to match.
> I think that if we want to drop drp/DRP from the names, that using
> tcpm_start_toggling / TOGGLING is the best solution.
> 
> Also note that on the fusb302, which is the tcpc which needs SRP connection
> detection, this is done using the toggling engine. So just changing the
> names from drp-toggling to toggling seems best.
> 
Agreed.

Guenter

> Regards,
> 
> Hans
> 
> 
> 
>>
>> Functionally though, the change makes sense to me.
>>
>>>       return false;
>>>   }
>>>
>>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h index
>>> 0c532ca3f079..bf2bbbf2e2b2 100644
>>> --- a/include/linux/usb/tcpm.h
>>> +++ b/include/linux/usb/tcpm.h
>>> @@ -125,6 +125,10 @@ struct tcpc_config {
>>>    *        Optional; if supported by hardware, called to start DRP
>>>    *        toggling. DRP toggling is stopped automatically if
>>>    *        a connection is established.
>>> + * @start_srp_connection_detect:
>>> + *        Optional; if supported by hardware, called to start connection
>>> + *        detection for single role ports. Connection detection is stopped
>>> + *        automatically if a connection is established.
>>>    * @try_role:    Optional; called to set a preferred role
>>>    * @pd_transmit:Called to transmit PD message
>>>    * @mux:    Pointer to multiplexer data
>>> @@ -149,6 +153,8 @@ struct tcpc_dev {
>>>                enum typec_role role, enum typec_data_role data);
>>>       int (*start_drp_toggling)(struct tcpc_dev *dev,
>>>                     enum typec_cc_status cc);
>>> +    int (*start_srp_connection_detect)(struct tcpc_dev *dev,
>>> +                       enum typec_cc_status cc);
>>>       int (*try_role)(struct tcpc_dev *dev, int role);
>>>       int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type
>>> type,
>>>                  const struct pd_message *msg);
>>> -- 
>>> 2.21.0
> 

