Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795727693;
	b=tnmAV7fKKS0SM4dxU7gLEMJn2NcXiclhBNjYk06xK3XhHWeDv1gKnENHM7mwfGnRtlqv
	 z4uKJcOY4j7HTYjetQvWL4kD1q99vY1y7E7T8wo8PDgoqeavEumBt5rHxLvMx7BPCV7of
	 zWVPKqUXejbxHVmWkuX05rNi5rrnkbyLgLIjQT9aHar+L7BNB8wYbUr13c0DQQiIifkrz
	 +DqlNctu72xjhDSYb+RrjM52l8WzkWGIdTJ2pg3C5WgKJMIVAl5pB8kYNr236e0rw4mg4
	 lEK45YG+5K+Xc9ZSUIHn21My3B/SRUsQBD70qK1I3SiW14r4ZOgNTP7QbL0y2/f/8pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:
	 In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
	b=NRahlUnAu2BMe18LZET4lyIq0+TDLwI9UNzGkqUBqY92FNfk2wl+dqr77x2gjrjptC2G
	 wpxo13IVWmYqcEqEW5/59HrSus/nhO4EJj6wXXjRbAVxEPYLo1NUdItsbVhLc98DZHx9T
	 vnI8NDixx22MiWTw4imvlx6G6ftwAoiylPsd27rIKpuxRMeG56ad3n5okTnIucr5FUIyL
	 L418/bpcOF5o/Nm+a5RJnHU1GGFv7OfQYylpuTkQtOvvEHl+WReWLfvs/V9VJI4g+g4r2
	 fEWWsAaUCe8Of00FYG9XjycIe5Zq5HFGrAgRXhFyb9+XO6NRZiiNNpTU4JnNg2mUEhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTDHDmtE;
	arc=fail smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB1C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTDHDmtE
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f02f04a426so59679065ad.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795727692; cv=none;
        d=google.com; s=arc-20260327;
        b=crByOwejrZ/Z+v1gqKpbhiUgW/hTSY297Bwa1nuWb484nyWjg8VuXPAScudVsvqlDQ
         Mpya8muNuRYADWABxlCsIXiZd3rAqCX6D8jhHdHrZ/qfFneWv0WWqk9JZY1fQ0S9hBo7
         pyFAVn/1aToB+TAwTvC6I/aH4g70I5HWNMVYhlxCas1UbMZ1UdI2x0lZ5mTOMHFZkMbd
         ukd4jtKxRlr19WYErBdq0sERrdHp7iI37rFZDg5xAXCRs6wjDHgyVXQ28L6AAYLCXd4/
         cqhlA4UObsBqy2H7mzEYVX4TXK7vBrOp1KD9vlIXeXTQSbPAtqQZRFSk4iXjflsN87y+
         04Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        fh=8PKdHDcuBWg8G9aaCVsvm0zVHBYD1WPYrDQJI+zZqGI=;
        b=BCBiBZAfVOWEPmQ6rBGIC/tpj4vXN+RcNZowyFdnILfBo9+yKhWnnhLfuDfFdBF6ly
         sPD7lq9zGlGMBCduhfTh1e55SQS2JZkJ55hXCi8Op67bV5mZcBEsv9qjSQuFg/gz/9c3
         CGAM09g49hZ2J8uZd6/myxEZmyQPXcet3srsJafIi70XqRaKuE0QEka2qPnt6UCXeV9D
         C77XubEswyHFhTNWavBLBQFZrq4GUkKnPyiRMhBnbaJulFrs2LSlPYq0HydHF+2Koev9
         r+PRJr9XlovFl4accUbZ/e1PKXvc9MD9XA8ERnXIIy6TAtpirDb4yGQGEnFBIJL98cU7
         7I0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795727692; x=1796332492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        b=yTDHDmtEIhGp/MlMHSfRdK7pgePUUr/nY8uCLVZk05+NWtqqGTm6L0OFmqluBZ49U4
         sKxJB3UdAWkrmvg2yAUejWQ2fh7pCXEAtcY2fOJe+/1b53OdvDvoWaGm37zHsSqjPjS+
         64+/4Hw0bO9pseEBTjjDWBlrsrYXdc40/JmrjQ3pS/V3nDa8saT95p2wfh+Pzx0TiMPV
         VnqzhyfHi6GrZasm1taY20q4HdLuWAVz+3DTXRvF0aiLiwEMXz8B2dMhjKYXbuSI/QiY
         pI1vYOWS/hFvpUXZ5cQjArK77E7J7U/zsohM2lj0J0Ux7ytKnyyyvq/MgjOc6essXYbd
         Y3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727692; x=1796332492;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        b=zjqVTDd9vHgHjWLm6TQD8gLI6gp35AFkaQEbRbhDoYMrdrsjLT6FEY4GLXOdet7xP3
         qpPlDxyFvXeda+4fACNypCWlt+I6Dr4YOtFsBgtcNZXHm1kMsNnZkS4XmLXn0BODCR1h
         niAjj7dixHLJbahBApCfrd92vafauyFti4ltiqxObcifS67m8btSCFQ9DT22nzvVHVg+
         xs3OHsPfWR7fuRrhP7Qun8vGXM6C1HJcdqcmAwuLHgf2jem+Wnqh2JPA9kSDQEMvwm1K
         lKgphhgjNqQaiWvjr7qxbXYsdAFRa5nr9Fw6CKBRydM5H8hIu92Al4P46mkB2aChqV4p
         rIVA==
