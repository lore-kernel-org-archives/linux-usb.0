Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795366660;
	b=lW+ZDWpLH1Lft0CU2YbqdusUtPhU3Wvbkk62cbPAqo527jkkS1fEwVhhNxBSVKMXbQBq
	 U00lg50MJOEbahe8wCG+n7XPiiiZqlRLOU0y29tnAzFl8ejk6BoB07i+3n0qlGyhyqEIJ
	 dBhnNLIQVF2juHO/PlWd2SEaMmhBBcJGIrMxXU8/3bVm5cjr+zpF5M8lfU2+fwZlflJpr
	 M+5YN4R1TV6/F5yH8hzZPRlf6mU2ZpL+jKxexjtjGLwNZFoool2BVcm0Yy3hgNWHYEQVq
	 AHzflF4qDC7OR8atHT3/6mLheJxBmA4VJovcRPma0xhUA9O9NKLXgjZylmDibGgaT9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OryJkz7U47/d4IlAf7R/i3mw8lG05/VpBlG1tm8wHHo=;
	b=WGD61MsFi2pBV9h+gE4+AWWkAEw5aI4aJTOt17kng+k6NNSrx8pP2heZYC5Pny0EZrfz
	 zMq//pZA4XOfAnWi2K1oj8Vv4Y8Sgi5teVz8YR8FB3yoiPreMBbbeoGnQwUPfMHDQW5YR
	 +hNGcMu1mmPshwS7HlEc5/p0Ok/YB3k8icBqWRtgXXZe40FEZzmJtvP40IqlwgHqg1PL7
	 uov16JEQRjR4tWqCfPKAluFaKeFI4eFbjVtiMkgyZ1oq4nTYkgxdM/haHB/60rpmVS089
	 HguPmC3VylV1O7dKyZ3Qqm2TP1SbBCKHjrZIr6lFarjNT/awLZM1Wo5Y2zWfPjGio5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMzqRLwX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586EF606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 16:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586EF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMzqRLwX
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so3074393e0c.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795366659; cv=none;
        d=google.com; s=arc-20260327;
        b=OcyaCva1Qpl6A5b9xIoHbQ+eodg0cmIwWi+NuEm8N2MWmwEnD3QaHMFXZ3VI9jkHaS
         MlDGqUwIMifE7rDVZiBKLQ06DGpETaQS2cqM9rdD2VvomR1KwXawjUd2BxtEJ3Vx/dzd
         lVWWsYldGh1z9T2ggYkx6/GHwu1mmlIT0lIQGOkhUJ7w3dtT+VbAfI8fALvVnFvLDb40
         IR0YHXdsH8C/yXdFsp/kgyXjNuIkazctuzeBNDm8j/3VE1T1hekiMLyyljhuvuSidgXu
         SZg/tN9pFZiZbHHKddx6JLY96Dtjg1LhKPeDkz6tMI6Ybn7rkJcLXQpZ2eL1EH+b3i7x
         i3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OryJkz7U47/d4IlAf7R/i3mw8lG05/VpBlG1tm8wHHo=;
        fh=SUPiueh4k8ILhxkZnHoOmH/widvbSyMK2XjosoKG0wM=;
        b=KS6ClGtEoqZUCGrpuV6p61PE8nSFl8hZ8WQ28csv3HRon+NYZJMRzUdJiiGZPweW19
         PZt+gr32L1V63eNKtcMzNt18rrKtBqwvzimx3wrC6SLertP3ovpgRa+XPgTOc8hUGg7E
         oSjjnZwte0VOw0lHGjNs9XcNC1U36/Bf44eAhTyVzCxJgxpfganD8r1bt+gJWyANCeVQ
         /Ml4KUz2w5s/3qjGCYYTn6Yw10q58FJ3BcMVaHdEO6DNwVrvygf2UoClns2EuxTwikVA
         l5vCLf0jDgigxkI28hTfTgMxzawAv2CU/jV3OTNpGHQx23AiL8G0eaFsPCieb/N01kBf
         eX5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795366659; x=1795971459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OryJkz7U47/d4IlAf7R/i3mw8lG05/VpBlG1tm8wHHo=;
        b=rMzqRLwXov6evZ2rLebvuftioXwAyJyaUMLP8Jg6kYl+gUpqkdvNNi2DejGI1+kJKk
         YDN4YvgqEWIMHlJ+Y0m8HlrPgu51W4IIVmtaGJXnHH9BI5EFMG2MuBVfthWTGT+gKhCj
         QMHff8Jr30WXIpTNzMCjg3DN9VzJgqUZSJucqL/dtMuBYVmknONnrdiBNTMNFVtMxI3e
         bhOtY546ITuL7R2uPQ+m+zcFLw0oPMmGgK6LMcEPysWHivadw4XmLm5mrMt8zANzVpM3
         WUN0qN1CZibadSvr6xm05P8sErC0d1Kw3Mg7d5fwvnhQG3K5//qLs2qxr3YerqkPfCHl
         CBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366659; x=1795971459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OryJkz7U47/d4IlAf7R/i3mw8lG05/VpBlG1tm8wHHo=;
        b=24yLNBz5nHbAGKTTvcT1UIBgnbua8+Y0DSeR8+nxnye3ri0slixY58XITwlQB8uEw8
         owQI/sySlRBCrEF6T9WsEXxZXFn/azS8XJlmArj6swHCpqKeYsCtOXnVcldA5xcd6C3J
         HPVeSGtjVl5mnyZNENrf5BK9wXFBAA4c8Aan7fr54oe1Y998mGC51GzF5z3kdZneOgMp
         +FlsOAGNGIVq/HFqOmz1VF/mhxhipJzKK3fpZV2mtCAP1pdqRPFbQUZTYbEYra1KN8zc
         DfAempKwTMBgKqwk/fpeSXsi3lnZoJTeTbFRJfSEUGhWvhweox+4TUNRxCyIK9fY3c8s
         5uKA==
