Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795365904;
	b=q4W33Ux5ccD2e5BfrlCTOw2olKIpPXpckv8lHPI+px01m0p4A7C5CmFr4OXdNqVnM6SO
	 suNfGwD9tDw2pRmRxCP3l6pbJQ5Wsm/YCe74NrkzWrD9h9HdfbozMD3i8igm/9/QcC90f
	 ibrIZ9fCt5skY8CJsCOFy+chU7Kp1u2UusoIakc8MyN51lg/3S8eTJY8pHVRnW2s+Jg/2
	 ev7zn9wB4WQAJa4I+HCzv6mCgOmjSbLvudN4yPU5q/+q6cnHEKtWTxKnLIp3pH3U+S5fa
	 InKyeTNiXc7ly1mz5EYgke+40jaqtO6iUXL+ReYq9CWJbjluepb+A3BNsDFc3yqvj9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=XSq9sam5xNjhAotL3SMmly5JcheSouECZuf0HzXpnaI=;
	b=ivQXgSSft2VX3Ny0dXHHN+1dU+p/0K16EYDxuBwDsRr89FqIMxa5bC3kYMBuyqEMHs/E
	 nHfQKywdO2Ohfa2iG4ScW20GmaogXoxDFpnmZD4SMqqK/GwE8qX5K8ar/EIwP6oYgWXan
	 ARxx3grJHhMMqhY74Lt/sga01fQqkSZJdc3EzCkLRFe3TagMHav6YalEcTSe6vJ4zNHol
	 3mSmwpRr0nNsCgj1M2kO3tkUSzW8Pil9Vp2aObzuvYhCVz01ZWQtN1wxfVlWM0a/4QKK0
	 LePHSzEeYDMbOeBtRefXXvrwQGOoNaIEif6o0hg4pwXMAF9E1QgKTmdVlEmm4HakDlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfJo5dFq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359B606A335
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 16:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7359B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfJo5dFq
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99e156fe905so2523227241.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795365903; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8WWhuvJMiDc1+9io0byPg/Y8xjFyzzBc+kV729yqcl7cS33TBxK8O+ztU94BUaSTp
         kaKHlzEcXNwEHqCoO4wFTiuyJxLSnvwgERdyMosgyvy/GdqRmSISASDcLQqMpHMRSWGd
         DqkIy/20/N4VDOriOx5kyz7UfE+1yvB9lLRq613v3dAIfxvTMkJ+9pGRMFOjdBoqVviE
         61sh6jk1O3N9FRIskBEJLt8oIr3wYiNSZDPYle0OZHvicMC5Yaa6NRBpuNvuR5bsYX35
         TOrRSB11FT0y9Mf7IUs1wHgnghVvYD+X1ywc9f8KVJ5mYA7opfQlpSUOg+13HqQK9ijO
         /bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XSq9sam5xNjhAotL3SMmly5JcheSouECZuf0HzXpnaI=;
        fh=SUPiueh4k8ILhxkZnHoOmH/widvbSyMK2XjosoKG0wM=;
        b=WU0qA8T18AgHLvB7WFOtYccP9ZzGfJQXS2fRMgUWiX5koym57GI+7bdI8/PKOHMZ9J
         fxuYNsDwKofFvmGwhQoSrjr0rOeofpefu13fetZ//iY8BP9U7K3YkpDjZ3DIHqO55pJu
         RaQux9JHLD4u+c30xjR3ukijNmwo0uHGFH5R0VTt7Y+szqTNkpSVdd50pLuUsHYGFZFd
         iTCcPLrS8wHXK0K9+KXp4ujIh1/K1wQxvyW91YB1MV/fQ80k4XEOdZE6rSMv0NmIqMIM
         9y20Fc6GhFD04/J21jrj9kBULzZfMPyQXEcQhOAoafWt6T2EiHTvE5t49LIuVc6Qtpb2
         qRVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365903; x=1795970703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSq9sam5xNjhAotL3SMmly5JcheSouECZuf0HzXpnaI=;
        b=bfJo5dFqYY5GNUbMPjXIFnnfElYsa9f5pehuVAkxV+nNMkKiplVpcsxeWHa+GuF04r
         PGqypW2zILTwfYqR9+nyYi6q0aiHT79qKTyYTWa+WUd//pp1Xa3zgArxxsi5dNRSC6Ci
         47Ze4uPKEghLgTIAgShEb6WbKfYUah6XFU0kkI2EZ7yxsXczJgPfzPUWV+dJpOiesCaJ
         LpV7f3bskKpRVIHg91EcM18zfKYvSSQB9Cpt7IlVrFVaW2f5TeXi85k3NMvIaOoEb0vH
         DqcwaUj+3OoDMTLBnqARhVinMTqTZbBciFyGD9cje4YoJoq8o6KafK/m+bw5m9rpvp3g
         0ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365903; x=1795970703;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XSq9sam5xNjhAotL3SMmly5JcheSouECZuf0HzXpnaI=;
        b=IJmJyPViW09IQqGts/qZhAtYr4/OoNAge9QzBlHBpZebfXSgvYdHBk+xvhSVJ0xbYH
         mkMBktpIR4RCVPek8xSRp9vDZnOsx706SBJz+rAC1ZusTHbz4Yg1wtVRD8cMtvCS2Xje
         XxxoAWixYY65n0c2xi0axp2gQWgXAld4H5yh3RPuz/aU++yVjU8DF5zM5RRGAG+1TfWh
         CjlNTaR/YWUbB4fvfxI5QaKyrmnc6EgRMVFvBV6xZtcvvh9pnvMGW02WaLfANQPJn+l4
         l9diOLC3abAqUAxjGgcioaNE4HMMhrU5iAzj+YXh90hZUJmjyyWE/ej7gFvhKWkMOXYg
         /FhQ==
