Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053570;
	b=SsPALhCkFBCaWGbVuXLaE3vP722M87TnX3j0LanAwKfE6zggIkXar+gKJmnf2pcWCjU1
	 FU67Kn6bRoSbU+dOC8826wH+c4s6M7XXzG3X/in9Io1oETTAU7inQyzITPonAmQ0IFWlb
	 9Mkbg/mbk37Vx9Twspk1HC3Jzq92L5Y2ShICjo6DX2KVoGin1QP4Yc8Moy3KQ5g1AETBB
	 T/ngUC9P0xeOxcymfENyrZRN96M5t3xtw8mrbDzA2zGaqP1VGTjR8ip40s9G8yLmsQGBF
	 QzqAZmLX5uIcsVoA1x3OXYeN0nSYdEEht71soecJjMMwBCfnekmzd66SyQUCelggJ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
	b=TBovG5bTrou0vjlgtVhXUwn65HcWc6ACwloOU4M8t51Fb/NVqTGTpPoXoNDwAWhYXr/W
	 C/cgxAKLglyw3ODTG979hYx65rK7p3J8wHVfnEXCYuRv0LMDj90khtCGbmS/60wPke9UX
	 vDm7vjFmV2S+EMW1Qz7WfDE0YgFK2TK3sTQQUmeQ1CI+T7ZYOYayLza2jcjgo/V+mDNsi
	 x1TswvoW2kGgmvOISR59R9IuzGsTx+b8Q/j/BJ4bNlKN+sbf9tx39DK+6LhY5RhiC7p1r
	 nt4d0mHEmg7A22k/rFXOlVWsxdDEEVuToIadoJy8QuGvqrsp5xUG+oGX5xeUYjUNXJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYa6DiT8;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE6606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 12:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AE6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYa6DiT8
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so1951723a12.3
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053568; x=1794658368; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
        b=nYa6DiT8l3ED+EWdfIv/ank5ihgx/bvEu3UOhJ/eaKV3tj/vLKs0gH/oEh5aE6nblh
         BPHBpCr/OlywPm2/cWApMXkx3uA5MIl3m4Tk4UbDpXrcUroYyXhq0uQ3Jh9V0OgiCE0E
         XvFWYVacUf09XyyXlPf76ZZkHrbTKQebuKZjOcYLxwiQ0R+TNmzWLVhupH9aUlOoAQ2X
         OCEM+ULujpwxoqRc7mEut/I6OzQhx9bzlub/tQRjQpHEtKFUF01HD+FHJPcYhPdwNovJ
         +ZbnQokzMHRyqwF4H76CjdRyEaJv7nFjrDZNyrJqC7YBUMxSfTZWGGRW7Fh5jCJTOJRK
         3BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053568; x=1794658368;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
        b=OlYjcrLfRD/C7CdU+nV3voVmbzI2SlHbGJZ2xq3nu/8gOlPo1bEzg8DnsBvLqqHecE
         1tRp/+u9OQOa0t4De4AYtNy9b6HAOEnEEbY+VRTmc1si5Z5V4+a6Lr2pqqNtiFKE/54B
         VvFLellfsR+eELdzr3NvSS/l+DjEjEous/saGhkaVLF2rAEadT/d2gPYHCmqjEcvu+WU
         oCKkcDb42ENKLoiWH1ABqcfcuGPEpTUwTvb4ma6RYC7v2zCUZ7sX1lZrahAOkj89ckKO
         KbcTGRdBDfXSVfzOHOsOuUDbD6p2RZoywqTXdBo+NVcad1pXl03lQE+dd0yTcjoQKE4F
         iVyw==
X-Gm-Message-State: APuU4Z+fUIBBWY75ryNfM+zZOFv0qj/esfesfhtkaFoAQZZdf3SH4nPB
	H31bOA0eEaxgc5v1RtoiQrwSb5K0nq6cbL0Dlrv6PHPsqifsGz8D4n2Y
X-Gm-Gg: AYBFou04O5xRhi65NEK87Wfb35ZsNFj+M9I2aXg37yXhZvECdvBNRpN43WYOgqp9dQd
	ePFzuOl4jETJqkwQPDCc6Yjfrb0pDlif0d75cgbq6aN5Iyi9zTV+oWPckR7wzmkZZZQQZ78Y3M1
	+DCXnA+J25l9/Z97dK1QMbCUj/gEkOjqx3R7OXDxehm+wmlibJBHEut9g/pNSoFZUhAYDGxlu7G
	7+G/MI2oKT+RbHHBVVYmL7mQ+OVCN2MWIMnQADHvl/w+7zd8rUKasu65v7C6zcTYoHQOGb0yRto
	DCfyQPz3c1S+L3vlUPexUlr8SxwybCn2X/ZBV/nfFwFc4UuAjwBQJcFqWRuStMHKOFxYjfFC0zl
	fyzwlw8ogNZ1t5GT/6GZqCxeEtBZdUJ6UwdxIl1/2UYEuWfR34wS70r3Aq0EKBgROm+ySJAvul5
	tS6YFmScB7XQ6E0qtICih51jbZESqM5DYqOljhz9nWbq0w/lq3ENsFOGBfCRIq5MvT1d4YfTcPT
	nyAKkIwabC2dhF/WUZDvd+MVA5skNlp14Q+HwxdvUfh5B8GxDYpX+11aPZVCkrpGIW4PD6WoCFs
	PVWyPWKf8vtbsl3A3nfNhs8DVLL+Ih+0v0rdFpEAq5CD7vbHK34pD2IOYz+ai0na
