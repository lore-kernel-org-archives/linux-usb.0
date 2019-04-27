Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D298C43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 05:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 107132087F
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 05:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="aqhQg/RF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfD0FBW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 01:01:22 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37051 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfD0FBW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Apr 2019 01:01:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id h126so3998506lfh.4
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 22:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AgjFQPs5u9IsR2iBdxUrrYVCcaQgzHfcLFwaMw57Ggk=;
        b=aqhQg/RFxzurhFWl+BnUZG64haHbbAvTdtg641yO8pSZAOLjdb8LZr/xsB5Rr/sXPy
         WVvmKLXftpvjSJFtImqeLE1Umf6/QgWV5oFlqeukUslwEmTyxFic28Gl7pujR3/1VaJ7
         yYvzqACdj6QZnRjVlCgCLSx03r9hWrd/iWacGFE+RgP9BluMXR+54H3KRvRjTR88kYR0
         KKLqrV29aoDv4+6/P1vy0pbw8igmyVKyx2auwlxnXIULNvR7HrrSj5n/jGgsfBGwvbsn
         W+CbMftQ+16NFqe294X9Hs75B7D8ctvBlfNeUKPCH7y1HFuUvckS3j1mLei4C9Q/lvkb
         K9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AgjFQPs5u9IsR2iBdxUrrYVCcaQgzHfcLFwaMw57Ggk=;
        b=lGQ1Shx7eM90P1XsVFM0gfH8JUkuOiSA7hV5F+MhPzZlayvQhzRDdjX6XaCOh35VpS
         CvOCLCCuqS9AtgfnkXoa3WvfZGid+9KrqBlrFgobatbOjJ+PQCO46LLiIx9qXlQVqfUn
         0g78KVr/f3jqpl+PvqmU6lRNZPNyWoiqWvaprE36eOBNydTNI2lkE1EyMjUtuQ04OUbS
         lG4MfDjLoywZutFmt4hEC+4SlDxtA+F0+GLCnXpG0TKhOd+BPirC2N+6qK2TC7uJqRAJ
         h55YfJMb105Ds4A646mQaKimmZg7FpurJwV0ZczizdnXIKJUoDFkXsDB0LACLaYbw0RJ
         4fkg==
X-Gm-Message-State: APjAAAWP5SigbH1N8t6PI374wlHMoQhr07dnLdgFoO3ge28KA9VEoUDb
        XXqXPcJdiATyLZueJrffflcybg==
X-Google-Smtp-Source: APXvYqz4xcQjYJmnlp9aZ25tICFVQmRafYeLGm13afQnwS9fYppsYQa5gD4CchWD7Zggs/wXv4Tpuw==
X-Received: by 2002:a19:6619:: with SMTP id a25mr393108lfc.21.1556341279524;
        Fri, 26 Apr 2019 22:01:19 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
        by smtp.gmail.com with ESMTPSA id o3sm6061022lfn.41.2019.04.26.22.01.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 22:01:18 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: gadget: atmel: support USB suspend
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
References: <20190220122001.5713-1-jonas@norrbonn.se>
 <20190220122001.5713-3-jonas@norrbonn.se>
From:   Jonas Bonn <jonas@norrbonn.se>
Message-ID: <eb302fcf-83b1-bed9-f2d3-201dc767a30b@norrbonn.se>
Date:   Sat, 27 Apr 2019 07:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190220122001.5713-3-jonas@norrbonn.se>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190427050117.yfLtRVw_JpVcBDSv-xyL0vyFBZrF6HSMem5uv317QNw@z>

Ping.  Any feedback on this at all?  It's been over two months without a 
single comment.

Thanks,
Jonas

