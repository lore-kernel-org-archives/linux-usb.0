Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CE7C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 10:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA66B2064A
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 10:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfDOKh5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:37:57 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33243 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfDOKh5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 06:37:57 -0400
Received: by mail-ed1-f65.google.com with SMTP id d55so13430109ede.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 03:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aS2qG1J4X3KzsghVEjcCsTp1GYQKnqEXf285VBMmDW0=;
        b=sTgTYpPovdnkLyzvPz8ycOnrcNzHCaNEdM+ME1dVHlCMvOkFGfsWNgMiEu3Pzb4+y0
         xdYk5qWTAb3GPDRa/vPQzglQrrlE8DqKd+n9W1gwUuwedWiwZTc9KqJCJRHg9L4HcOkO
         zdONbrohuHxwRGNny8JSsHiZ61ylU74xeq9QfkDxztTdqxV4CWj+dX4nAMMX/GI+DkGM
         Xa3N1cUGi4Y7E2tHJI5qETHxlV/Frq7FsBsaBoiQGrYHmC1y4so2g7YL+xaGHA7MqhAf
         JuH78NS06x4nXZ2E7z4DKujId/+UTky2JoWuOshpV90Lh6/zThR7GKYb5NmLpMfvSAw7
         dFlA==
X-Gm-Message-State: APjAAAU+DQsDQtsnwaGQg2PsGPq4f5Z84p7qnUCZvxELsPu6630aGd4/
        r4zX1ZOxyoYAECwACYUE1Gi8gxvwSUc=
X-Google-Smtp-Source: APXvYqypm+qENU0YX3ZrXD4wccbMEF49+XT69CPA/I9zCXwL7pxxfRMmY2D/8irmnPgPun70sMG8ng==
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr40590242eja.123.1555324674542;
        Mon, 15 Apr 2019 03:37:54 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id c18sm9040289ejo.35.2019.04.15.03.37.53
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:37:53 -0700 (PDT)
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Kyle Tso <kyletso@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <AM5PR1001MB0994B21356503AC1041171E7802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5bf45d6e-3b72-4b99-b05d-54fe96d11a48@redhat.com>
Date:   Mon, 15 Apr 2019 12:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB0994B21356503AC1041171E7802B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415103752.B25TQxVILqiZN_r0ZKjAQ3wDvbOJT09JQRv3apMwwdE@z>

Hi,

On 15-04-19 12:31, Adam Thomson wrote:
> On 13 April 2019 21:40, Hans de Goede wrote:
> 
>> Some tcpc device-drivers need to explicitly be told to watch for connection
>> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
>> being plugged into the Type-C port will not be noticed.
>>
>> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to watch for
>> connection events. But for single-role ports we've so far been falling back to just
>> calling tcpm_set_cc(). For some tcpc-s such as the
>> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>>
>> This commit adds a new start_srp_connection_detect callback to tcpc_dev and
>> when this is implemented calls this in place of start_drp_toggling for SRP devices.
>>
>> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
>> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
>>   include/linux/usb/tcpm.h      | 6 ++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index a2233d72ae7c..1af54af90b50 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port
>> *port,
>>   			return true;
>>   	}
>>
>> +	if (port->tcpc->start_srp_connection_detect &&
>> +	    port->port_type != TYPEC_PORT_DRP) {
>> +		tcpm_log_force(port, "Start SRP connection detection");
>> +		ret = port->tcpc->start_srp_connection_detect(port->tcpc, cc);
>> +		if (!ret)
>> +			return true;
>> +	}
>> +
> 
> Is it a little misleading when reading the state machine code that we're calling
> tcpm_start_drp_toggling() to actually start SRP detection? Maybe we could rename
> this function and the associated state to cover both SRP and DRP, or
> alternatively add a new state for SRP_DETECTION, just to keep logging and code
> readability clear and then move the above code to a different function just for
> SRP?

I'm not in fan of adding a separate state for this. Even though connection
detection is not really toggling, I've considered changing
tcpm_start_drp_toggling to tcpm_start_toggling and rename the state to match.
I think that if we want to drop drp/DRP from the names, that using
tcpm_start_toggling / TOGGLING is the best solution.

Also note that on the fusb302, which is the tcpc which needs SRP connection
detection, this is done using the toggling engine. So just changing the
names from drp-toggling to toggling seems best.

Regards,

Hans



> 
> Functionally though, the change makes sense to me.
> 
>>   	return false;
>>   }
>>
>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h index
>> 0c532ca3f079..bf2bbbf2e2b2 100644
>> --- a/include/linux/usb/tcpm.h
>> +++ b/include/linux/usb/tcpm.h
>> @@ -125,6 +125,10 @@ struct tcpc_config {
>>    *		Optional; if supported by hardware, called to start DRP
>>    *		toggling. DRP toggling is stopped automatically if
>>    *		a connection is established.
>> + * @start_srp_connection_detect:
>> + *		Optional; if supported by hardware, called to start connection
>> + *		detection for single role ports. Connection detection is stopped
>> + *		automatically if a connection is established.
>>    * @try_role:	Optional; called to set a preferred role
>>    * @pd_transmit:Called to transmit PD message
>>    * @mux:	Pointer to multiplexer data
>> @@ -149,6 +153,8 @@ struct tcpc_dev {
>>   			 enum typec_role role, enum typec_data_role data);
>>   	int (*start_drp_toggling)(struct tcpc_dev *dev,
>>   				  enum typec_cc_status cc);
>> +	int (*start_srp_connection_detect)(struct tcpc_dev *dev,
>> +					   enum typec_cc_status cc);
>>   	int (*try_role)(struct tcpc_dev *dev, int role);
>>   	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type
>> type,
>>   			   const struct pd_message *msg);
>> --
>> 2.21.0
