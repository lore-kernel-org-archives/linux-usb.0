Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DAD3C5DC5
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938879; cv=none; b=h/Qgd9/cQJDSw7pkaLp/SXiS62/uUI6KjOWHi5APGZna1tM0J6OH+i7CoM5gafWQ0R7vnCXowibERzN8RWOkGs/U/lHSBwJchghiRcRaRtr9cnSFvqXV9akNEOOXKOKb/G7LMHSKJ2oLipeMl5pzKDOA2ef+/OLYwFJ4L62Ier4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938879; c=relaxed/simple;
	bh=XZi511PqZprMyFi1XP7qILISSNX1tU1ncsOdgRoh4/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To; b=ThjVoZBMWO0uFb9RMtvX4JIuq1nrcH+Gb3fQ7eMIDS5NoDvVWx+mh8BKrruPtIurg9hruTNPfhwX6P2XKFM8kqOgGhHW6DRQuuuPdM4wjmwNPTmESYQbT+M5IGY9L/OjMgtHeb8wdGiRAmn/H1LonEsfmYEYuTV3TuS3FDnyk4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhDQOH1e; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhDQOH1e"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1990290a91.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938877; x=1790543677; darn=vger.kernel.org;
        h=to:from:cc:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADMTsZ1OUY/8FESWFtVP3Myx8n13Fc2DdH55tYJ3tmg=;
        b=VhDQOH1e/0xFSqM+ca61iGJYtZGk3GzeFI1IuwuQuz+OBxavnMK3FqmhnA1GHyURvc
         mQ3wc3MPtsq+M1cmlEEQzyIN+8p0+fiZdrWcBH519rDwoKX/yee0AaZ1slB2qy/cOPTh
         EXVhk3zXKXZyuMgEUNj6zQ6aPPd5n6FHE290HYJxUkTVpPz0+/YPkfJ/rce5PrM9LjBX
         ha/FxzaT+QDSvxaRx1MqgFeFN0XE2cgNAh0VMt/UvKvCd38xALL+3dbLJmocV36DmDw8
         HpTFSaVkXSwQ632U1YNreEpJcdxj+jvZ36uj8JvH8oAkSzLdR8VlxCg1EQ3e/ToP7Rqm
         3kPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938877; x=1790543677;
        h=to:from:cc:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADMTsZ1OUY/8FESWFtVP3Myx8n13Fc2DdH55tYJ3tmg=;
        b=rEJLhPuZNKAm6gEUNBlzw9InZv1RPrBnAYzefjuykyjq/TyQwpoD7G+VlJfQ7FkICZ
         JAxP8A1l+NTxEVEwqHWtyKuzIB1bk0A4aBvs31vsKQwPVExYV2+9f6UDF8xU9vQ44xy0
         Bpkq17E5CNgK4zzyodROzWI2/9YVprT6//imKYWVmmB+ZrOytNYgPQ/UdoepkwZlJtsZ
         mpz7aczcGYBbaEbVqO4osZTCC20yl5ukv+siFhfjfkZa7CIZlK5id7zS6YTlbkbaMsSw
         GukXHXqp1SuZ2l8V9cc/+JUrnTe4u2oeonZcdPw9mrBLlc7M6+l1Q2V9DlCUORLiID2e
         nxsQ==
X-Gm-Message-State: AFuF++nIS82F8/HCukKPiSdm0UR3zeu2P/v1mToojVPEPxxx7DRSLhau
	NURtj2ys26ea37br0CfzTs1TaWif8VfQ7sCkAqeXiaM6xvQ6vKZ4S76P7gpdQTwrcLc=
