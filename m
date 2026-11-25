Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625219;
	b=jUOkhjadZ8/vGcnZr7omFQeYWeDmHTLTPrWKOJzNkPsCQTtEKag5HGUXZ44IFDphEmf9
	 IT/zbVYroCNxc3MlpaHAYgTWghaqxg0IMNs8Ah8iJx6loOevxS2QGAkJfkm3fIs4297oa
	 Vo7di+IfprlEeUp1dxO9X090YH9mdbBJvpq1LSYQYJg5QojaxWLqdp0Pbpy8W11r6XM8K
	 +1CYLBurvHLlqu1VpQDxT1o55gMcI9TiU9CV4PJbjhAPzp1AXK3mHAetgR0jFqJx5krHE
	 GU/2IsfPPlcGX3JnySI6ddI3NzfD3C0cF2ok6bopa4iesqCUhTPNVsIMV+OpkNNbEQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
	b=5BYX5ozNKEKD4kS+JswzCqBRTm974GYLRJeXEPBe5qY+VWtmSPkjQ2ZShHI0qZM+xxDW
	 rRmrQTxPI8ZSCeri/85Qms3pQuk5ZvbWY7Vfx7qmc2vStmbm/qeJNELG2JMwIDr+QTpQn
	 LH3bq7oT5Sm6tvrZhm8kkt6WVtP5Qm5tvRukpT6vXXS9ulFimUih+Wcwm0jwg1qEoaGdm
	 grcI3lasejNPyGapptsqV4FEgFkYcHg525LK7IuT1KqzckIsewXi4BaGG0VOhSqIqizT/
	 PN0202kThuPVfU861b2xrw1Y1d9HWdBAkF9LhEYfTEO8sPdVcqZVhtfyPu2v/AnwbTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq9xkX1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2B606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq9xkX1P
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f020d0169eso30034475ad.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625219; cv=none;
        d=google.com; s=arc-20260327;
        b=I9iWPZcBXAQOA+N502QwEsGRfOODFlgXmMM5+kYPIIswXB3dv5jQ+9zqBygdVU1tgX
         9Dz1eUmFUzjLZ/7LJKbZhYzYyPSmx1KkDuUAydkx2nlhqDzfR9ocXCXCB1eWDQZU7MMY
         owoAeffN8HLzHIAXbdHend1dX4lgIq/dESj6V6JiXcfLk/9swrAhnvxZIkMm4Duuh45b
         Hwh8E8QkhFzaHE8hfyoBtqvFwGNv8gnhPxx2K0MnDa/f7jC9KAXDad3TwcN26qUgXUVV
         u+vcWWq2aKoQK+LQFdqhZrTqunk5BcFkNNLMHtjcH7y/CIwgqE0KTEOvCQjBbhsHG9AD
         z6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        fh=sdt6G3k78yafayXNQI00+zexiWmLh2ZFlMXHty46fJo=;
        b=kuacydeb3ZsgO3ScQH/mf6BM6Q8ruF919A3bkL9qINirKSDe+J6ZSgqQMnpIGR4ror
         zT4YXJL3OkNSyRZbmqelyluysXXnHya2FnZPeugYmPrMbvETPaZ8EC7r6j5Gzj0tHD9x
         b2I8DpurY7TI6V+VdxypmNR+rvZUvHR706AcXq6HTHacdzzAouMfaOC5Hm7L8mt0uXut
         6tJOlkjcH4BHfvHxQ/YaSs+aHLtgLOB3GqiFRO9s7S0S+8wNeupss8d6O1WxvAUSqi7v
         0FcdriwIrSeiE9pMOObSvtwqXozYPnTja2YuCA5GI0VS/zuZeQTjHomRI7yDD9Kk4Tb7
         49LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625219; x=1796230019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        b=xq9xkX1P6hWe7y2qGFi5ciej4BIskGDn93nQQovSbjk4KLmRX/Ejdmiek8bmM7dyys
         n8x/fY0zWRCPov1SKZI+7Nj2AyzvyEhtrXdfIiBoVBcE79qZVZVRKvb+cl/OhZGdTk3p
         9Dal7wBfDAkw8xtBeiOL4nPzjY4ec0teH369TB0QVKKpLncgc5O4p0h3wrH9TwGhDmoV
         TK9+Xylq8krkTtc/fNXdIOtu6+mV7t0yrPhpgptzLlHCRRGJaS2USkqNpiWoVp9Il2N4
         7X3RWF5B8vsX2HceUxe2TIgC6OCWWv2nBOx2wBPcRMhMa5QCgaSVHyr9QJFuPgiEPb2a
         MSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625219; x=1796230019;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        b=UyU5XSXs9QsKQCZbLab0Eqzz68HJlg4WKhf8yANzs/rYTB0Ja7F5J9UNgPK3DGz17T
         8woWAhGW0C7o2QRT+MDXGKZWyUDRiQi37dqTpfFDXPVrdLmf0Kd9ZfKNRUXBwBZTC4mw
         XfifJKnw3sq/n+BTC8aF2Wkh9Rak1SOtLOhts4E8muSmoi8e6BH0qQXr0PMEibV1RYLR
         z1Eh/m4g90XL9ZOCw+HZiOhFtkMNvXPRCIepedD4OWbW0uRcvHZImTW7D4E1iMUubz2x
         TTXvSimh3XqEa/XC9IqnBZXS/mbyWwWwTBNq2iJAMgtWQxRmEwKmd6/6LWeroIrgZ2/a
         +xUQ==