X-Gm-Message-State: APuU4Z/sxpjr5dmvpw98gTEgKwhnlv9Z33xffhZPSoECo8Xx2V2K0anv
	sYd8vLRu/m3UbaND399bh8HFRqcEeAUrRGIQHT9yQssLCtpVyy0hJUZ9v/vhnIt2gOzjk+64jDz
	dqHNUOifuvdriQ8qeqFq0LbOQP89RKPTOa6po
X-Gm-Gg: AZFdTZcU8NtHdg6Ak95ezJXVB+bOts4a6hPlt6jMay2C7Vf1ubCJcEgnjPat5nq67LB
	jqjb7fHAHundvkpZwrLsOQlmEWLDTvYYrCWY9tN72Xa/HWip1ZKj8oCoGeks8AtLPI8mFLmXZiA
	0iNkD4cwKS9KZxXqkbC46EL/pKqJ5f38SUhbZCY+/Pew4x3NRlXgFcLqs/0cEqHDFQBMpbTh83x
	0AFNeg4lzg6p1juKM5RMo6ir1bZk9P2oxHQzhCUarAzKPtbkT2f8pupixeQsf+k7RHRS9W9vWtL
	bhaGRykbMamgPIS10IfzFt50YaJJGiapiczdR/VFvGRurwVmQcMvjQicfqFjImtzRgUmJh38xTR
	9Joa8AW9TbkZtTyTN4Qz0wyzAGFncNuAWsA==
X-Received: by 2002:a17:902:e5c5:b0:2ed:a96:8a03 with SMTP id
 d9443c01a7336-2f03f27e77amr206374105ad.55.1795727692234; Thu, 26 Nov 2026
 13:14:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 15:14:50 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: flv.giacchetti@gmail.com
In-Reply-To: <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <20261125203211.76029bf0.michal.pecio@gmail.com> <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
Date: Thu, 26 Nov 2026 15:14:50 -0600
X-Gm-Features: Aa3M54pqAbUFR54EeJrok3NlplyzTGh_qB0asFD2VpdsVTGnDkBxrS2IGMdtoOQ
Message-ID: <CACKiatdTKoyWu6gphWm1Zb8kF6pFBNfcN42zW7-sNMUdYvbDrg@mail.gmail.com>
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: linux-usb@vger.kernel.org
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	regressions@leemhuis.info, michal.pecio@gmail.com, oneukum@suse.com, 
	tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi Michal, Thorsten, and ALSA maintainers,

I reproduced the high-speed failure again after a Creative App reset on
macOS and captured usbmon from before plugging in. The following tests
used the same X3 (041e:3264, bcdDevice 10.90), cable, rear port (1-10),
Intel xHCI controller (8086:7ae0 rev 11), and stock Fedora
7.3.4-300.fc45.x86_64. The device enumerated at 480 Mb/s.

With the default driver settings, device and configuration descriptors
completed normally. ALSA then sent a UAC2 SET_CUR to clock selector
0x22 on AudioControl interface 3. The X3 descriptor gives this selector
a single input, clock source 0x21. The selector write and read-back
completed. A subsequent clock validity GET_CUR for source 0x21
returned -EPROTO. The next SET_INTERFACE timed out, followed by more
control requests. The key usbmon setup packets and completion results
were:

  21 01 0100 2203 0001   SET_CUR selector 0x22         success
  a1 01 0100 2203 0001   GET_CUR selector 0x22         success
  21 01 0100 2103 0004   SET_CUR sample frequency     success
  a1 01 0100 2103 0004   GET_CUR sample frequency     success
  a1 01 0200 2103 0001   GET_CUR clock validity       -71
  01 0b 0001 0004 0000   SET_INTERFACE (if 4, alt 1)  -2 after 5.08 s

