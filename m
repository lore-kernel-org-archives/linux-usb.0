Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075788;
	b=Ai0uuSCn5jRXUnUSapnGDxIty7Kuvh8brI/q2Nqmze3NEV7ttaSnKQYU7OwAQyAyf0+y
	 Foa02k4KxDcWfMJRcDn7/2gdUv7Tc7c8smD6LIT8Sbm+tQ4jLbaNvEHYi1HxGmgKmC5Rc
	 Fh1zn+8BLDwgCFHxXk2rPBfzuMHDysl3pZtbFp1DS7Hk7MqPPx4D6cUKNyDtxpWCMyIT9
	 XyRb91RqsROxo2xwSXkRSDBAremz0+TbkJbfobCukPEmmP9sqDJM+0O6L6BNel8389TqG
	 LiHVN+Le76nHl8QVaIzyFt3siRc0LRer5peR/PQd2WpxDTxlSHWGFgWPo80CivhS1Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
	b=5FJeWoQhCDptpD4S7zoBlcp3eeVrwVMUkKaAdTfBFpwLReBgc+rKgE3oD1eKnY5yd2JL
	 WmKwQNd0HHI9KwFUOAGEA+uKWf9+FNXq+e4jE6HMnQoHSQbcmXxOhma3S+CnhIx6wpMC2
	 Ta5dKE1uwuvhrRalpNy4fp4IeZvdOSG/eo4ACmB9y8hs2ZeuCm+IGTU5gaVMCz2o480K/
	 XwL6Dqc+zoUlPjiZt4sKngzqcTwYXfC9vNGF2nkwVvptiqdP0DuXEI6wy1c+xS37ZIJSC
	 EakooiQzHkHjaHZfhuN+dKmI3V9oTKXizs07i1rwVAYOOTMD01Cnm/CIi9WyeBIhKvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPTGQgjZ;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE4606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 18:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPTGQgjZ
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so31812166b.3
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075787; x=1794680587; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
        b=hPTGQgjZhl9K+MhJ0uEfBk+9HBPEceEYFqfh5V+i8IIulmGbc4+Jrjdi7IL3Nn8FKk
         7vi6+h+fua7tZtm2eg2Pwm9iROLIOP1TAYYbI3QWc/NSXQcpHbyfrTYrUkrUdms5LwLG
         r8zOmsnOWkib/7Mk9E0F1ezWLXT1lxLOMGCn3oW/UAynLxRfK7YUkuO3t2412rM829Ds
         2/MN8uDLJbYucjJsk+axE/eP2LyqQ3U6U+whWkCaaPIzuDF+oeFilNKVeTQQMAE1gd3Y
         dW3jwVeHLgjHGixFLEB2nPDC+Lz4Uo/mjdhs4wPrArTh/3K6g7NsBJjCiwD7D5gp7JLn
         LVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075787; x=1794680587;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
        b=MsddEG3H5RFFfbQz2lmyNEBQn3+FnF7YV9Fsvnro97An+htG8IDRbo+LEgpnwOWvgx
         PU9aWy3Qg1L5DuMn/5u9aDsQDj96VQnPR70rTuvW576RGdFMubfBlGF/Pn0Wx8B9RhlJ
         JexnUJ+lCNRHBsu73u9wNiHocvq98txH4ew07X7ahUqYqE74Ngbuhw0DghKGiFowd/OG
         0jC507wx1MwXnBr8CXjYu8AQeXUk/he9b0L9UkfDkuSlcw972cKqt4VdvldJGxmtWdk9
         Gpt72tkN2j0sKnrY/Q4shbnfSUovhFk5cEtDroJI+9gZkcYiiwYFYCyuDG4UxtCUOpbf
         14YQ==
X-Gm-Message-State: APuU4Z/bxoXXsUyH/dW2LE+hOtniJDoZ1Ei4eqaVfk80HoSvgLdztkfK
	DWRHah4jf5qYuf7TySrWuPCgQqsy2eTU1Fs6+BJEvNMz1JlWFccDYJCNgmklJU8b
X-Gm-Gg: AYBFou35dRBQT7lq7HOAGlIgpf3yK3Rhrnhwal1lQZOS/F5mPuz2jbqhSlx3uG3nHvC
	fmerCTQU97SnZnEmXjfXjMw1CcRgVPxQUG3mosC9n2PNNQfk2D564S1aDVKNX6lvloErVY5OOMF
	oR7W2BBXs06q5/GjJpqHO/8l3FjiP3iJun2Y+F5MfgYxnPWXC5d10KM2w/9aKWqKH0GjBdhMBw1
	5bKzeYGEUtR1DngbbkLixl1jGDwiWW4NS4oJKHWA6Ad/xTHIqxvEsmM5f7+4mMqsefe5GH73mCB
	AHI5oMMqtrPBNUk+GT9uFee4zQiH+tv2MgJE/8Ve34/QqkTtm2c73+x8iGhSYI7t69cEzC4Bnhq
	10J6/pKBTJ0es6bLrr0fLsoEz9Q3GGFIfs96Z69ScsGE8QkuPA6KwrCk/wCTNd7aOIvNQPY9kmk
	T5dwpnHvOcs1p7IWVU03gf9WuDatqNWXhyVK2UnuObTz+aQlHQnjC6mr7jLoZEOcqEplg4aPnPg
	Fk62vJfELyVzRaH5NQqe42Gxe0aJ55UZMDKQskxs+IlP5fzz/Vb2A/qIDL10K20/PkDsn/2Navc
	+2lGZnaeTInr0bK8wAQT5fZOp2miwPigkbKiUGYk4rAIzLhPTl8/rD4i74dR1F5wbtEh8EY9xko
	2TNRvLYOjcw==