X-Gm-Message-State: APuU4Z8jKWwtSSDlYg/JQchTR5F/L6vBo61C3y/OzEyDHlzS/8WC66x1
	UTLV0wt/rCwLueOFsHeq1VE26oyL4Kj7+QC20JlMoJUcDd78Swu1rfpelY5xEe7qCNEtN6LRryI
	Nd/9HJWEw02cRt11dOFTU2gyQVfymoB1TpQ==
X-Gm-Gg: AZFdTZevTSq1+IR0K+WSHyoLZviw5kpYGfIuAoQ8VYIRD+JIPOjw1mNDtcvYsHECc7H
	HQjs5FXjaLzxL13AjY3+5Fr6nVJFBbaag3SHZAxpVtRJfyh7YlL925XHrguG5qVUbKl12gAY5UM
	NmdyJtO2XzpcipHUEqar3kE9Z7k8KK+sDWhOgUEakOPec0vf+6bk22i0gUubh7n6NG7TqfB0kS/
	0AIFAz4PoGAJnKpuC4YIfY+/O8LFk4m+JGg/AoXtxk4sczjbWjrZho0W+3OlLyj9yhkf/N2TZgA
	VSoaWboZMz8xvmRpCFAgdAmnRjNdfDKvMLc1kJBfzJvMsmYIwhq8JfjXQ2wTM6ttbCGEUYlPuw9
	xbd4enZx9h11Ps/GRDWhC4Ki9jbHf4D6C
X-Received: by 2002:a17:903:1b4c:b0:2f0:a8b5:4330 with SMTP id
 d9443c01a7336-2f0dc64fcbdmr24291335ad.18.1795625218595; Wed, 25 Nov 2026
 08:46:58 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 10:46:58 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
Date: Wed, 25 Nov 2026 10:46:58 -0600
X-Gm-Features: Aa3M54r5hd1_jSn3QPbVycglwSRHi1SAylD7McKlbAvXL2of4Va2BSZXo0kgJpw
Message-ID: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
Subject: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB audio
 probe on Fedora 7.3.4
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
Booting the previous Fedora kernel restores audio on this PC.

Hardware:

  USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
  Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
  Connection: rear motherboard USB port, enumerated at 480 Mb/s

With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
USB ports. On one failed plug-in the kernel enumerated the device,
bound cdc_acm to interface 1 and then logged a disconnect. After
re-enumeration, the USB audio driver repeatedly failed to query sample
rates and mixer controls. The X3 never appeared in /proc/asound/cards.

  cdc_acm 1-12:1.1: ttyACM0: USB ACM device
  usb 1-12: USB disconnect, device number 7
  ...
  usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number
of sample rates (clock 33)
  ...
  usb 1-12: 13:3: failed to get current value for ch 0 (-110)

An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
With that module on the same 7.3.4 Fedora kernel, the X3 registered
with ALSA and played stereo audio at 48 kHz. The first hot-plug test
still logged errors during re-enumeration, then recovered. On a
subsequent normal reboot with the patched module installed and the X3
connected, ALSA and PipeWire exposed the output and input, and the
earlier rate-query errors and timeouts did not recur. Playback worked
after the reboot.

This is the result of testing one unit on one host. I have not isolated
the first bad upstream commit or established what functionality needs
the ACM interface. The results so far are for Fedora kernels.

Would a device-scoped ACM exclusion be appropriate here, or would a
comparison of USB traces with and without the ACM binding help narrow
this down?

Thanks,
Flavio
