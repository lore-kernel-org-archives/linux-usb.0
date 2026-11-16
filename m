Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794863127;
	b=BkhPhVEW9cjNKZlTgtNxG2CDDWmsvTDZV4RoUT0Fu788OBFS38FKXYnJggIyppmDi6YG
	 GMj2j8WZ2pmkfrt1Wy56kWxd10UjB1tBV5CwTEwHDlRGuN099eVAeNG3mrlFGCb+Tn8IP
	 idzAoMZI94UEw6PozdARFSTcCIk5k4VUGZaJ9d+KrnMwVhjsNe7oUwgchpEpmTYUplXr9
	 JQT348uyhsYVBgxFgIUjhHCwh48QwU2dlclHxy/5C8vhALF4S0Pvk4zZVNYart/BiOgfT
	 lJskTSWmjm2Ls4G+1eGj6eCfqRQrI9Wjr6VWFlYfpMlc6Fyt4N2KW/0qSrApDVYLdMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=4veSxAaMwX3Jj7x3+yTMP4jZ0+KqRcJknjq4qSmQZ2c=;
	b=e15hG9ATpLG0t/jgpGv9ecb4LC1JzvR5IuY2EnFPrAySoI7MQF1h1sgG9WxAl9XrVpgi
	 8zlNLC5ryJ0hkydQV1Z2/hHN9VksDRMQ2yqVz/SkvKQhItWljhcxmcqeqP/xbHYOYFwAm
	 bgS+PEvgLfgfWSIBWIeGko69CVmtw19taw3y8lsVtk5DRuVMMFRJgs5qttHRU8IXMLUPZ
	 MhEUQHTxX+06rSxVK0hZSCxYdm9sdFJkIGqrtJMds+6tW0jM5ajXqo3RZHiZ683wKvZV5
	 z/zJT7WxXaKIlqQgh6gga66dl8PiiSLB8vIfwuuljgjb0HZugwguydPej9ZhVEixg4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeI0iXDa;
	arc=fail smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815B606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6815B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeI0iXDa
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1990338f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863126; cv=none;
        d=google.com; s=arc-20260327;
        b=ODwFuQjAYep98uftoqBeTk4jFdRZQp2kZHw5M2ilvnZ8g0aDptIE3SN+x7txZeG9fE
         AMGnBhSflEhDfZcvuARYaCRKumqsuf04utSAHDhODxeENEINzfxNwxDFQb4fxXkTm+mV
         M2D3ano2rt8fzVeL64fLBk3WNL995P/nuvHmwClcrtTLR5++qKtz3eUIMmGY+JN02Eup
         YJU+IUyM3qdqW1th34U9V+87FuCM0a4D9cenBm28LnmumnDYUTxETbIqXXXbVmLfJyWb
         EyQf/NRmbfSbMaQ7Xh0YQGOgCXz0qSZAAYKzR1hkHTi3XUC/G8CpadVlQrijzdR3I5eN
         AVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4veSxAaMwX3Jj7x3+yTMP4jZ0+KqRcJknjq4qSmQZ2c=;
        fh=hJrQF4ylhUD1nzrC3RlT1szjk9d0YepkXjR7ys2DfBk=;
        b=CkcbqX4D4eUD9uoPW7jmL0W48gjnDC7ESzOB7zVdqIp4MM01uCmgcEvkQCGOC71uiQ
         b41e1yk7oekgkw1pAiNHZJgL2fFwEd+3i2SCUouuZspt7oBMSU9c5rFK0p6h3YQmpDo+
         Fvn5vpXuFB2ZAgTe3rXliYbKT+o/Q2/pNWC52E+V9z13CZsXgM84e3HS/IdMQDHFewF6
         KjoRN2emVIYgRFxNus+VCeBSu96LZhGOoxl8c+puz3I9nznT63lWI2mIEd53lnAo6eLv
         M+l5QOgLBDJn68mgPaiYhUJbp5oEr9T35j8Ier8vAegzMfMJadeq7f8SslMqOC96d89E
         1Q6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863126; x=1795467926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4veSxAaMwX3Jj7x3+yTMP4jZ0+KqRcJknjq4qSmQZ2c=;
        b=zeI0iXDa7mK23s6hDCkNRBvSSGuNEnGI2MnmsReVIVON0ZmkbaEDrbCUY/C+Wf/nHD
         ujfwQTnZBQiuDIc5BNKYWPacIOOaFuyqVWlCU4mhvs0p3pxhK/RUMK29Kd6goXHp/V26
         cxYiiSo6pbma7dux/YSq2JV3VFOIDTY9Lz20vF11ypKlSdb5kw9UdBrDp9T3qtxB5JdN
         pXllJTNvn7nVhO5T5UClfVAe5asL1n5EOjMsQgauZtFCtAOaSl4tzHaaC5oU/WGdxkNV
         2LZb2oUs21ZNCpVUm1R1TZiogJrXtrzEjK39SN+eJhnIAkWoZwQ/STQYdg8B7TRAUvvR
         4TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863126; x=1795467926;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4veSxAaMwX3Jj7x3+yTMP4jZ0+KqRcJknjq4qSmQZ2c=;
        b=NnkBt/QlIo55wdliXDhiSVzP/oA/5n++dFog/yDjauxkdBOMVAMuMUxSCZZTWoqNot
         oq2mJe9vA/T81Ste/KI6LFdoBpd9QHKnohhYTCUK6iFy5V6xDh1gHJvf3svhPoHhuAnb
         4KGz4KbTiDWvPFQiDTZ6J1NzOO+h9qCgmUDpKSMHWf33qzE/ZMRksaqmjw8jL0gADDdN
         kmf2PtXN6yuZsu/Rtn3uBgVx/wE+uDwv8C4aOsFVXUkyxJ8FdhPxJtLeqV03hZkrhIRl
         vKj1OZPn5a07HZAIgctx/sKj7Er+nX9s+icqklWYwkMHQ2pgvH2A++VgLPBqX25fbw/S
         1yFw==
