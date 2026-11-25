Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625223;
	b=xAqAa34KslT5aWbaJlMUOmX3MSQDjiPCyLGmYmGbros8WMjkalFyEdwznKxVh8TmNU8p
	 mUchfZO0l4W8T6iX2DVH1HJJh+Goaz5HvIJXqDnSMEpdkmzJzJXPzeOaPu+WZUemgglu6
	 maszUQz6N0ZSXJ+Y6A9oPIV5FX33Hk2+H42DLbaZVPfHebzjaRHmOygvF7yDlRGqNq6v1
	 FixNoFM80J7PuZel/BUCVhy+FbSd39js586UQ4G9MD/4GXZtodKUkEjT1w3jbAir1svoF
	 dyhCJG9j/L/U1mfmUxNZeQUTK/BC85oenJAWY0mn7gD2quheTzOmGk6LdRD8hMN17nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:
	 In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
	b=Wzg2wkK1vJinnGAuHt408143HvxUwh+WPUb/39nDUb4XLLMV813gDVoYKh/uxJ8/VAyj
	 24mC7hcEbrTtwthUS3D8PbRLx7V72dohSOeyUP3mm+tDCAO2aQ/EYsDkD48pynHyrxpT7
	 PiyG8PgYS/SOktvnLxzSEZzKlzTzFkX33BbPySFcBZF6NH5zjawqPXYlCaog1yWWLBYQR
	 4SIafzCQiq/3nq+pCzv4YC+ZdstWRQLv1LnUJIX48cGXAb0UYoi4Z4fU+yUrF7IUiyhZs
	 dqEJx53ar3ZkThtzqifKyKbGdGcZ6cX+OceSsSaPgtg7a10Rq+tVL3avJU8OIzHcdgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q7zqi/xN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3C606A32A
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE3C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zqi/xN
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0464dd6b6so36882135ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625222; cv=none;
        d=google.com; s=arc-20260327;
        b=NUmMnFiHEUye3RWR5vE1r98HUco2CEQVsSmGv5wEYYtBXTtXq6fw8O1HLkJ4UsMoW5
         7IQ2A2UE+KJb0v4XCD96nnrnnZdR95tQ5ZCFyLHzYxAb41GDgcylJiyG+KanbRremSxS
         JhehlJdZHA9ZJiatm2fT3lqauaxpqsck/sW3JEsmSj2Lg2eSX8cYqMO1oStejVML23tq
         FEcT9WIokdfnHkpOMGbfTZT51is1w48SQuyKreaqwPQ9iampc3PPQbkp088U5fC7IYB7
         ndTi3Kme8yLCdAaOOrq+PIWvCLYftBssgFDIhKQEdEZZvZ8QlKXKa5+HaDTuvLOsses+
         MBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        fh=sdt6G3k78yafayXNQI00+zexiWmLh2ZFlMXHty46fJo=;
        b=rstzaLKfPG7gu6l84aboyBr7X00UE6rLN9ngjl1zy7+kK9iA2B5Blqt5UpCI60VwwZ
         ++IvxiQAuWoG7zq2NLBm5u/yk5jc3IoYIJU6k4aI2X5Cu0zmAX9xUSLEbvjRLT0W3t5B
         B2aTxOuuu35+AP1RzWaVom7RWwrPS4MfJ4x+xE+aCspenGflVBeOlbJMLXhNJskDS0BC
         HwEU7THEzQ0bcPaytE8oUP1NpVyhJ481kS0jGsU6wOwID/+LMw/HKpNT7w1i8rSGlthP
         bt+Wo7RBAsio9/W/StRWZeTcxxb3ne1D5r9s0CjArjshpFMDVQr7PCwuB1oXmLiW06h2
         Hksw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625222; x=1796230022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        b=q7zqi/xNxU0jo82dx5aLSuBZCcbUd+Km1bTPGrwv1s1LaRXNdOdeiR/nsyr5ECEajw
         3HzVYv1Kk3BNbu0uAZkZMpZ+JIqmMKk1UJdPY+/SufmPNkMGiVUa4bBUToZVyGhXUdJO
         GMzPYrR7GzNKdAolJJfZU77AAAxjbnaJjRprRQWvIVWQvrIb7sPSDEPM56ub0T0+/sVT
         qc2B13wCCXGnW74jKwGJQUknoPpHfFake1Ol2ETuXFq2wRWyazAXAQtyoFqmLq0/q+hp
         VGLD8T5OsPtlM31uETY9w632Y/Hk7FoMsOMwvHz+yxbQD2cTMImdAXmnHElRZAEAQWa1
         MBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625222; x=1796230022;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        b=XBVTc+Fs6gTx93cWIVCQvmvAnZX6Gv8RPiaGrluHKGzqL2UFk9wICRP3YHHbVENozN
         sqe68ZASmntjaTsFOa1JJCIp11H4roM6/u3Sikl50UnSKfPISU2UeDRT7jk/hqUkwns7
         gvNu4W5Sps08rOz/VpqWmneng3alsV3DTKbn68T8/MgZpgjl7SotYQkhnRtcJlm8H+ak
         o+ddqanGgcTWkKLE1ONuoE+Sv9myhaNVdTVNzMmlZquOharqrKiz3TEfyYwWGjWq00dL
         8s+F9lV52EeHdNyjx3Za6gHeYczyi1t6KKErdA1yllNtc4NDwcNApLqErmFm4NzhgydP
         uF9A==
