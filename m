Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE8DC10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83A3E21841
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfDKHzo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:55:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47035 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbfDKHzo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 03:55:44 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hEUYg-0006Lw-5u
        for linux-usb@vger.kernel.org; Thu, 11 Apr 2019 07:55:42 +0000
Received: by mail-pl1-f197.google.com with SMTP id v5so3596556plo.4
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 00:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=O8I6+QP8dAnvcFSf5snO01pHB909XvBWfAoeHtdYzI8=;
        b=A1fRoyRHKcJwczkjlmmLdwQX9ndCF5LFnH0mSZ4pDC/QvPilMvAyFEofu1/77SAX1u
         LON7cXeeldf15ovBYMiVxExadDvrbJ/8l1W3ti+ivWmCT1JZAZsnOdA/s/aiyZtouqK8
         Vl4uw+yDUFtSmXBUnnrmeAKEUlgfh2KW+AUqtZlHdVMOD8S8SEBh19dYeo9DkpZK/MhD
         0TUCZq64X5tMUcpYlXjlrX2esyULw+9guq13Whrp0f8gctF8WlifW/CKwMuvdPfq1wG0
         YIciW17DW+ujbNGr9+ADBu5Jq08ILdCXdoMPV1dDVbNTpU0S82uDhp2q5grvBfDJC3/7
         bBIg==
X-Gm-Message-State: APjAAAW/jZdvyVzaHx2i2uGpXkGuWCRO52ycNYmdlwLtETAtKIXI9D5z
        9W1iX2sekeTAiaIw/q+MGZsJVeoh6DyEnj+uEkOqfgWWST1puFLkanCjIEwdvomAJRf34M+AqRb
        hTTNle/HgarI0cCmW9MKUOnIS99htGBx5Ebst6A==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr45228663pgb.117.1554969340866;
        Thu, 11 Apr 2019 00:55:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyf9uzTE307KSiC17kXBaM23T2n+LvwNyaSWq56IFkwGEPI52Bl0l3Pm5K8lQQ663fOW+HivA==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr45228644pgb.117.1554969340636;
        Thu, 11 Apr 2019 00:55:40 -0700 (PDT)
Received: from 2001-b011-380f-14b9-9cff-45f9-ad8b-c268.dynamic-ip6.hinet.net (2001-b011-380f-14b9-9cff-45f9-ad8b-c268.dynamic-ip6.hinet.net. [2001:b011:380f:14b9:9cff:45f9:ad8b:c268])
        by smtp.gmail.com with ESMTPSA id l2sm42048820pgl.2.2019.04.11.00.55.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 00:55:40 -0700 (PDT)
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH v2] USB: Disable USB2 LPM at shutdown
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <9EC6DA7E-2503-40F8-AB5A-25A2424B6346@canonical.com>
Date:   Thu, 11 Apr 2019 15:55:38 +0800
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8bit
Message-Id: <80534332-7E39-42B9-8B64-580B483B83A5@canonical.com>
References: <20190124061643.11663-1-kai.heng.feng@canonical.com>
 <20190130082133.GA32660@kroah.com>
 <D84EEC8F-8B65-4B0C-9EA7-E01A0BB47398@canonical.com>
 <9EC6DA7E-2503-40F8-AB5A-25A2424B6346@canonical.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190411075538.aCvQrXv-P_VtayCNzJdHu03RsYbi_Pg2KWid-xCyZlw@z>

at 18:22, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:

> at 00:01, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>
>>> On Jan 30, 2019, at 16:21, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Jan 24, 2019 at 02:16:43PM +0800, Kai-Heng Feng wrote:
>>>> The QCA Rome USB Bluetooth controller has several issues once LPM gets
>>>> enabled:
>>>> - Fails to get enumerated in coldboot. [1]
>>>> - Drains more power (~ 0.2W) when the system is in S5. [2]
>>>> - Disappears after a warmboot. [2]
>>>>
>>>> The issue happens because the device lingers at LPM L1 in S5, so device
>>>> can't get enumerated even after a reboot.
>>>>
>>>> Disable LPM at shutdown to solve the issue.
>>>>
>>>> [1] https://bugs.launchpad.net/bugs/1757218
>>>> [2] https://patchwork.kernel.org/patch/10607097/
>>>>
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>> ---
>>>> v2: Use new LPM helpers.
>>>>
>>>> drivers/usb/core/port.c | 9 +++++++++
>>>> 1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
>>>> index 1a06a4b5fbb1..bbbb35fa639f 100644
>>>> --- a/drivers/usb/core/port.c
>>>> +++ b/drivers/usb/core/port.c
>>>> @@ -285,6 +285,14 @@ static int usb_port_runtime_suspend(struct device  
>>>> *dev)
>>>> }
>>>> #endif
>>>>
>>>> +static void usb_port_shutdown(struct device *dev)
>>>> +{
>>>> +	struct usb_port *port_dev = to_usb_port(dev);
>>>> +
>>>> +	if (port_dev->child)
>>>> +		usb_disable_usb2_hardware_lpm(port_dev->child);
>>>> +}
>>>> +
>>>> static const struct dev_pm_ops usb_port_pm_ops = {
>>>> #ifdef CONFIG_PM
>>>> 	.runtime_suspend =	usb_port_runtime_suspend,
>>>> @@ -301,6 +309,7 @@ struct device_type usb_port_device_type = {
>>>> static struct device_driver usb_port_driver = {
>>>> 	.name = "usb",
>>>> 	.owner = THIS_MODULE,
>>>> +	.shutdown = usb_port_shutdown,
>>>> };
>>>
>>> So you now do this for all ports in the system, no matter what is
>>> plugged in or not.  Are you _SURE_ you want to do that?  It seems like a
>>> big hammer to solve just one single device's problems.
>>
>> Yes I think this should be universally applied.
>>
>> I don’t think the bug only happens to one device. Users won’t find this
>> unless they connect their laptop to a power meter.
>>
>> Platform may not completely cut off USB bus power during shutdown,
>> so the device transits to L1 after system shutdown. Now xHC is disabled
>> so nothing can bring it back to L0 or L2.
>
> It would be great if someone can come up with better ideas.
>
> We can also use other approaches, but currently this is the only way I  
> can think of.

Alan and Mathias,

It would be great if you can review this patch, or give me some suggestion.

Kai-Heng

>
> Kai-Heng
>
>> Kai-Heng
>>
>>> thanks,
>>>
>>> greg k-h