X-Gm-Message-State: APuU4Z+KIS2XpSFwZn+SQjAcCLzz6MNAXs8eBEljxuFVrKG8CtICoTAf
	OcWnhTlJhiNM4lEx9ncqcG7WWPeLwa774QugxfpaefX5vqjFLwh10LGJyvDzVyszRHXjKFbTiFt
	KtkezWdNOMRmH9S/JTa6iFGftoWJEtVw=
X-Gm-Gg: AZFdTZebbM0aAOrBh7wcQCMRuj38JbROapU4Prw4M+JrvcDw4XPqZO+pPnZb/5IOOhi
	xnhvwYHvZDqPd7kCd54+sfenkuXhBu7MxLJ2M6UdCRvfz/0O9SiE+GLnpYDAkmQrEOZt8sVpNgX
	MAotfha5xVeSH1SlFJQsvYptZ/XVcytfXOgPlGQCTZPipmlJZrHldr1Ex978zpvVzJ7Txm8KVVE
	00rgPw7+3+cK71zpQLCdxwhxT91jBM0q1YVFl/qPS5AubmBN1hGkUUR9LwTLM+2ZTw18bkmEY64
	yJSttyUSjSoTbdjWZzY7jNH0tiHUsmF7RtijJ+k1U/N4AUMpnUVNLUn2sEzn5Vf77eGocPavceJ
	FIQspeFt0t+/I0NRP2ue+PMpIVgAdMNEQ2d0Pyt3DWV/OMVvpEscgN+ZFIKzGOmBWk+f8EKEwDs
	9KbVhuNOz5+djXvao=
X-Received: by 2002:a05:6102:50a8:b0:7d2:ca2b:ad5b with SMTP id
 ada2fe7eead31-7d6dba5d2a6mr3260016137.42.1795366659038; Sun, 22 Nov 2026
 08:57:39 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFu6za0w6v+FjLax8CTHUXz0qxLSanf-btccyFUAkYRav-L55A@mail.gmail.com>
In-Reply-To: <CAFu6za0w6v+FjLax8CTHUXz0qxLSanf-btccyFUAkYRav-L55A@mail.gmail.com>
From: "Aki. K." <aki.kuramoto@gmail.com>
Date: Mon, 23 Nov 2026 01:57:28 +0900
X-Gm-Features: Aa3M54rpbE4DOxG_3S0EhRlGc60Mjj4iJcsnpfM8_BpoxB1z1Pl9fOQSgce5CNU
Message-ID: <CAFu6za3R5KB9JRkx6jkYqYgzmNtcmi6CQ2wstMhUW4NV=oUEyA@mail.gmail.com>
Subject: Re: [BUG] usb: dwc2: gadget: a SETUP during a control write's data
 stage is taken as the data, and ep0 stops (buffer DMA)
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI, I also opened an issue on the Raspberry Pi kernel tracker, so that
Raspberry Pi users who meet this can find the report:
https://github.com/raspberrypi/linux/issues/7786
I would keep the discussion of a fix here.

Aki. Kuramoto