X-Gm-Message-State: APuU4Z92gB54p9FmuOW7y94eGL4yrgJ7WMF1xICS+skfwH0DHhirL7xj
	MzaE1kDrTKfVtEnxSZxGHxYwPrepFvz/qXCmqMyV6LStTck0o79SwvKWBD5C/Fk9Spld13muz4+
	IcZdAnah/YWVY2ExUtOnvLb338PejMk4QKKeozS4E2g==
X-Gm-Gg: AZFdTZfzjoEbZullRQSJtGvIqAqJztHo+kKygPEcF1gnZvtGEFHhIJyIDz5NETLBwOx
	V4scwnLQgoh5MClSDxhk2KnelaD1tA7FZsAB5IlQKKlEUf56ZdBL3vkzs2IChZqLiDvf5stOlXG
	UNEIkYCxdCcwqAwIK79J4q2GaUBkMSo/02gJbTbal3Bb+MP4JkDhN3QK2YJ/lExeNQQaIf/ms3Z
	pP1cYYmWsma+XskM1iKVddTiHJSS5uK7r7BBFhSKcIVu1Aa7CVjronRlRdbVRba+y4sGL2sSVL4
	CuKWjKMHZMVISzFriBKKX6U3Yb/55ieXZ8dHyCmyvH50GgIjh/USeDd4Fwf/+dmHrUM/e2ASBWd
	QTKasm6M3h4Hq56aKS8dj+crHm/V/l19UCkp/WTyox5XbUy7+6WI3ZnZ59P0MBlTGC8dGvl60
X-Received: by 2002:a05:6000:4009:b0:48c:7143:610c with SMTP id
 ffacd0b85a97d-49c73bf0a80mr28032815f8f.36.1794863125502; Mon, 16 Nov 2026
 13:05:25 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Gabriel Ilie <gabiilie95@gmail.com>
Date: Mon, 16 Nov 2026 16:05:13 -0500
X-Gm-Features: Aa3M54okHE15KlOnayg-CWh4N9fJxwzAJi1nAwOVhpsxwGqjV8sss_4xjlz1gPA
Message-ID: <CAHJAn3zOCh8oKjE9fVbeD_XbnSG-h8psZWan9qkNji_mps8rFA@mail.gmail.com>
Subject: xhci 8086:7a60 (HM770) skips ~9.5% of isoc OUT packets when hot; HDA
 on same PCH underruns in step
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@intel.com, linux-sound@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000044ef206606b23d5"

--000000000000044ef206606b23d5
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry in advance if this email does not reach the correct channels,
but I have been looking into this issue for a long time, and thanks to
having some AI assistance I was able to find a fix for it, and thought
it might help for other users too.

On an ASUS ROG Strix G18 (G814JZ, i9-13980HX, Intel HM770) the PCH xHCI
controller skips a large share of isochronous OUT packets to a USB audio
interface whenever the chassis is hot, which is audible as crackle. The
HD-audio controller on the same PCH reports FIFO errors at the same rate
at the same time. Both go to zero within about a minute when the fans are
run faster, with the load unchanged. I would like to know whether this is
a known behaviour of this PCH, and whether the xhci driver could deliver
late instead of skipping in this situation.

Hardware and software
---------------------
xHCI 0000:00:14.0 [8086:7a60], subsystem 1043:201f
hcc params 0x20007fc1 hci version 0x120
quirks 0x0000000200009810
HD-audio 0000:00:1f.3 [8086:7a50] rev 11, snd_hda_intel
Device Universal Audio Volt 2 [2b5a:0021], high speed, UAC2 async
with explicit feedback, 48 kHz S32_LE stereo, interval 125 us,
behind two USB 2 hubs (17ef:30ba -> 17ef:30b7)
Kernel 7.3.3-300.fc45.x86_64 (Fedora 45)
Taint 12288 (O, E): NVIDIA open kernel modules 620.70.06. The
affected controllers are both Intel PCH devices.
Userspace PipeWire 1.6.11; it reports zero xruns throughout.

What I see
----------
1. usbmon, 30 s of playback while the crackle is audible:

- 239,990 isoc OUT packets on ep 1; about 22,700 (9.5 %) complete
with status -18 (-EXDEV) and actual length 0.
- They come in 2,522 separate events (84 per second), a median of 9
consecutive packets each, i.e. about 1.1 ms.
- Gaps between events: minimum 3.9 ms, median 10 ms, 90th percentile
22 ms. Above the 4 ms floor they look random.
- URB status is always 0 and the iso error_count field stays 0.
- Completions arrive one URB period late at each event, then two
arrive together, the second fully skipped. Example:

