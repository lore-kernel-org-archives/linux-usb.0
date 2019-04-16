Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B7FC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D54C220880
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfDPUGV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 16:06:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34845 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfDPUGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 16:06:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id w1so28815421wrp.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 13:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uzzu5rWGK0yWw0GcRfiTbq/n4MLKBoKt8Qqlfj3htu8=;
        b=A9lrVosEcfe02WOi8dP+Mq9q7d6vOddLChPkw94/3Cva8AY2Iii2ozRT94DOnPCT3d
         NodYGJrC48Kv+c7tVZASvuirvgNi7vxV1H0GvXHj5SZFCXze+totjeJdZ6xZa8NzMLeJ
         e6StNRtAQZ4UjERtpoyEqQrJYnspnWuRy08T1y9cfsvbP8XwHeGeoycjBP/GCPOeqMG4
         Akof860INAKwrdCY5lR8bkXRcWnQCo5b4fAFFDiCq0vHEwrL7TGHJkAYZPmKNMj3hJr7
         CH8KwzBpmZCetJ6FDYNoPD8KB1zydxtl5h8CbDs5MNivh+DdMneJLsR3qffKIOUFmTNA
         Codg==
X-Gm-Message-State: APjAAAVveLRemKoeUSGdISAPCrI9vAtxddqiB7mX6X7ZR3rjxR1Z9AWo
        2gHhsdrgaUV2cqK7zHh8ZTmjgxLrQe0=
X-Google-Smtp-Source: APXvYqyQVJggr0k3VlvvPw3lflPJIacqufmJ4Q17/5vTufcotcbiEkepXv4Md9N4TzyJ6DPg8WqcNA==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr52508418wrv.296.1555445179463;
        Tue, 16 Apr 2019 13:06:19 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z17sm322984wmc.7.2019.04.16.13.06.18
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 13:06:18 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: typec: fusb302: Implement
 start_srp_connection_detect
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <20190413203955.10788-2-hdegoede@redhat.com>
 <61b22729-1729-5f79-ce4e-f9e5cf679ada@cogentembedded.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f8d791ce-160c-cf04-7f01-67c115cd3dbb@redhat.com>
Date:   Tue, 16 Apr 2019 22:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <61b22729-1729-5f79-ce4e-f9e5cf679ada@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416200617.SLzUXYRElUXVeI8KwUXVWqm6d4dT3w5Fxrr0b9bLIX8@z>

Hi,

Thank you for the review.

On 14-04-19 09:40, Sergei Shtylyov wrote:
> Hello!
> 
> On 13.04.2019 23:39, Hans de Goede wrote:
> 
>> When in single role port mode, we most start single-role toggling to
> 
>     Must, perhaps?

Right, fixed for the upcoming v2 of the patch-set.

>> get an interrupt when a device / cable gets plugged into the port.
>>
>> This commit implements the tcpc_dev start_srp_connection_detect callback
>> for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/tcpm/fusb302.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
>> index 6ea6199caafa..30413a45104f 100644
>> --- a/drivers/usb/typec/tcpm/fusb302.c
>> +++ b/drivers/usb/typec/tcpm/fusb302.c
>> @@ -876,6 +876,34 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
>>       return ret;
>>   }
>> +static int tcpm_start_srp_connection_detect(struct tcpc_dev *dev,
>> +                        enum typec_cc_status cc)
>> +{
>> +    struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
>> +                         tcpc_dev);
>> +    int ret = 0;
> 
>     This initializer is useless.

Ack, this part is gone for v2 of the patch though.

Regards,

Hans



> 
>> +
>> +    mutex_lock(&chip->lock);
>> +    ret = fusb302_set_src_current(chip, cc_src_current[cc]);
>> +    if (ret < 0) {
>> +        fusb302_log(chip, "unable to set src current %s, ret=%d",
>> +                typec_cc_status_name[cc], ret);
>> +        goto done;
>> +    }
>> +    ret = fusb302_set_toggling(chip, (cc == TYPEC_CC_RD) ?
>> +                     TOGGLING_MODE_SNK : TOGGLING_MODE_SRC);
>> +    if (ret < 0) {
>> +        fusb302_log(chip,
>> +                "unable to start srp toggling, ret=%d", ret);
>> +        goto done;
>> +    }
>> +    fusb302_log(chip, "start srp toggling");
>> +done:
>> +    mutex_unlock(&chip->lock);
>> +
>> +    return ret;
>> +}
>> +
>>   static int tcpm_start_drp_toggling(struct tcpc_dev *dev,
>>                      enum typec_cc_status cc)
>>   {
> [...]
> 
> MBR, Sergei