X-Gm-Message-State: APuU4Z8ia6qQV6+gEsSzDLa+BYohQRyn+WAzcYahco1Zt5J+dG+U1Pnf
	SLsXHmBHQXcMW36xiKcVLWkYFQI4UzbVOc2vzTs9ZsaHWqvlONkaVSJUTKfiSWTrP5AujBYZKyQ
	s0QXlXuB32AO0YQXnAuhc/wl1MkAMgxovVKO/qfk=
X-Gm-Gg: AZFdTZeqHHXL1ExbttTmZQSvppAhF1eSLQlukA8AnFD1sHhr+vghBWINJqaI5bjaSiW
	XOD+2FvY42nflSabgoJ1UHIyNW2CPDkBVLMRRBUE1xWvmSCNGBusTdjJBu9DSQ/t55/wcFGM2Kw
	gSLq6oBSe44lZA7cDrEBe7cAAFOMwMp56jBING81/vTWlp53jONRz5E9/lem+0Kl8RWyhg4JAYH
	Cb70SEIQrKJheZJQfpGug15agyH6vFIwO1jT81yiqZ/I4/rY4xqWEcNObz/XcuUWJYiWMHkSHkp
	U4Csq+e5af+U3W2uJaEIHwkx+vMMmrbkmHEBwUfluz/zkvzupfWfvfv0zoNBxdbp3rHr380MRi2
	mYpNJv3VslZT8lmmHjJVUx2p0Glt7HwFka5kqmN9VI+VbZ2KkB5izAZYct5WCWHJ2SAsDCHPkVp
	0WOih01cV1mXupiJc=
X-Received: by 2002:a05:6102:449a:b0:7d6:a47b:20b2 with SMTP id
 ada2fe7eead31-7d6dba2ee87mr3438289137.37.1795365903123; Sun, 22 Nov 2026
 08:45:03 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Aki. K." <aki.kuramoto@gmail.com>
Date: Mon, 23 Nov 2026 01:44:51 +0900
X-Gm-Features: Aa3M54rKQCLmVA_UGdemahVFGPTgqJ_q7_6M6a8cN-Oy8nQMV-Sb5aYeSuhjxQs
Message-ID: <CAFu6za0w6v+FjLax8CTHUXz0qxLSanf-btccyFUAkYRav-L55A@mail.gmail.com>
Subject: [BUG] usb: dwc2: gadget: a SETUP during a control write's data stage
 is taken as the data, and ep0 stops (buffer DMA)
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

With dwc2 in device mode and buffer DMA, when a SETUP arrives while ep0
waits for the data stage of a control write, the data stage completes
with the 8 bytes of that SETUP, the SETUP itself is never processed,
and ep0 answers no further SETUP until the gadget is disconnected.