C Zo:1:012:1 0:1:14116:0 7 0:0:48 0:48:48 0:96:48 0:144:48 0:192:48 336 >
C Zo:1:012:1 0:1:14123:0 6 -18:0:0 -18:48:0 -18:96:0 -18:144:0 -18:192:0 288 >
C Zo:1:012:1 0:1:14129:0 7 -18:0:0 -18:48:0 0:96:48 0:144:48 0:192:48 336 >

The URBs are queued about 10 ms ahead (submit-to-complete latency
9.9 ms median), so the ring is not running dry.

2. At the same time, playing silence straight to the HD-audio device
(aplay -D hw:0,0 /dev/zero, no sound server) produces

snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28

about 75 times per second (counted from the controller's IRQ, since
the message is rate-limited). The rate does not depend on format or
period size. The same test on the NVIDIA HDMI audio controller
(01:00.1, not on the PCH) gives no errors.

3. The rate follows temperature and airflow, not load:

- With GPU power constant, slowing the fans raised the HD-audio error
rate from about 75/s to over 90/s within 20 s.
- Running all fans at full speed took it from 80/s to 0 within about
70 s, again at constant GPU power. An ACPI board sensor (thermal
zone SEN3) fell from 88 C to 82 C over that time.
- It scaled from about 20/s at 64 C to over 100/s at 91 C on that
sensor with the vendor fan curve.

No effect on the rate: intel_pstate max_perf_pct 55/70/100, no_turbo,
performance vs powersave governor, uncore frequency pinned min=max,
intel_idle.max_cstate=1, synthetic CPU / memory / NVMe load, a split-lock
generator, and stopping all sensor polling. MSR 0x34 shows no SMIs during
the events. Reducing CPU package thermal throttling from 98 to 17 events
per second did not change it.

Questions
---------
1. Is a periodic ~1 ms inability to service periodic endpoints a known
behaviour of the 700-series PCH when it is hot (PCH thermal
throttling, DMI, or something else)? Is there a way to read the PCH's
throttle state or temperature on this platform to confirm it?

2. The controller advertises CFC (hcc params bit 11), so as far as I
understand the isoc TDs carry explicit frame IDs and the ones whose
frame has passed are skipped after the Missed Service Error. For a
UAC2 async device with its own buffer, sending those packets late
would probably be inaudible, while dropping 1 ms is not. Would using
SIA instead of frame IDs be acceptable here, perhaps as a quirk or an
option I can test?

3. For the sound list: is "dma error: 0x28" (FIFOE with FIFORDY) on an
output stream consistent with the controller being unable to fetch
data for about a millisecond, or does it point at something else?

I can test patches, run with xhci dynamic debug, and provide the full
usbmon capture (3 MB compressed). I can also retest on a mainline kernel
without the NVIDIA modules if that is needed.

Short excerpts of the capture, the kernel messages and the measurements
are attached as small text files.

Thanks,
Gabriel Ilie

--000000000000044ef206606b23d5
Content-Type: text/plain; charset="US-ASCII"; name="hardware.txt"
Content-Disposition: attachment; filename="hardware.txt"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

TWFjaGluZSAgICAgQVNVUyBST0cgU3RyaXggRzE4IEc4MTRKWiwgQklPUyBHODE0SlouMzM0ICgw
Mi8xMS8yMDI2KQpDUFUgICAgICAgICBJbnRlbCBDb3JlIGk5LTEzOTgwSFgKQ2hpcHNldCAgICAg
SW50ZWwgSE03NzAgKGVTUEkgY29udHJvbGxlciA4MDg2OjdhMGMgcmV2IDExKQp4SENJICAgICAg
ICAwMDAwOjAwOjE0LjAgSW50ZWwgNzAwIFNlcmllcyBDaGlwc2V0IEZhbWlseSBVU0IgMy4yIEdl
biAyeDIgeEhDSSBbODA4Njo3YTYwXSwgc3Vic3lzdGVtIDEwNDM6MjAxZgogICAgICAgICAgICBo
Y2MgcGFyYW1zIDB4MjAwMDdmYzEgaGNpIHZlcnNpb24gMHgxMjAgcXVpcmtzIDB4MDAwMDAwMDIw
MDAwOTgxMApIRC1hdWRpbyAgICAwMDAwOjAwOjFmLjMgSW50ZWwgNzAwIFNlcmllcyBDaGlwc2V0
IEZhbWlseSBIRCBBdWRpbyBbODA4Njo3YTUwXSByZXYgMTEsIHN1YnN5c3RlbSAxMDQzOjFjZGYs
IHNuZF9oZGFfaW50ZWwKICAgICAgICAgICAgY29kZWMgQUxDMjg1LCBDUzM1TDQxIGFtcGxpZmll
cnMKR1BVICAgICAgICAgTlZJRElBIFJUWCA0MDgwIExhcHRvcCAoZEdQVS1vbmx5IE1VWCBtb2Rl
KTsgaXRzIEhETUkgYXVkaW8gZnVuY3Rpb24gMDE6MDAuMSBzaG93cyBubyBlcnJvcnMKS2VybmVs
ICAgICAgNy4zLjMtMzAwLmZjNDUueDg2XzY0IChGZWRvcmEgNDUpLCBQUkVFTVBUX0RZTkFNSUMg
KGxhenkpLCBIWj0xMDAwCiAgICAgICAgICAgIHRhaW50ZWQgMTIyODggKE8sIEUpOiBvdXQtb2Yt
dHJlZSBOVklESUEgb3BlbiBrZXJuZWwgbW9kdWxlcyA2MjAuNzAuMDYKICAgICAgICAgICAgY21k
bGluZSBleHRyYXM6IGludGVsX2lkbGUubWF4X2NzdGF0ZT0xIHByb2Nlc3Nvci5tYXhfY3N0YXRl
PTEKVVNCIGRldmljZSAgVW5pdmVyc2FsIEF1ZGlvIFZvbHQgMiBbMmI1YTowMDIxXSwgaGlnaCBz
cGVlZCwgVUFDMiBhc3luYyB3aXRoIGV4cGxpY2l0IGZlZWRiYWNrIGVuZHBvaW50LAogICAgICAg
ICAgICA0OCBrSHogUzMyX0xFIHN0ZXJlbywgZGF0YSBwYWNrZXQgaW50ZXJ2YWwgMTI1IHVzCiAg
ICAgICAgICAgIHBhdGg6IHJvb3QgcG9ydCAxIC0+IGh1YiAxN2VmOjMwYmEgLT4gaHViIDE3ZWY6
MzBiNyAtPiBkZXZpY2UgKExlbm92byBUaHVuZGVyYm9sdCA0IGRvY2ssIFVTQiAyIGxpbmVzKQog
ICAgICAgICAgICBzbmRfdXNiX2F1ZGlvIGxvd2xhdGVuY3k9WQpBdWRpbyBzdGFjayBQaXBlV2ly
ZSAxLjYuMTEsIFdpcmVQbHVtYmVyIDAuNS4xOSAoemVybyB4cnVucyByZXBvcnRlZCB0aHJvdWdo
b3V0KQo=
--000000000000044ef206606b23d5
Content-Type: text/plain; charset="US-ASCII"; name="usbmon-excerpt.txt"
Content-Disposition: attachment; filename="usbmon-excerpt.txt"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