On 20/02/2019 13:20, Jonas Bonn wrote:
> This patch adds support for USB suspend to the Atmel UDC.
> 
> When suspended, the UDC clock can be stopped, resulting in some power
> savings.  The "wake up" interrupt will fire irregardless of whether the
> clock is running or not, allowing the UDC clock to be restarted when the
> USB master wants to wake the device again.
> 
> The IRQ state of this device is somewhat fiddly.  The "wake up" IRQ
> seems to actually be a "bus activity" indicator; the IRQ is almost
> continuously asserted so enabling this IRQ should only be done after a
> suspend when the wake IRQ becomes relevant.  Similarly, the "suspend"
> IRQ detects "bus inactivity" and may therefore fire together with a
> "wake" if the two types of activity coincide during the period between
> two IRQ handler invocations; therefore, it's important to ignore the
> "suspend" IRQ while waiting for a wake-up.
> 
> This has been tested on a SAMA5D2 board.
> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> CC: Cristian Birsan <cristian.birsan@microchip.com>
> CC: Felipe Balbi <balbi@kernel.org>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Ludovic Desroches <ludovic.desroches@microchip.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-usb@vger.kernel.org
> ---
>   drivers/usb/gadget/udc/atmel_usba_udc.c | 55 ++++++++++++++++++++++---
>   drivers/usb/gadget/udc/atmel_usba_udc.h |  1 +
>   2 files changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> index 9d18fdddd9b2..740cb9308a86 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -1703,6 +1703,9 @@ static void usba_dma_irq(struct usba_udc *udc, struct usba_ep *ep)
>   	}
>   }
>   
> +static int start_clock(struct usba_udc *udc);
> +static void stop_clock(struct usba_udc *udc);
> +
>   static irqreturn_t usba_udc_irq(int irq, void *devid)
>   {
>   	struct usba_udc *udc = devid;
> @@ -1720,10 +1723,13 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   	DBG(DBG_INT, "irq, status=%#08x\n", status);
>   
>   	if (status & USBA_DET_SUSPEND) {
> -		toggle_bias(udc, 0);
> -		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND);
> +		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND|USBA_WAKE_UP);
>   		usba_int_enb_set(udc, USBA_WAKE_UP);
> +		usba_int_enb_clear(udc, USBA_DET_SUSPEND);
> +		udc->suspended = true;
> +		toggle_bias(udc, 0);
>   		udc->bias_pulse_needed = true;
> +		stop_clock(udc);
>   		DBG(DBG_BUS, "Suspend detected\n");
>   		if (udc->gadget.speed != USB_SPEED_UNKNOWN
>   				&& udc->driver && udc->driver->suspend) {
> @@ -1734,14 +1740,17 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   	}
>   
>   	if (status & USBA_WAKE_UP) {
> +		start_clock(udc);
>   		toggle_bias(udc, 1);
>   		usba_writel(udc, INT_CLR, USBA_WAKE_UP);
> -		usba_int_enb_clear(udc, USBA_WAKE_UP);
>   		DBG(DBG_BUS, "Wake Up CPU detected\n");
>   	}
>   
>   	if (status & USBA_END_OF_RESUME) {
> +		udc->suspended = false;
>   		usba_writel(udc, INT_CLR, USBA_END_OF_RESUME);
> +		usba_int_enb_clear(udc, USBA_WAKE_UP);
> +		usba_int_enb_set(udc, USBA_DET_SUSPEND);
>   		generate_bias_pulse(udc);
>   		DBG(DBG_BUS, "Resume detected\n");
>   		if (udc->gadget.speed != USB_SPEED_UNKNOWN
> @@ -1756,6 +1765,8 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   	if (dma_status) {
>   		int i;
>   
> +		usba_int_enb_set(udc, USBA_DET_SUSPEND);
> +
>   		for (i = 1; i <= USBA_NR_DMAS; i++)
>   			if (dma_status & (1 << i))
>   				usba_dma_irq(udc, &udc->usba_ep[i]);
> @@ -1765,6 +1776,8 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   	if (ep_status) {
>   		int i;
>   
> +		usba_int_enb_set(udc, USBA_DET_SUSPEND);
> +
>   		for (i = 0; i < udc->num_ep; i++)
>   			if (ep_status & (1 << i)) {
>   				if (ep_is_control(&udc->usba_ep[i]))
> @@ -1778,7 +1791,9 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   		struct usba_ep *ep0, *ep;
>   		int i, n;
>   
> -		usba_writel(udc, INT_CLR, USBA_END_OF_RESET);
> +		usba_writel(udc, INT_CLR,
> +			USBA_END_OF_RESET|USBA_END_OF_RESUME
> +			|USBA_DET_SUSPEND|USBA_WAKE_UP);
>   		generate_bias_pulse(udc);
>   		reset_all_endpoints(udc);
>   
> @@ -1805,6 +1820,11 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>   				| USBA_BF(BK_NUMBER, USBA_BK_NUMBER_ONE)));
>   		usba_ep_writel(ep0, CTL_ENB,
>   				USBA_EPT_ENABLE | USBA_RX_SETUP);
> +
> +		/* If we get reset while suspended... */
> +		udc->suspended = false;
> +		usba_int_enb_clear(udc, USBA_WAKE_UP);
> +
>   		usba_int_enb_set(udc, USBA_BF(EPT_INT, 1) |
>   				      USBA_DET_SUSPEND | USBA_END_OF_RESUME);
>   
> @@ -1872,9 +1892,19 @@ static int usba_start(struct usba_udc *udc)
>   	if (ret)
>   		return ret;
>   
> +	if (udc->suspended)
> +		return 0;
> +
>   	spin_lock_irqsave(&udc->lock, flags);
>   	toggle_bias(udc, 1);
>   	usba_writel(udc, CTRL, USBA_ENABLE_MASK);
> +	/* Clear all requested and pending interrupts... */
> +	usba_writel(udc, INT_ENB, 0);
> +	udc->int_enb_cache = 0;
> +	usba_writel(udc, INT_CLR,
> +		USBA_END_OF_RESET|USBA_END_OF_RESUME
> +		|USBA_DET_SUSPEND|USBA_WAKE_UP);
> +	/* ...and enable just 'reset' IRQ to get us started */
>   	usba_int_enb_set(udc, USBA_END_OF_RESET);
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   
> @@ -1885,6 +1915,9 @@ static void usba_stop(struct usba_udc *udc)
>   {
>   	unsigned long flags;
>   
> +	if (udc->suspended)
> +		return;
> +
>   	spin_lock_irqsave(&udc->lock, flags);
>   	udc->gadget.speed = USB_SPEED_UNKNOWN;
>   	reset_all_endpoints(udc);
> @@ -1912,6 +1945,7 @@ static irqreturn_t usba_vbus_irq_thread(int irq, void *devid)
>   		if (vbus) {
>   			usba_start(udc);
>   		} else {
> +			udc->suspended = false;
>   			usba_stop(udc);
>   
>   			if (udc->driver->disconnect)
> @@ -1975,6 +2009,7 @@ static int atmel_usba_stop(struct usb_gadget *gadget)
>   	if (fifo_mode == 0)
>   		udc->configured_ep = 1;
>   
> +	udc->suspended = false;
>   	usba_stop(udc);
>   
>   	udc->driver = NULL;
> @@ -2288,6 +2323,7 @@ static int usba_udc_suspend(struct device *dev)
>   	mutex_lock(&udc->vbus_mutex);
>   
>   	if (!device_may_wakeup(dev)) {
> +		udc->suspended = false;
>   		usba_stop(udc);
>   		goto out;
>   	}
> @@ -2297,10 +2333,13 @@ static int usba_udc_suspend(struct device *dev)
>   	 * to request vbus irq, assuming always on.
>   	 */
>   	if (udc->vbus_pin) {
> +		/* FIXME: right to stop here...??? */
>   		usba_stop(udc);
>   		enable_irq_wake(gpiod_to_irq(udc->vbus_pin));
>   	}
>   
> +	enable_irq_wake(udc->irq);
> +
>   out:
>   	mutex_unlock(&udc->vbus_mutex);
>   	return 0;
> @@ -2314,8 +2353,12 @@ static int usba_udc_resume(struct device *dev)
>   	if (!udc->driver)
>   		return 0;
>   
> -	if (device_may_wakeup(dev) && udc->vbus_pin)
> -		disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
> +	if (device_may_wakeup(dev)) {
> +		if (udc->vbus_pin)
> +			disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
> +
> +		disable_irq_wake(udc->irq);
> +	}
>   
>   	/* If Vbus is present, enable the controller and wait for reset */
>   	mutex_lock(&udc->vbus_mutex);
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.h b/drivers/usb/gadget/udc/atmel_usba_udc.h
> index 58c96730e32e..24e6fbd3bb99 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.h
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.h
> @@ -331,6 +331,7 @@ struct usba_udc {
>   	struct usba_ep *usba_ep;
>   	bool bias_pulse_needed;
>   	bool clocked;
> +	bool suspended;
>   
>   	u16 devstatus;
>   
> 