X-Gm-Message-State: APuU4Z8arUHs5K9KW+yKs9qRQheVPc5ZaopR9vafSp3KpSEFrA6nK4ys
	0AUIFj1QPxmBDBdkn55Qi9qXP05nSeElKTjT3yEMzfhowjkGCzAhW6R6+QETdUQGdORgC48pj2D
	3YY/tdgdzWbl1vWX1UXGciHAm8rMGSPjsbpVV
X-Gm-Gg: AZFdTZfYYRhiiC7wEp2q5iKmFvgcA2jDff7ScjfIXFApM0am0fbNLlsuQaQWq3wY/BG
	jmJZG7PIm5AsSMCgsxTggGuKpo6anqrYEpLJR/QjS/sgnS9tCZh3kS79eUbA1R3ixOfjjXXHlVy
	h40RAjeBPhSCbRw9OkkCRU67UIRG3bFknohOdEPTGHQN2LVtl9IPgecwkTacasp/S/CmwIpS8o1
	0ES2IZAirgoEd8cWVNJqro2/Fjv+HQXzJ0Eh7VRKuLT+zfHpIIuYPg49cR2v5zlHh4W+uqEAsDw
	zGKBQXolPv6B0N2jaDCQvfVlOzQQLfemf5PbaOsg30x8e9FbNvYvWevRHdimcQmNwnm3t2YWGn1
	6PNZetQbn1VaBChEBTGhP1wkyIM/UN/RW
X-Received: by 2002:a17:902:ecca:b0:2f0:4e5d:ff9a with SMTP id
 d9443c01a7336-2f04e5e0119mr149933095ad.55.1795625222273; Wed, 25 Nov 2026
 08:47:02 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 10:47:01 -0600
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
In-Reply-To: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
Date: Wed, 25 Nov 2026 10:47:01 -0600
X-Gm-Features: Aa3M54qfON0_W-XuR0c3kYvZ0LE9PvCxw6i2-OaWxsTgsI7rmm0dwB5QEokQNW0
Message-ID: <CACKiate5HP20D6StbQk9S2Z4bdLne=FBtOPLh8-SK8529L7EoQ@mail.gmail.com>
Subject: [RFC PATCH] USB: cdc-acm: skip the Creative Sound Blaster X3 ACM interface
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fedora 45, one Creative Sound Blaster X3 (041e:3264, bcdDevice
10.90) fails to register with ALSA on 7.3.4-300.fc45. The kernel
binds cdc-acm to interface 1 around the initial disconnect. The
audio driver subsequently gets timeouts while reading sample rates
and mixer controls. Audio works on the previous Fedora 7.3.3 kernel.

Apply IGNORE_DEVICE to interface 1 of this USB ID so the audio and
HID interfaces can still bind to their own drivers. A normal boot
with this quirk restored registration and playback on the affected
system. This removes access to the X3's ACM interface on Linux.
Its role in vendor controls and firmware updates needs validation.

The first bad upstream commit has not been identified.

Signed-off-by: Flavio Giacchetti <flv.giacchetti@gmail.com>

---
 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1775,4 +1775,9 @@
 static const struct usb_device_id acm_ids[] = {
 	/* quirky and broken devices */
+	/* Creative Sound Blaster X3 */
+	{ USB_DEVICE_INTERFACE_NUMBER(0x041e, 0x3264, 1),
+	  .driver_info = IGNORE_DEVICE,
+	},
+
 	{ USB_DEVICE(0x0424, 0x274e), /* Microchip Technology, Inc. (formerly SMSC) */
 	  .driver_info = DISABLE_ECHO, }, /* DISABLE ECHO in termios flag */


On Wed, 25 Nov 2026 10:46:58 -0600, Flavio Giacchetti
<flv.giacchetti@gmail.com> wrote:
> Hi,
>
> My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
> after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
> Booting the previous Fedora kernel restores audio on this PC.
>
> Hardware:
>
>   USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
>   Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
>   Connection: rear motherboard USB port, enumerated at 480 Mb/s
>
> With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
> USB ports. On one failed plug-in the kernel enumerated the device,
> bound cdc_acm to interface 1 and then logged a disconnect. After
> re-enumeration, the USB audio driver repeatedly failed to query sample
> rates and mixer controls. The X3 never appeared in /proc/asound/cards.
>
>   cdc_acm 1-12:1.1: ttyACM0: USB ACM device
>   usb 1-12: USB disconnect, device number 7
>   ...
>   usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 33)
>   ...
>   usb 1-12: 13:3: failed to get current value for ch 0 (-110)
>
> An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
> With that module on the same 7.3.4 Fedora kernel, the X3 registered
> with ALSA and played stereo audio at 48 kHz. The first hot-plug test
> still logged errors during re-enumeration, then recovered. On a
> subsequent normal reboot with the patched module installed and the X3
> connected, ALSA and PipeWire exposed the output and input, and the
> earlier rate-query errors and timeouts did not recur. Playback worked
> after the reboot.
>
> This is the result of testing one unit on one host. I have not isolated
> the first bad upstream commit or established what functionality needs
> the ACM interface. The results so far are for Fedora kernels.
>
> Would a device-scoped ACM exclusion be appropriate here, or would a
> comparison of USB traces with and without the ACM binding help narrow
> this down?
>
> Thanks,
> Flavio