Hardware and kernel:
- Raspberry Pi 400 (BCM2711), USB-C port in device mode
  (dtoverlay=dwc2,dr_mode=peripheral), dwc2 built in
- Raspberry Pi OS kernel 6.18.50+rpt-rpi-v8 (raspberrypi/linux
  cff533aec2fa601846766b32ff57204e0a61bed7)
- debugfs params: g_dma 1, g_dma_desc 0; hw_params: dma_desc_enable 0,
  snpsid 0x4f54280a

The code involved is the same in mainline (drivers/usb/dwc2/gadget.c,
dwc2_hsotg_epint() and dwc2_hsotg_handle_outdone()).

Reproducer: https://github.com/aki-kuramoto/dwc2-ep0-setup-repro

- The device is a Raw Gadget program (a vendor-specific device with ep0
  only). It takes vendor control writes and queues the data stage of
  the first one 2 s late.
- The host sends a control write (bmRequestType 0x41, bRequest 0x01,
  wLength 16) with a 500 ms timeout, gives up, and 3 s later sends the
  next control write, while that data stage is queued. Hosts for Linux
  (usbfs), Windows (WinUSB) and macOS (IOUSBHost) are in the
  repository.

Gadget's output (the setup, then what the data stage brought):

  control write, setup 41 01 01 00 00 00 10 00
    data stage SHORT, the bytes received: 41 01 02 00 00 00 10 00

The data stage holds the second control write's SETUP. After that every
control transfer times out on the host. With a Linux host (Ubuntu,
kernel 7.0.0-43-generic):

  usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd host_linux rqt 65 rq 1
len 16 ret -110

(the same for each of the following control writes). Windows and macOS
hosts behave the same way. With no delay on the gadget, every control
write goes through and each data stage holds the host's 16 bytes.

ep0 registers (regdump) before the first control write and after the
stall:

  register      before       after
  DOEPCTL(0)    0x80028000   0x00028000
  DOEPTSIZ(0)   0x00080008   0x00080008
  DOEPDMA(0)    0xf7577800   0xfb018808
  DOEPINT(0)    0x00000000   0x00002010
  DIEPCTL(0)    0x00008000   0x80028000
  DIEPTSIZ(0)   0x00000000   0x00080000
  GRXSTSR                    0x00ac0080

After the stall, ep0 OUT is not enabled, DOEPDMA0 points 8 bytes into
the data request's buffer, the IN status stage (one zero-length packet)
is armed and never taken, and a SETUP packet (PktSts 6, 8 bytes, ep0)
waits in the RxFIFO.

How I read the code (buffer DMA):

1. While the data request is queued, ep0_state is DWC2_EP0_DATA_OUT and
   DOEPDMA0 points at the request's buffer. The core writes the new
   SETUP there and raises DXEPINT_SETUP.
2. dwc2_hsotg_epint() calls dwc2_hsotg_handle_outdone(hsotg, 0) for
   DXEPINT_SETUP whatever ep0_state is. That completes the data request
   with an actual length of 8 and, as ep0_state is DWC2_EP0_DATA_OUT,
   starts the IN status stage (dwc2_hsotg_ep0_zlp(hsotg, true)).
3. The SETUP is not passed to dwc2_hsotg_process_control(), and no
   request for the next SETUP is queued: dwc2_hsotg_enqueue_setup()
   runs when the status stage completes, which it does not, as the host
   has moved on. Later SETUPs raise DXEPINT_SETUP, and
   dwc2_hsotg_handle_outdone() finds no request ("no request active").

A device has to accept a SETUP at any time and abandon the control
transfer in progress (USB 2.0, 8.5.3). The delay on the gadget only
makes the timing certain: I first met this with no delay on the
gadget, with heavy bulk traffic and frequent control writes, now and
then, as if the host had sent a SETUP again during the data stage.

For comparison, TinyUSB's dwc2 driver handles a SETUP that arrives
during the data stage in buffer DMA mode by reading it from
DOEPDMA0 - 8 (https://github.com/hathach/tinyusb/issues/4327,
https://github.com/hathach/tinyusb/pull/4333).

I can test patches on the Raspberry Pi 400.

Note: English is not my first language. I used an LLM to help me write
this report and to read the dwc2 code; the tests and the register dumps
above were run on the hardware described, and I am happy to answer
questions or run more tests.

Thank you,
Aki. Kuramoto