X-Received: by 2002:a05:6402:4143:b0:6b1:8316:ba32 with SMTP id 4fb4d7f45d1cf-6b5977e97d9mr4204070a12.17.1794053567981;
        Sat, 07 Nov 2026 04:12:47 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664b0239csm1854101a12.26.2026.11.07.04.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 04:12:47 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 13:12:45 +0100
Message-Id: <DMOYWU5HB1UM.BQG0BZT7RFCP@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: musb: gadget: don't flush a waiting RX packet
 when queueing a request
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261107105505.6554-1-lineprinter0@gmail.com>
 <sashiko-outbox-202856@kernel.org>
In-Reply-To: <sashiko-outbox-202856@kernel.org>

On Sat Nov 7, 2026 at 12:30 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] usb: musb: gadget: overlapping musb_g_giveback() calls wedge
>   ep->busy
> - [High] usb: musb: gadget: race and ordering bug in
>   musb_gadget_disable() for rx_kick
> - [Medium] usb: musb: gadget: lost rx_kick across system suspend and
>   resume
> --
>
> commit cef9b9e2278bf856fd53af421c899c0ae67866b7
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
> usb: musb: gadget: don't flush a waiting RX packet when queueing a reques=
t
>
> This commit replaces the RX FIFO flush in musb_ep_restart() with a
> system_bh_wq work item that invokes musb_g_rx(), and defers RX processing
> via ep->rx_kick_deferred while ep->busy is set.
>
>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index 016d3f3fc1e05..c71c60efe5106 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
>> @@ -148,6 +148,21 @@ __acquires(ep->musb->lock)
>>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>>  	spin_lock(&musb->lock);
>>  	ep->busy =3D busy;
>> +
>> +	if (!ep->busy && ep->rx_kick_deferred) {
>> +		ep->rx_kick_deferred =3D false;
>> +		if (!queue_work(system_bh_wq, &ep->rx_kick))
>> +			pm_runtime_put_noidle(musb->controller);
>> +	}
>> +}
>
> [Severity: High]
> Can overlapping musb_g_giveback() calls finish out of LIFO order and leav=
e
> ep->busy permanently stuck at 1?
>
> musb_g_giveback() saves ep->busy in a stack variable, sets ep->busy =3D 1=
,
> and drops musb->lock around usb_gadget_giveback_request().  With RX
> givebacks running in system_bh_wq, a second giveback on the same endpoint
> (for example via musb_gadget_dequeue(), which enters musb_g_giveback()
> when musb_ep->busy is set) can overlap on another CPU:
>
> CPU0                              CPU1
> musb_g_rx_kick()
>   musb_g_rx()
>     musb_g_giveback()
>       busy =3D ep->busy; // 0
>       ep->busy =3D 1;
>       spin_unlock(&musb->lock)
>       usb_gadget_giveback_request()
>                                   musb_gadget_dequeue()
>                                     spin_lock_irqsave(&musb->lock, ...)
>                                     musb_g_giveback()
>                                       busy =3D ep->busy; // 1
>                                       ep->busy =3D 1;
>                                       spin_unlock(&musb->lock)
>                                       usb_gadget_giveback_request()
>       spin_lock(&musb->lock)
>       ep->busy =3D 0;
>       queue_work(..., &ep->rx_kick)
>       spin_unlock(&musb->lock)
>                                       spin_lock(&musb->lock)
>                                       ep->busy =3D 1;  <-- stuck at 1
>
> First, CPU0 clears ep->busy to 0 and schedules ep->rx_kick while CPU1 is
> still in usb_gadget_giveback_request().  Second, when CPU1 finishes, it
> writes its saved busy =3D 1 back to ep->busy.  After that, every subseque=
nt
> musb_g_rx(), musb_g_rx_kick(), and musb_gadget_queue() call sees
> ep->busy =3D=3D 1 and defers work forever, wedging the endpoint and leaki=
ng
> the runtime PM reference taken by musb_g_defer_rx_kick().
>
> Making ep->busy an active giveback counter (incremented before dropping
> musb->lock and decremented after re-acquiring it) would ensure ep->busy
> only reaches 0 when the last giveback completes.

Yes, that is possible, but this is a pre-existing bug. I even have
a separate patch prepared to make `busy` a counter instead of a flag.
This patch does not aggravate this problem.
The same race is possible between a dequeue and a HW IRQ.