dXNibW9uIHRleHQgY2FwdHVyZSAoYnVzIDEsIGRldmljZSAxMiA9IFVuaXZlcnNhbCBBdWRpbyBW
b2x0IDIsIDJiNWE6MDAyMSksIGtlcm5lbCA3LjMuMy4KWm86MTowMTI6MSA9IGlzb2Nocm9ub3Vz
IE9VVCBlcCAxIChwbGF5YmFjaywgOCBwYWNrZXRzL21zKTsgWmk6MTowMTI6MSA9IGZlZWRiYWNr
IGVuZHBvaW50LgpJbiBjb21wbGV0aW9ucyAoJ0MnKSwgZWFjaCAnc3RhdHVzOm9mZnNldDpsZW5n
dGgnIGlzIG9uZSBwYWNrZXQ7IC0xOCA9IC1FWERFViB3aXRoIGxlbmd0aCAwID0gc2tpcHBlZC4K
QXVkaW8gcGF5bG9hZCB3b3JkcyByZW1vdmVkLiBUaW1lc3RhbXBzIGFyZSBtaWNyb3NlY29uZHMu
CgpmZmZmODk5Nzg2MjMzNTAwIDM0NDU3NDY5NDcgQyBaaToxOjAxMjoxIDA6ODoxNDEwNDowIDEg
MDowOjQgNCA9IDxwYXlsb2FkIHJlbW92ZWQ+CmZmZmY4OTk3ODYyMzM1MDAgMzQ0NTc0Njk1MCBT
IFppOjE6MDEyOjEgLTExNTo4OjE0MTA0IDEgLTE4OjA6NCA0IDwKZmZmZjg5OTk3ZWUxMmMwMCAz
NDQ1NzQ3Njk2IEMgWm86MTowMTI6MSAwOjE6MTQxMDQ6MCA3IDA6MDo0OCAwOjQ4OjQ4IDA6OTY6
NDggMDoxNDQ6NDggMDoxOTI6NDggMzM2ID4KZmZmZjg5OTk3ZWUxMmMwMCAzNDQ1NzQ3Njk5IFMg
Wm86MTowMTI6MSAtMTE1OjE6MTQxMDQgNiAtMTg6MDo0OCAtMTg6NDg6NDggLTE4Ojk2OjQ4IC0x
ODoxNDQ6NDggLTE4OjE5Mjo0OCAyODggPSA8cGF5bG9hZCByZW1vdmVkPgpmZmZmODk5Nzg2MjMy
MjAwIDM0NDU3NDc5NDIgQyBaaToxOjAxMjoxIDA6ODoxNDExMjowIDEgMDowOjQgNCA9IDxwYXls
b2FkIHJlbW92ZWQ+CmZmZmY4OTk3ODYyMzIyMDAgMzQ0NTc0Nzk0MyBTIFppOjE6MDEyOjEgLTEx
NTo4OjE0MTEyIDEgLTE4OjA6NCA0IDwKZmZmZjg5OTc0MzUwYWUwMCAzNDQ1NzQ4MzE2IEMgWm86
MTowMTI6MSAwOjE6MTQxMTE6MCA1IDA6MDo0OCAwOjQ4OjQ4IDA6OTY6NDggMDoxNDQ6NDggMDox
OTI6NDggMjQwID4KZmZmZjg5OTc0MzUwYWUwMCAzNDQ1NzQ4MzE5IFMgWm86MTowMTI6MSAtMTE1
OjE6MTQxMTEgNyAtMTg6MDo0OCAtMTg6NDg6NDggLTE4Ojk2OjQ4IC0xODoxNDQ6NDggLTE4OjE5
Mjo0OCAzMzYgPSA8cGF5bG9hZCByZW1vdmVkPgpmZmZmODk5Nzg2MjMyNDAwIDM0NDU3NDg5NDMg
QyBaaToxOjAxMjoxIDA6ODoxNDEyMDowIDEgMDowOjQgNCA9IDxwYXlsb2FkIHJlbW92ZWQ+CmZm
ZmY4OTk3ODYyMzI0MDAgMzQ0NTc0ODk0NCBTIFppOjE6MDEyOjEgLTExNTo4OjE0MTIwIDEgLTE4
OjA6NCA0IDwKZmZmZjg5OTc0ZmRjYjYwMCAzNDQ1NzUwMTI1IEMgWm86MTowMTI6MSAwOjE6MTQx
MTY6MCA3IDA6MDo0OCAwOjQ4OjQ4IDA6OTY6NDggMDoxNDQ6NDggMDoxOTI6NDggMzM2ID4KZmZm
Zjg5OTc0ZmRjYjYwMCAzNDQ1NzUwMTMxIFMgWm86MTowMTI6MSAtMTE1OjE6MTQxMTYgNSAtMTg6
MDo0OCAtMTg6NDg6NDggLTE4Ojk2OjQ4IC0xODoxNDQ6NDggLTE4OjE5Mjo0OCAyNDAgPSA8cGF5
bG9hZCByZW1vdmVkPgpmZmZmODk5Nzg2MjMzMjAwIDM0NDU3NTAxMzYgQyBaaToxOjAxMjoxIDA6
ODoxNDEyODowIDEgMDowOjQgNCA9IDxwYXlsb2FkIHJlbW92ZWQ+CmZmZmY4OTk3ODYyMzMyMDAg
MzQ0NTc1MDEzNiBTIFppOjE6MDEyOjEgLTExNTo4OjE0MTI4IDEgLTE4OjA6NCA0IDwKZmZmZjg5
OWZkNjM4MWUwMCAzNDQ1NzUwMTg4IEMgWm86MTowMTI6MSAwOjE6MTQxMjM6MCA2IC0xODowOjAg
LTE4OjQ4OjAgLTE4Ojk2OjAgLTE4OjE0NDowIC0xODoxOTI6MCAyODggPgpmZmZmODk5ZmQ2Mzgx
ZTAwIDM0NDU3NTAxOTEgUyBabzoxOjAxMjoxIC0xMTU6MToxNDEyMyA3IC0xODowOjQ4IC0xODo0
ODo0OCAtMTg6OTY6NDggLTE4OjE0NDo0OCAtMTg6MTkyOjQ4IDMzNiA9IDxwYXlsb2FkIHJlbW92
ZWQ+CmZmZmY4OTlmODE0NGY2MDAgMzQ0NTc1MDgyMCBDIFpvOjE6MDEyOjEgMDoxOjE0MTI5OjAg
NyAtMTg6MDowIC0xODo0ODowIDA6OTY6NDggMDoxNDQ6NDggMDoxOTI6NDggMzM2ID4KZmZmZjg5
OWY4MTQ0ZjYwMCAzNDQ1NzUwODIzIFMgWm86MTowMTI6MSAtMTE1OjE6MTQxMjkgNyAtMTg6MDo0
OCAtMTg6NDg6NDggLTE4Ojk2OjQ4IC0xODoxNDQ6NDggLTE4OjE5Mjo0OCAzMzYgPSA8cGF5bG9h
ZCByZW1vdmVkPgpmZmZmODk5Nzg2MjMzNTAwIDM0NDU3NTA5NDcgQyBaaToxOjAxMjoxIDA6ODox
NDEzNjowIDEgMDowOjQgNCA9IDxwYXlsb2FkIHJlbW92ZWQ+CmZmZmY4OTk3ODYyMzM1MDAgMzQ0
NTc1MDk0OCBTIFppOjE6MDEyOjEgLTExNTo4OjE0MTM2IDEgLTE4OjA6NCA0IDwKZmZmZjg5OWRh
N2I1YmUwMCAzNDQ1NzUxNzA2IEMgWm86MTowMTI6MSAwOjE6MTQxMzY6MCA3IDA6MDo0OCAwOjQ4
OjQ4IDA6OTY6NDggMDoxNDQ6NDggMDoxOTI6NDggMzM2ID4KZmZmZjg5OWRhN2I1YmUwMCAzNDQ1
NzUxNzA5IFMgWm86MTowMTI6MSAtMTE1OjE6MTQxMzYgNiAtMTg6MDo0OCAtMTg6NDg6NDggLTE4
Ojk2OjQ4IC0xODoxNDQ6NDggLTE4OjE5Mjo0OCAyODggPSA8cGF5bG9hZCByZW1vdmVkPgpmZmZm
ODk5Nzg2MjMyMjAwIDM0NDU3NTE5NDcgQyBaaToxOjAxMjoxIDA6ODoxNDE0NDowIDEgMDowOjQg
NCA9IDxwYXlsb2FkIHJlbW92ZWQ+CmZmZmY4OTk3ODYyMzIyMDAgMzQ0NTc1MTk0OCBTIFppOjE6
MDEyOjEgLTExNTo4OjE0MTQ0IDEgLTE4OjA6NCA0IDwKZmZmZjg5OWYyYjhlNjAwMCAzNDQ1NzUy
NDUzIEMgWm86MTowMTI6MSAwOjE6MTQxNDM6MCA2IDA6MDo0OCAwOjQ4OjQ4IDA6OTY6NDggMDox
NDQ6NDggMDoxOTI6NDggMjg4ID4KZmZmZjg5OWYyYjhlNjAwMCAzNDQ1NzUyNDU5IFMgWm86MTow
MTI6MSAtMTE1OjE6MTQxNDMgNyAtMTg6MDo0OCAtMTg6NDg6NDggLTE4Ojk2OjQ4IC0xODoxNDQ6
NDggLTE4OjE5Mjo0OCAzMzYgPSA8cGF5bG9hZCByZW1vdmVkPgpmZmZmODk5Nzg2MjMyNDAwIDM0
NDU3NTI5NDcgQyBaaToxOjAxMjoxIDA6ODoxNDE1MjowIDEgMDowOjQgNCA9IDxwYXlsb2FkIHJl
bW92ZWQ+CmZmZmY4OTk3ODYyMzI0MDAgMzQ0NTc1Mjk0OCBTIFppOjE6MDEyOjEgLTExNTo4OjE0
MTUyIDEgLTE4OjA6NCA0IDwK
--000000000000044ef206606b23d5
Content-Type: text/plain; charset="US-ASCII"; name="dmesg-excerpts.txt"
Content-Disposition: attachment; filename="dmesg-excerpts.txt"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