2026=E5=B9=B411=E6=9C=8823=E6=97=A5(=E6=9C=88) 1:44 Aki. K. <aki.kuramoto@g=
mail.com>:
>
> Hello,
>
> With dwc2 in device mode and buffer DMA, when a SETUP arrives while ep0
> waits for the data stage of a control write, the data stage completes
> with the 8 bytes of that SETUP, the SETUP itself is never processed,
> and ep0 answers no further SETUP until the gadget is disconnected.
>
> Hardware and kernel:
> - Raspberry Pi 400 (BCM2711), USB-C port in device mode
>   (dtoverlay=3Ddwc2,dr_mode=3Dperipheral), dwc2 built in
> - Raspberry Pi OS kernel 6.18.50+rpt-rpi-v8 (raspberrypi/linux
>   cff533aec2fa601846766b32ff57204e0a61bed7)
> - debugfs params: g_dma 1, g_dma_desc 0; hw_params: dma_desc_enable 0,
>   snpsid 0x4f54280a
>
> The code involved is the same in mainline (drivers/usb/dwc2/gadget.c,
> dwc2_hsotg_epint() and dwc2_hsotg_handle_outdone()).
>
> Reproducer: https://github.com/aki-kuramoto/dwc2-ep0-setup-repro
>
> - The device is a Raw Gadget program (a vendor-specific device with ep0
>   only). It takes vendor control writes and queues the data stage of
>   the first one 2 s late.
> - The host sends a control write (bmRequestType 0x41, bRequest 0x01,
>   wLength 16) with a 500 ms timeout, gives up, and 3 s later sends the
>   next control write, while that data stage is queued. Hosts for Linux
>   (usbfs), Windows (WinUSB) and macOS (IOUSBHost) are in the
>   repository.
>
> Gadget's output (the setup, then what the data stage brought):
>
>   control write, setup 41 01 01 00 00 00 10 00
>     data stage SHORT, the bytes received: 41 01 02 00 00 00 10 00
>
> The data stage holds the second control write's SETUP. After that every
> control transfer times out on the host. With a Linux host (Ubuntu,
> kernel 7.0.0-43-generic):
>
>   usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd host_linux rqt 65 rq 1
> len 16 ret -110
>
> (the same for each of the following control writes). Windows and macOS
> hosts behave the same way. With no delay on the gadget, every control
> write goes through and each data stage holds the host's 16 bytes.
>
> ep0 registers (regdump) before the first control write and after the
> stall:
>
>   register      before       after
>   DOEPCTL(0)    0x80028000   0x00028000
>   DOEPTSIZ(0)   0x00080008   0x00080008
>   DOEPDMA(0)    0xf7577800   0xfb018808
>   DOEPINT(0)    0x00000000   0x00002010
>   DIEPCTL(0)    0x00008000   0x80028000
>   DIEPTSIZ(0)   0x00000000   0x00080000
>   GRXSTSR                    0x00ac0080
>
> After the stall, ep0 OUT is not enabled, DOEPDMA0 points 8 bytes into
> the data request's buffer, the IN status stage (one zero-length packet)
> is armed and never taken, and a SETUP packet (PktSts 6, 8 bytes, ep0)
> waits in the RxFIFO.
>
> How I read the code (buffer DMA):
>
> 1. While the data request is queued, ep0_state is DWC2_EP0_DATA_OUT and
>    DOEPDMA0 points at the request's buffer. The core writes the new
>    SETUP there and raises DXEPINT_SETUP.
> 2. dwc2_hsotg_epint() calls dwc2_hsotg_handle_outdone(hsotg, 0) for
>    DXEPINT_SETUP whatever ep0_state is. That completes the data request
>    with an actual length of 8 and, as ep0_state is DWC2_EP0_DATA_OUT,
>    starts the IN status stage (dwc2_hsotg_ep0_zlp(hsotg, true)).
> 3. The SETUP is not passed to dwc2_hsotg_process_control(), and no
>    request for the next SETUP is queued: dwc2_hsotg_enqueue_setup()
>    runs when the status stage completes, which it does not, as the host
>    has moved on. Later SETUPs raise DXEPINT_SETUP, and
>    dwc2_hsotg_handle_outdone() finds no request ("no request active").
>
> A device has to accept a SETUP at any time and abandon the control
> transfer in progress (USB 2.0, 8.5.3). The delay on the gadget only
> makes the timing certain: I first met this with no delay on the
> gadget, with heavy bulk traffic and frequent control writes, now and
> then, as if the host had sent a SETUP again during the data stage.
>
> For comparison, TinyUSB's dwc2 driver handles a SETUP that arrives
> during the data stage in buffer DMA mode by reading it from
> DOEPDMA0 - 8 (https://github.com/hathach/tinyusb/issues/4327,
> https://github.com/hathach/tinyusb/pull/4333).
>
> I can test patches on the Raspberry Pi 400.
>
> Note: English is not my first language. I used an LLM to help me write
> this report and to read the dwc2 code; the tests and the register dumps
> above were run on the hardware described, and I am happy to answer
> questions or run more tests.
>
> Thank you,
> Aki. Kuramoto