>> @@ -1111,6 +1137,12 @@ static int musb_gadget_disable(struct usb_ep *ep)
>> =20
>>  	/* abort all pending DMA and requests */
>>  	nuke(musb_ep, -ESHUTDOWN);
>> +	if (cancel_work(&musb_ep->rx_kick))
>> +		pm_runtime_put_autosuspend(musb->controller);
>> +	if (musb_ep->rx_kick_deferred) {
>> +		musb_ep->rx_kick_deferred =3D false;
>> +		pm_runtime_put_autosuspend(musb->controller);
>> +	}
>> =20
>>  	musb_ep->desc =3D NULL;
>>  	musb_ep->end_point.desc =3D NULL;
>
> [Severity: High]
> Can musb_g_rx_kick() run while nuke() drops musb->lock or after the
> endpoint is re-enabled?
>
> Because musb_ep->desc is cleared after nuke(), musb->lock is dropped
> inside nuke() -> musb_g_giveback() while musb_ep->desc is still non-NULL.
> If an earlier giveback on another CPU finishes during that window, it
> restores ep->busy =3D 0 and queues ep->rx_kick, allowing musb_g_rx_kick()=
 ->
> musb_g_rx() -> rxstate() to run after nuke() has already freed
> musb_ep->dma.

Good catch, and actually I think this can be resolved with making
ep->busy a counter instead.
I will send them together as a series for v3.

> In addition, cancel_work() is non-synchronous:
>
> CPU0                              CPU1
>                                   <softirq>
>                                   musb_g_rx_kick()
>                                     // waiting for musb->lock
> musb_gadget_disable()
>   spin_lock_irqsave(&musb->lock, ...)
>   cancel_work(&musb_ep->rx_kick) // false
>   musb_ep->desc =3D NULL;
>   spin_unlock_irqrestore(&musb->lock, ...)
> musb_gadget_enable()
>   spin_lock_irqsave(&musb->lock, ...)
>   musb_ep->desc =3D desc;
>   musb_ep->busy =3D 0;
>   spin_unlock_irqrestore(&musb->lock, ...)
>                                     spin_lock_irqsave(&musb->lock, ...)
>                                     if (!musb_ep->desc || ...) // false
>                                     musb_g_rx()  <-- stale kick runs
>
> Clearing musb_ep->desc and musb_ep->end_point.desc before calling nuke()
> prevents musb_g_rx_kick() and musb_gadget_queue() from acting on the
> endpoint while nuke() drops musb->lock, and prevented stale kicks will se=
e
> the updated state if musb_gadget_enable() also cancels any pending
> rx_kick.

Is this any different from before the patch, with a HW IRQ?
I think a stale kick handles everything well, if there is no work,
musb_g_rx() just returns.

>> @@ -1810,6 +1881,36 @@ void musb_gadget_cleanup(struct musb *musb)
>> =20
>>  	cancel_delayed_work_sync(&musb->gadget_work);
>>  	usb_del_gadget_udc(&musb->g);
>> +
>> +	musb_gadget_disable_rx_kicks(musb);
>> +}
>> +
>> +static void musb_g_disable_rx_kick(struct musb *musb, struct musb_ep *m=
usb_ep)
>> +{
>> +	if (musb_ep->rx_kick.func && disable_work_sync(&musb_ep->rx_kick))
>> +		pm_runtime_put_noidle(musb->controller);
>> +}
>> +
>> +void musb_gadget_disable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_in);
>> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_out);
>> +	}
>> +}
>> +
>> +void musb_gadget_enable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		if (musb->endpoints[i].ep_in.rx_kick.func)
>> +			enable_work(&musb->endpoints[i].ep_in.rx_kick);
>> +		if (musb->endpoints[i].ep_out.rx_kick.func)
>> +			enable_work(&musb->endpoints[i].ep_out.rx_kick);
>> +	}
>>  }
>
> [Severity: Medium]
> Does musb_gadget_disable_rx_kicks() lose a pending or deferred rx_kick
> across system suspend and resume?
>
> If ep->rx_kick is pending when musb_suspend() calls disable_work_sync(),
> the work item is cancelled and its runtime PM reference is dropped, or if
> musb_g_rx_kick() is currently in musb_g_giveback() with
> ep->rx_kick_deferred set, disable_work_sync() marks ep->rx_kick disabled
> before waiting for completion so queue_work() in musb_g_giveback() fails.
> On resume, musb_gadget_enable_rx_kicks() only calls enable_work(), which
> does not re-queue the cancelled work.  When the USB session is preserved
> across suspend/resume (such as with MUSB_PRESERVE_SESSION or standby),
> MUSB_RXCSR_RXPKTRDY remains set in hardware with no interrupt to
> re-trigger it, stalling RX on the endpoint.

I see, I wish I had more hardware to test on.
This seems to be possible on da8xx.
I will find a way to re-queue the cancelled work items for v3.