S2VybmVsIG1lc3NhZ2VzLCBib290IG9mIDIwMjYtMTEtMTYgMTA6MDkgKGtlcm5lbCA3LjMuMy0z
MDAuZmM0NS54ODZfNjQpLiBIb3N0bmFtZSByZXBsYWNlZC4KCi0tLSB4SENJIHByb2JlIC0tLQpb
ICAgIDEuODQ1Mzc3XSBob3N0IGtlcm5lbDogeGhjaV9oY2QgMDAwMDowMDoxNC4wOiB4SENJIEhv
c3QgQ29udHJvbGxlcgpbICAgIDEuODQ1NDE1XSBob3N0IGtlcm5lbDogeGhjaV9oY2QgMDAwMDow
MDoxNC4wOiBuZXcgVVNCIGJ1cyByZWdpc3RlcmVkLCBhc3NpZ25lZCBidXMgbnVtYmVyIDEKWyAg
ICAxLjg0NTQ1Nl0gaG9zdCBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogaGNjIHBhcmFt
cyAweDIwMDA3ZmMxIGhjaSB2ZXJzaW9uIDB4MTIwIHF1aXJrcyAweDAwMDAwMDAyMDAwMDk4MTAK
WyAgICAxLjg0NTQ5NV0gaG9zdCBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogeEhDSSBI
b3N0IENvbnRyb2xsZXIKWyAgICAxLjg0NTUzM10gaG9zdCBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6
MDA6MTQuMDogbmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAyClsg
ICAgMS44NDU1NzFdIGhvc3Qga2VybmVsOiB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IEhvc3Qgc3Vw
cG9ydHMgVVNCIDMuMiBFbmhhbmNlZCBTdXBlclNwZWVkCgotLS0gSEQtYXVkaW8gRklGTyBlcnJv
cnMgd2hpbGUgcGxheWluZyBzaWxlbmNlIG9uIGh3OjAsMCAocmF0ZS1saW1pdGVkIGJ5IHRoZSBr
ZXJuZWwpIC0tLQpOb3YgMTYgMTA6NDY6NTEgaG9zdCBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAw
MDowMDoxZi4zOiBzdHJlYW0gNyBkbWEgZXJyb3I6IDB4MjgKTm92IDE2IDEwOjQ2OjUxIGhvc3Qg
a2VybmVsOiBzbmRfaGRhX2ludGVsIDAwMDA6MDA6MWYuMzogc3RyZWFtIDcgZG1hIGVycm9yOiAw
eDI4Ck5vdiAxNiAxMDo0Njo1MSBob3N0IGtlcm5lbDogc25kX2hkYV9pbnRlbCAwMDAwOjAwOjFm
LjM6IHN0cmVhbSA3IGRtYSBlcnJvcjogMHgyOApOb3YgMTYgMTA6NDY6NTEgaG9zdCBrZXJuZWw6
IHNuZF9oZGFfaW50ZWwgMDAwMDowMDoxZi4zOiBzdHJlYW0gNyBkbWEgZXJyb3I6IDB4MjgKTm92
IDE2IDEwOjQ2OjUxIGhvc3Qga2VybmVsOiBzbmRfaGRhX2ludGVsIDAwMDA6MDA6MWYuMzogc3Ry
ZWFtIDcgZG1hIGVycm9yOiAweDI4Ck5vdiAxNiAxMDo0Njo1MSBob3N0IGtlcm5lbDogc25kX2hk
YV9pbnRlbCAwMDAwOjAwOjFmLjM6IHN0cmVhbSA3IGRtYSBlcnJvcjogMHgyOApOb3YgMTYgMTA6
NDY6NTEgaG9zdCBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAwMDowMDoxZi4zOiBzdHJlYW0gNyBk
bWEgZXJyb3I6IDB4MjgKTm92IDE2IDEwOjQ2OjUxIGhvc3Qga2VybmVsOiBzbmRfaGRhX2ludGVs
IDAwMDA6MDA6MWYuMzogc3RyZWFtIDcgZG1hIGVycm9yOiAweDI4Ck5vdiAxNiAxMDo0Njo1MSBo
b3N0IGtlcm5lbDogc25kX2hkYV9pbnRlbCAwMDAwOjAwOjFmLjM6IHN0cmVhbSA3IGRtYSBlcnJv
cjogMHgyOApOb3YgMTYgMTA6NDY6NTEgaG9zdCBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAwMDow
MDoxZi4zOiBzdHJlYW0gNyBkbWEgZXJyb3I6IDB4MjgKTm92IDE2IDEwOjQ2OjU2IGhvc3Qga2Vy
bmVsOiBzbmRfaGRhY19idXNfaGFuZGxlX3N0cmVhbV9pcnE6IDMxMiBjYWxsYmFja3Mgc3VwcHJl
c3NlZApOb3YgMTYgMTA6NDY6NTYgaG9zdCBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAwMDowMDox
Zi4zOiBzdHJlYW0gNyBkbWEgZXJyb3I6IDB4MjgKTm92IDE2IDEwOjQ2OjU2IGhvc3Qga2VybmVs
OiBzbmRfaGRhX2ludGVsIDAwMDA6MDA6MWYuMzogc3RyZWFtIDcgZG1hIGVycm9yOiAweDI4Ck5v
diAxNiAxMDo0Njo1NiBob3N0IGtlcm5lbDogc25kX2hkYV9pbnRlbCAwMDAwOjAwOjFmLjM6IHN0
cmVhbSA3IGRtYSBlcnJvcjogMHgyOApbLi4uXQp0b3RhbCAnZG1hIGVycm9yJyBsaW5lcyB0aGF0
IGJvb3Q6IDQwMTM7IHN1cHByZXNzZWQgKHN1bSBvZiAnY2FsbGJhY2tzIHN1cHByZXNzZWQnKTog
MTA3NjkwCgotLS0geEhDSSB3YXJuaW5ncywgc2VlbiBvbmNlICgxMDo0ODo0OSwgd2hpbGUgdGhl
IGF1ZGlvIGludGVyZmFjZSdzIHByb2ZpbGUgd2FzIGJlaW5nIHN3aXRjaGVkKSAtLS0KTm92IDE2
IDEwOjQ4OjQ5IGhvc3Qga2VybmVsOiB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IFdBUk46IGJ1ZmZl
ciBvdmVycnVuIGV2ZW50IGZvciBzbG90IDExIGVwIDQgb24gZW5kcG9pbnQgICAoeDgpCk5vdiAx
NiAxMDo0ODo0OSBob3N0IGtlcm5lbDogeGhjaV9oY2QgMDAwMDowMDoxNC4wOiBFdmVudCBkbWEg
PGFkZHI+IGZvciBlcCAxIHN0YXR1cyAxIG5vdCBwYXJ0IG9mIFREIGF0IDxhZGRyPiAtIDxhZGRy
PiAgICh4MTApCk5vdiAxNiAxMDo0ODo0OSBob3N0IGtlcm5lbDogeGhjaV9oY2QgMDAwMDowMDox
NC4wOiBFUlJPUiBVbmtub3duIGV2ZW50IGNvbmRpdGlvbiAxOTggZm9yIHNsb3QgMTUgZXAgMSAs
IEhDIHByb2JhYmx5IGJ1c3RlZAo=
--000000000000044ef206606b23d5
Content-Type: text/plain; charset="US-ASCII"; name="measurements.txt"
Content-Disposition: attachment; filename="measurements.txt"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