X-Received: by 2002:a17:907:980c:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c4d344a8b88mr456842766b.6.1794075786536;
        Sat, 07 Nov 2026 10:23:06 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d53b6csm1515566b.9.2026.11.07.10.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 10:23:06 -0800 (PST)
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
Date: Sat, 07 Nov 2026 19:23:03 +0100
Message-Id: <DMP6SD3R8V63.29JPIY8YRRCIS@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] usb: musb: gadget: don't flush a waiting RX
 packet when queueing a request
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261107173601.63095-1-lineprinter0@gmail.com>
 <20261107173601.63095-3-lineprinter0@gmail.com>
 <sashiko-outbox-203154@kernel.org>
In-Reply-To: <sashiko-outbox-203154@kernel.org>

On Sat Nov 7, 2026 at 7:11 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: musb: gadget: premature and unlocked rx_kick queueing in
>   musb_resume()
> --
>
> commit c9ae36b9b6933c41b159c85ef258637f80341755
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
> usb: musb: gadget: don't flush a waiting RX packet when queueing a reques=
t
>
> This commit replaces the RX FIFO flush in musb_ep_restart() with a
> system_bh_wq work item (rx_kick) to process waiting RX packets when a
> request is queued or after an in-progress giveback finishes.
>
>> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
>> index 73ac25f53698f..38469727acc6f 100644
>> --- a/drivers/usb/musb/musb_core.c
>> +++ b/drivers/usb/musb/musb_core.c
> [ ... ]
>> @@ -2866,6 +2868,7 @@ static int musb_resume(struct device *dev)
>>  	if ((devctl & mask) !=3D (musb->context.devctl & mask))
>>  		musb->port1_status =3D 0;
>> =20
>> +	musb_gadget_enable_rx_kicks(musb);
>>  	musb_enable_interrupts(musb);
>>  	musb_platform_enable(musb);
>> =20
>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index b500e0d8b0bd3..08bb605aa0b31 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
> [ ... ]
>> +static void musb_g_enable_rx_kick(struct musb *musb, struct musb_ep *mu=
sb_ep)
>> +{
>> +	if (!musb_ep->rx_kick.func)
>> +		return;
>> +
>> +	enable_work(&musb_ep->rx_kick);
>> +	if (musb_ep->desc && !musb_ep->is_in) {
>> +		pm_runtime_get_noresume(musb->controller);
>> +		if (!queue_work(system_bh_wq, &musb_ep->rx_kick))
>> +			pm_runtime_put_noidle(musb->controller);
>> +	}
>> +}
>> +
>> +void musb_gadget_enable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_in);
>> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_out);
>> +	}
>> +}
>
> [Severity: Medium]
> Can calling musb_gadget_enable_rx_kicks() unlocked before
> musb_enable_interrupts() and musb_platform_enable() in musb_resume()
> wedge an OUT endpoint or race on endpoint and interrupt state?
>
> During system suspend, musb_suspend() calls pm_runtime_get_sync() (leavin=
g
> musb->is_runtime_suspended at 0) and musb_disable_interrupts(), which
> zeros musb->intrtxe, musb->intrrxe, MUSB_INTRTXE, and MUSB_INTRRXE.  On
> resume, musb_restore_context() writes those zeroed masks back to hardware
> before musb_gadget_enable_rx_kicks() queues rx_kick on system_bh_wq:
>
> CPU0                                  CPU1 (system_bh_wq)
> musb_resume()
>   musb_restore_context()
>     /* MUSB_INTRRXE is 0 */
>   musb_gadget_enable_rx_kicks()
>     queue_work(..., &musb_ep->rx_kick)
>                                       musb_g_rx_kick()
>                                         musb_g_rx()
>                                           rxstate()
>                                             /* clears RXPKTRDY */
>                                       /* next host packet arrives while
>                                        * MUSB_INTRRXE =3D=3D 0 or platfor=
m
>                                        * interrupts are still disabled
>                                        * <-- IRQ lost, endpoint wedged */
>   musb_enable_interrupts()
>   musb_platform_enable()
>
> In addition, musb_g_enable_rx_kick() inspects musb_ep->desc and
> musb_ep->is_in without holding musb->lock, and if musb_g_rx_kick()
> completes a request via musb_g_giveback() before musb_enable_interrupts()
> runs, the gadget completion callback (or a thread it wakes) can call
> usb_ep_enable() or usb_ep_disable() and modify musb->intrrxe,
> musb->intrtxe, and musb_ep->desc concurrently with the unlocked loop in
> musb_gadget_enable_rx_kicks() and musb_enable_interrupts().
>
> Calling musb_gadget_enable_rx_kicks() under musb->lock (or splitting
> enable_work() from queuing rx_kick under musb->lock) after
> musb_enable_interrupts() and musb_platform_enable() would avoid this.

Makes sense. Will be back with a v4 shortly.