With ctl_msg_delay (20 ms) alone, the write to selector 0x22 again
completed. Its immediate read-back timed out in that run, before the
first sample-frequency write. The -2 completions are consistent with
usbcore cancelling timed-out transfers.

With only skip_clock_selector, two consecutive hot-plugs registered
the X3 in ALSA, with cdc_acm still bound as ttyACM0. Clock-validity
requests succeeded. The first PCM playback altsetting advertised
48/96/192 kHz at 16 bits, but the subsequent 24- and 32-bit playback
altsettings returned only 48 kHz. The trace showed the driver
activating the first altsetting before querying the next one's range.

I then added skip_iface_setup. With both flags, all three sample rates
were advertised for S32_LE. I saved the following modprobe option and
repeated the unplug/replug test:

  options snd_usb_audio
quirk_flags=041e:3264:skip_clock_selector|skip_iface_setup;

ALSA registered the X3 again at 480 Mb/s. I played a silent stereo
stream through PipeWire at each rate and checked ALSA hw_params and
status while running. The hardware PCM was S32_LE at 48, 96 and
192 kHz, with no further USB audio timeouts in the kernel log.

One other symptom may be relevant to USB core. During the failed
probe, Unity's main thread was waiting in serial_show while reading
the Intel root hub's sysfs serial attribute. It proceeded when the
old device was finally removed, about ten minutes after enumeration.
The USB hub worker was still handling probe timeouts after physical
unplug.

These results identify a reproducible workaround on this unit. I
still have to test mainline, and I have no first bad commit or evidence
that distinguishes device firmware from host/controller behavior. The
earlier cdc-acm RFC remains withdrawn. Would a device-specific
snd-usb-audio quirk be appropriate, or would you prefer a targeted
xHCI trace or another controlled test first?

Feel free to reply here or contact me directly at this address. I can
reproduce the issue on this hardware, share sanitized traces and
descriptors, and test a patch or an upstream kernel build.

Thanks,
Flavio


On Thu, 26 Nov 2026 00:17:40 +0100, Flavio Giacchetti
<flv.giacchetti@gmail.com> wrote:
> Hi Michal,
>
> Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
> at high speed and cdc_acm binding to interface 1 as ttyACM0 without
> the rate-query errors. Audio worked. In a later 7.3.3 boot the same
> unit enumerated at full speed (12 Mb/s), so that later run did not
> establish a working high-speed baseline.
>
> The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
> USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
> the X3 disconnected and re-enumerated, then failed to answer USB audio
> sample-rate and mixer requests. On 7.3.4 the same high-speed failure
> also occurred with my experimental cdc-acm module loaded and the ACM
> interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.
>
> On the failing 7.3.5 run, the USB hub worker was blocked in
> usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
> get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
> showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
> control requests. For several requests, the next completion came
> about 5.12 s later with status -2 and zero bytes, consistent with
> cancellation after the timeout. In a separate 7.3.4 run, the Intel
> xHCI driver logged two "Event dma ... not part of TD" messages at
> disconnect.
>
> When the old probe finally unwound and a different rear port was
> enumerated, the unit briefly appeared as Creative 041e:6007
> ("X-Fi UltraDSP"), with HID and CDC interfaces and no USB audio
> interface. A targeted USB reset completed but left it at 6007. It
> later returned to 041e:3264 and still failed the audio probe. I
> have not identified what the 6007 state represents. Separately, a
> local WirePlumber rule forced 32-bit PCM and hid the output when the
> X3 enumerated at 12 Mb/s. Removing that rule restored 16-bit/48 kHz
> playback in that mode, but did not fix the high-speed USB failure.
>
> I then reset the X3 using Creative App on macOS. Back on Fedora
> 7.3.4-300.fc45 with the original cdc-acm module and without the
> experimental USB quirk, the X3 briefly disconnected on the first
> plug-in, then enumerated again at 480 Mb/s as 041e:3264. ALSA
> registered it and I verified active stereo playback with S32_LE at
> both 96 and 192 kHz. There were no further USB errors after the
> successful re-enumeration in that test.
>
> This is one successful test after resetting the device. I have not
> isolated a bad kernel commit or reproduced the issue on upstream
> mainline. I can provide a sanitized USB trace and kernel stack. If
> it recurs after the reset, would a good/bad usbmon comparison
> starting before plug-in help distinguish what happens at the first
> disconnect?
>
> Thanks,
> Flavio
