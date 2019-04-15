Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755A6C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E49520848
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfDORyC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:54:02 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41949 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfDORyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 13:54:02 -0400
Received: by mail-ed1-f68.google.com with SMTP id g6so11514485edc.8
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 10:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hB3OGYgslkK5YBIUSplM+iJDMG3Aw+du3vZJMGX8b0k=;
        b=fQR0EapYmHhls7yjcJjJZZAGJsX5L1+XB6whuT7aFf9qOyVX5DGngaixNGuHrBSiTq
         SPbn9gdPIkqRUyecctLCNnHyrwgH6gR43qoMbpikRhv/WWdrMjLP7mJ8X9xOqFCuEkoF
         fIneFG/vAz3e8OUQpHJUFK6fs1iSwVF/vRjv0volKfppLTIOrSWCaWk5gPEX/rlvBm1q
         3kxd7Y/ZqJIxuSjwWocz80/hI/y2yRdSUpkK53vO4Q7oZoUfyt5FSZRj1CKK4qDKUsme
         Scor8UJv+imSXNfboEsh+ZHlE1rbz53Uyb5Iyi/Cr9/SfQnXxU30B4EO1L1GJv2pl6qd
         K8YA==
X-Gm-Message-State: APjAAAX5jQ/S2Vnq4qOhdO88wvJszGVNvB9Cp3cjSYvCrGDLMSsrTdRn
        dTBTbNkVx3mKmX9fWOHaZTAq7vUXcPw=
X-Google-Smtp-Source: APXvYqxBCLhWakfNvA/qkLeg7Vlv4sBUB0kqifSccpCvUfCwORRGUXJQItOLwjsNo+2d11JGEVFmYA==
X-Received: by 2002:a17:906:1584:: with SMTP id k4mr40867298ejd.226.1555350840741;
        Mon, 15 Apr 2019 10:54:00 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id y23sm120624edo.19.2019.04.15.10.53.59
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 10:53:59 -0700 (PDT)
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <20190415155113.GB7292@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c66d328e-0cea-9962-1fb6-009f78bf946e@redhat.com>
Date:   Mon, 15 Apr 2019 19:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415155113.GB7292@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415175358.JvzSGvdnBs5vKc4i3OyCT9zZssDZzVSOcg3gmwoSlNU@z>

Hi Guenter,

On 15-04-19 17:51, Guenter Roeck wrote:
> On Sat, Apr 13, 2019 at 10:39:53PM +0200, Hans de Goede wrote:
>> Some tcpc device-drivers need to explicitly be told to watch for connection
>> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
>> being plugged into the Type-C port will not be noticed.
>>
>> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
>> watch for connection events. But for single-role ports we've so far been
>> falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
>> fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
>>
>> This commit adds a new start_srp_connection_detect callback to tcpc_dev
>> and when this is implemented calls this in place of start_drp_toggling
>> for SRP devices.
>>
> 
> Do we indeed need an additional callback for this purpose, or would a single
> "start_connection_detect" call to replace start_drp_toggling be sufficient ?
> If necessary, we could add the port type as argument (if the low level driver
> doesn't already know that).

A single "start_connection_detect" call to replace start_drp_toggling will be
sufficient AFAICT.

If you prefer that option, I can rework the patch-set accordingly.

Regards,

Hans



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
>> @@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port *port,
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
>>   	return false;
>>   }
>>   
>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
>> index 0c532ca3f079..bf2bbbf2e2b2 100644
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
>>   	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
>>   			   const struct pd_message *msg);
>> -- 
>> 2.21.0
>>
