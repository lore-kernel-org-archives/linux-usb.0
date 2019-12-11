Return-Path: <SRS0=2rsX=2B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF113C43603
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 16:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5DCA2073D
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576080015;
	bh=KV0hz98hOS1DgDiALVP4DYH+Q4K8qaWdN+lEuz9dt3o=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=WvvlFXWTU6l0EwqvfSoG5uVpQp8tc+qP6pN8j6gpu67kEV5YkYlJdRQ2DFxmqbFXo
	 lBWkF74fPNy9M3WPzJEJ5fZuAWPHpdvJ7Yz71XtciskAuWoj4EFZpECTHSfyUvQYLu
	 VZisTPtQvgpplVbrVt7gZfvqnh32YBnTbQfMOaDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbfLKQAP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Dec 2019 11:00:15 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:34881 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730667AbfLKQAN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 11:00:13 -0500
Received: by mail-il1-f174.google.com with SMTP id g12so19902588ild.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DxKuwDZa5sSQyUUQqOx6elF/qAI2E8BQOlxo+bFWAjA=;
        b=dIr2Gluc0eqJvZDUHteyeX9yIXgIKndTKpUwSJNf8sLU1vBgJZc8+vOFP8OSWDXg3m
         n4UC1Oh450TPJmVFjz+GwPwnfUvPiiZexhpc83mkFAKyLhF4NNT74aw/wse1NMlAJSkA
         EtZi61jQIkPwCDvTsAsU0hai4MSfF3Xf5yLaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DxKuwDZa5sSQyUUQqOx6elF/qAI2E8BQOlxo+bFWAjA=;
        b=nCHV/IsZQcmedNtqEz9xh20MWvRicwB8RG0Kb5nf9jZ0yHs8pSgH52J27MHs0NXX5B
         DFf9q6ir9JfIh2e3acNn4TG1sL3CUjug77kpOsO2KyxCjDLOD+RAR5BUOevN4WUfBfDP
         stFWglgcQGeyGYJauOj2ADYW6tjP76xRGB3Lfw1lAUn5bA2wTR3dcg5MFyMwqWsTPfVl
         btP797dIwHgZH2hQRW5alUqtXaLIoVSQIDL1F1uEIVu+8H7gFNlT6d05w5hER+rEpWkz
         T/h0c2IytqP2Sk3hoQXLSRvI94yfMkpiY5OQ9445TQkRvgjMtNJxS9HxcpfyrWdiYXMK
         6YDg==
X-Gm-Message-State: APjAAAW7cYE1sGl3xkBO5C/GDu83MhNl5NnoEgKsyEQJymwXe4vibHbD
        TvYGSZ8nNXtOhfR20Aso1Y19jg==
X-Google-Smtp-Source: APXvYqyZtj2n5FiC0vFRa2BOk6fWrNIL03li1xsPvcF9qXQHlk+JMNcbUSRDlrdXhJcGz35F0P6mnA==
X-Received: by 2002:a92:3dd0:: with SMTP id k77mr3690272ilf.3.1576080012845;
        Wed, 11 Dec 2019 08:00:12 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u10sm818138ilb.8.2019.12.11.08.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 08:00:12 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
To:     Zhai Zhaoxuan <kxuanobj@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
Date:   Wed, 11 Dec 2019 09:00:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/19 4:43 AM, Zhai Zhaoxuan wrote:
> Hi,
> 
> I am trying to implement a virtual USB device using usbip. But I get a 
> trouble.
> 

Can you give me more details on why you are planning to add virtual USB
to usbip? How does it work with conjunction with the usbip server side?

> When a running port on vhci_hcd is resetted (by setting 
> USB_PORT_FEAT_RESET), it will never be enabled again.
> 
> The kernel version is 5.5.0-rc1-00012-g6794862a16ef.
> In the source file drivers/usb/usbip/vhci_hcd.c:
> 
>   565         case USB_PORT_FEAT_RESET:
> ...
>   572             /* if it's already enabled, disable */
>   573             if (hcd->speed == HCD_USB3) {
>   574                 vhci_hcd->port_status[rhport] = 0;
>   575                 vhci_hcd->port_status[rhport] =
>   576                     (USB_SS_PORT_STAT_POWER |
>   577                      USB_PORT_STAT_CONNECTION |
>   578                      USB_PORT_STAT_RESET);
>   579             } else if (vhci_hcd->port_status[rhport] & 
> USB_PORT_STAT_ENABLE) {
>   580                 vhci_hcd->port_status[rhport] &= 
> ~(USB_PORT_STAT_ENABLE
>   581                     | USB_PORT_STAT_LOW_SPEED
>   582                     | USB_PORT_STAT_HIGH_SPEED);
>   583             }
>   584
> 
> The USB_PORT_STAT_ENABLE is cleard. And it should be set later.
> But, the GetPortStatus only set the USB_PORT_STAT_ENABLE for 
> not-assigned ports.
> 
>   430     case GetPortStatus:
> ...
>   456             if (vhci_hcd->vdev[rhport].ud.status ==
>   457                 VDEV_ST_NOTASSIGNED) {
>   458                 usbip_dbg_vhci_rh(
>   459                     " enable rhport %d (status %u)\n",
>   460                     rhport,
>   461                     vhci_hcd->vdev[rhport].ud.status);
>   462                 vhci_hcd->port_status[rhport] |=
>   463                     USB_PORT_STAT_ENABLE;
>   464             }
> 
> The used port (status == VDEV_ST_USED) will be disabled after 
> USB_PORT_FEAT_RESET, and unable to be enabled again.
> 
> Should VDEV_ST_USED be added to line 457?
> And if it shouldn't, how can I enable a port after USB_PORT_FEAT_RESET?
> 
>

I would like to see server and client side patches and a use-case for
adding virtual device.

thanks,
-- Shuah