QWxsIGZpZ3VyZXMgZnJvbSAyMDI2LTExLTE2LCBnYW1lIHJ1bm5pbmcgKEdQVSAxMzAtMTYwIFcp
LiAiU3RhbGxzL3MiID0gSEQtYXVkaW8gRklGTyBlcnJvcgppbnRlcnJ1cHRzIHBlciBzZWNvbmQg
b24gMDA6MWYuMyB3aGlsZSBhcGxheSBzZW5kcyBzaWxlbmNlIHRvIGh3OjAsMCAoSVJRIGNvdW50
IG1pbnVzIHBlcmlvZCBJUlFzKS4KIkJvYXJkIiA9IEFDUEkgdGhlcm1hbCB6b25lIFNFTjMuIEZh
biBzcGVlZHMgYXJlIENQVSAvIEdQVSAvIG1pZGRsZSBmYW4gaW4gcnBtLgoKVVNCIGNhcHR1cmUg
KHVzYm1vbiwgMzAgcywgVm9sdCAyIHBsYXliYWNrIGVuZHBvaW50LCBib2FyZCA4Ny05MCBDLCBm
YW5zIDU1MDAvNDkwMC83NDAwKToKICAyMzksOTkwIGlzb2Nocm9ub3VzIE9VVCBwYWNrZXRzOyBh
Ym91dCAyMiw3MDAgKDkuNSAlKSBjb21wbGV0ZWQgd2l0aCAtRVhERVYgYW5kIGxlbmd0aCAwCiAg
Miw1MjIgc2VwYXJhdGUgZXZlbnRzID0gODQgcGVyIHNlY29uZDsgbWVkaWFuIDkgY29uc2VjdXRp
dmUgcGFja2V0cyAoYWJvdXQgMS4xIG1zKSBwZXIgZXZlbnQKICB0aW1lIGJldHdlZW4gZXZlbnRz
OiBtaW4gMy45IG1zLCBtZWRpYW4gMTAuMSBtcywgOTB0aCBwZXJjZW50aWxlIDIyIG1zIChsb29r
cyByYW5kb20gYWJvdmUgNCBtcykKICBmZWVkYmFjayBlbmRwb2ludDogMTE0IG9mIDI5LDk5OSBw
YWNrZXRzIC1FWERFVgogIEhELWF1ZGlvIHN0YWxscyBtZWFzdXJlZCBvbmUgbWludXRlIGVhcmxp
ZXIgdW5kZXIgdGhlIHNhbWUgY29uZGl0aW9uczogYWJvdXQgNzUgcGVyIHNlY29uZAoKQWlyZmxv
dywgR1BVIHBvd2VyIGhlbGQgcm91Z2hseSBjb25zdGFudDoKICBmYW5zIDU1MDAgLyA1NDAwIC8g
NDMwMCAodmVuZG9yIGN1cnZlKSAgICAgICAgIGJvYXJkIDg4LTkxIEMgICA3NS05MCBzdGFsbHMv
cwogIGZhbnMgc2xvd2VkIHRvIDQzMDAgLyA0NTAwIC8gNDMwMCAgICAgICAgICAgICAgYm9hcmQg
ODktOTEgQyAgIHJpc2VzIHRvIDkwKyB3aXRoaW4gMjAgcwogIGZhbnMgNjIwMCAvIDY5MDAgLyA3
NDAwICAgICAgICAgICAgICAgICAgICAgICAgYm9hcmQgODEtODMgQyAgIDAgd2l0aGluIGFib3V0
IDcwIHMKICBmYW5zIDU1MDAgLyA0OTAwIC8gNzQwMCAgICAgICAgICAgICAgICAgICAgICAgIGJv
YXJkIDc5LTg1IEMgICAwIGF0IDEyOCBXOyBhYm91dCAxNi9zIGF0IDE1MyBXLCBib2FyZCA4NyBD
CiAgZmFucyA0MjcwIC8gNjA5MCAvIDYxMDAgICAgICAgICAgICAgICAgICAgICAgICBib2FyZCA3
OSBDICAgICAgYWJvdXQgNS9zIGFuZCByaXNpbmcKICBmYW5zIDQyNzAgLyA2MDkwIC8gNzQwMCAg
ICAgICAgICAgICAgICAgICAgICAgIGJvYXJkIDc5LTg0IEMgICAwIChhbHNvIGF0IDE1NCBXKQoK
Tm8gZWZmZWN0IG9uIHRoZSBzdGFsbCByYXRlIChlYWNoIHRlc3RlZCBmb3IgOC0xNSBzIGFnYWlu
c3QgYSBiYXNlbGluZSBvZiA2NC04Ny9zKToKICBpbnRlbF9wc3RhdGUgbWF4X3BlcmZfcGN0IDU1
IC8gNzAgLyAxMDA7IG5vX3R1cmJvPTE7IGdvdmVybm9yIHBlcmZvcm1hbmNlIHZzIHBvd2Vyc2F2
ZQogIHVuY29yZSBmcmVxdWVuY3kgcGlubmVkIChtaW49bWF4KSBhdCA0LjkgR0h6IGFuZCBhdCAz
LjAgR0h6CiAgUENNIGZvcm1hdCBTMTYgdnMgUzMyLCBwZXJpb2QgMTI4IHRvIDQwOTYgZnJhbWVz
IChkaXJlY3QgQUxTQSwgbm8gUGlwZVdpcmUpCiAgYWJvdXQgMTEyLDAwMCBzcGxpdC1sb2NrIG9w
ZXJhdGlvbnMgcGVyIHNlY29uZCBmcm9tIGEgdGVzdCBwcm9ncmFtCiAgcGF1c2luZyBhbGwgc2Vu
c29yIHBvbGxpbmcgKG52aWRpYS1zbWksIEtERSBzeXN0ZW0gbW9uaXRvcikKICBzeW50aGV0aWMg
Q1BVLCBtZW1vcnktY29weSBhbmQgTlZNZS1yZWFkIGxvYWQKICBTTUkgY291bnQgKE1TUiAweDM0
KTogMCBwZXIgc2Vjb25kIGR1cmluZyBzdGFsbHMKICBDUFUgcGFja2FnZSB0aGVybWFsIHRocm90
dGxpbmcgcmVkdWNlZCBmcm9tIDk4IHRvIDE3IGV2ZW50cy9zOiBzdGFsbCByYXRlIHVuY2hhbmdl
ZAoKU2FtZSBzaWxlbnQtcGxheWJhY2sgdGVzdCBvbiB0aGUgTlZJRElBIEhETUkgYXVkaW8gY29u
dHJvbGxlciAoMDE6MDAuMSk6IG5vIGVycm9ycy4K
--000000000000044ef206606b23d5--