X-Gm-Gg: AYBFou1lVVB9EqFgMDQGHGETsC2sUcR3lbfl7riJIR0YlUaOEwWPKFSuCWgP9kXRGKv
	xEcCv8U3PsbPGMtOR4VTu7KeyE11u8AH+2xnKf1BF/rcD48doO93L9EAC5dfQbrlbgHsWAT05d7
	oI676BMYg2R7LH1u1WlMliERXQR2tcICMz9ZsnJazHih6RIkG4q8mf5/wIwgbX/BYz7oU63IC7Q
	WtyiePAGmXfEh7JxKA+oEDVhdb7m7Cd9fN/sI3ByCkJjdsI+Ybtaqw23DZ3oYMiyTKmwW2ccNaW
	Dsjr0hZoOLvMexQouXDFSzklvpsiOdIg4boo7terZxeFVM/k3blTw/Ct6iPvuXQxUsxewQveJIm
	E+lrwcEbD36IxaBJ6ewzSMpJ+A4XrRhuLZKAzlgQ81t2FNr6pUA7DrBpY7ePWBtiEAUSqDz6tfe
	Bwbq/arqqdL5kuPKTYvEOcuIqfVJX/uc7djlJ1v3eUSo9theqi5qY56OqqLiH6HeDvz9Aw0v0fr
	CUNIW5GC5wJ8MDmcpe6W9Jwccl592aS
X-Received: by 2002:a17:90b:55cf:b0:3a0:516d:9f7e with SMTP id 98e67ed59e1d1-3a0516da732mr179082a91.45.1789938876990;
        Sun, 20 Sep 2026 14:14:36 -0700 (PDT)
Received: from localhost (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm22049842c88.5.2026.09.20.14.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 14:14:35 -0700
Message-Id: <DLKGDJMA0NY6.2C34FXZUHFK7C@gmail.com>
Subject: [RFC] ALSA: usb-audio: Blue Yeti 046d:0ab7 fw 0.20 capture fails
 until device-side MCU reset
Cc: <linux-usb@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>
From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
To: <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

Hello,

I'm encountering a reproducible capture failure with multiple Logitech/Blue=
 Yeti
Classic USB microphone and wanted to ask where the best place for this
workaround to live, as I feel it may belong in snd-usb-audio instead of
userspace but wanted a more experienced opinion.

Device:=20

ID 046d:0ab7 Logitech, Inc. Blue Microphones
bcdDevice: 0.20
USB Audio Class: UAC1

System:
Linux 7.2.6-arch2-1 x86_64
xHCI
snd-usb-audio

When booting with the microphone already connected, USB enumeration
succeeds normally. snd-usb-audio binds, ALSA creates PCM device, and
Pipewire also sees the microphone.

Example:

$ arecord -D hw:Microphones,0 \=20
      -f S16_LE -r 48000 -c 2 \=20
	  -d 5 -vv /tmp/yeti.wav

Recording WAVE '/tmp/yeti.wav' : Signed 16 bit Little Endian, Rate 48000 Hz=
,=20
Stereo arecord: pcm_read:2285: read error: Input/output error

The same thing happens at 44100 Hz.=20

I tested a couple recovery methods with the device in this failing
state:

- 44100 Hz Capture      -> EIO
- 48000 Hz Capture      -> EIO
- host USB reset        -> EIO
- USB unbind/rebinding  -> EIO
- device-side MCU reset -> Capture works immediately

Digging deeper, I tested an existing blue-yeti-autoreset userspace
utility for this exact bug, which sends a UAC Extension Unit SET_CUR
Request:

bmRequestType =3D 0x21
bRequest      =3D 0x01
wValue        =3D 0x0a00
wIndex        =3D 0x1900
xLength       =3D 8

payload =3D 00 09 00 00 00 00 00 00

After this is done, the Yeti will disconnect and reenumerate, with my
system having the device change from 002 to 003, and arecord begins to
work normally. Physically unplugging/replugging the device also does the
same fix.

At the end of the day, this looks like a firmware issue with the=20
Blue Yeti, as USB enumeration and snd-usb-audio are working as=20
intended and succeeding, but some internal device state survives=20
host-side USB reset not allowing the capture engine to operate,
with the device-specific MCU appearing to be the cause.

With there being no obvious xHCI disconnect or USB transport errors in
the kernel log, I'm left to assume this a quirk within the firmware of the
microphone itself. A couple other Bugzilla reports I found seem to show
the same issue I'm reporting here, with Bugzilla #220238 showing a
same bug I'm describing.=20

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

My main question is whether the kernel should work around this in
snd-usb-audio or whether maintainers would prefer the device-specific
reset to remain in userspace because it intentionally causes a USB
disconnect/enumeration.

If a snd-usb-audio workaround is considered ok, I would be interested in
working on the patch and can test it reliably.

Please let me know if any additional usbmon traces, dmesg outputs or
other diagnostics would be useful.

Thanks,

Jazz
