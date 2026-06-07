Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695D2C029D
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862576; cv=pass; b=cAWGecqzN01WBO1G2XGlpJuhs0lkf0A11hU9XUT40G6q/kFl8b5bBvm49N9bClwPhQROTTY+crmkCr9BChg1MSHVFH3jeUQr4mlBzhg18r1CZjGiKcoen8JyFZaZEYx4IGWvhWeQ750kibBzFjsZCM4/X0LBWJRyCn6KguvaMEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862576; c=relaxed/simple;
	bh=L1RFcqL8vRAyKTZto30+vbzpKHDqXRwqkhGpwhpgWl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAjkq93YHmmXOXokIVw/IiWyHw8iDrMEkBFx3koLbo0xOPLO7rMugt3CcJ4O2L+1DCTJj9KnRwHbs0lhyOWqUnklN+58xAloHnQmWp/HnrfdoR9YQu0uvjX89juCA9SCb6h7K+ECa/wAwUdZ/iYBu6JePvFT9AaHpKADgMNhd9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1olJ6LX; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1olJ6LX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-befee9e5ef7so402880066b.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 13:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780862573; cv=none;
        d=google.com; s=arc-20240605;
        b=V7XaNVdhq3PE+D4p8s6x19u6Mz/VEpBJw0vl99SsaV7TQ1+5tkix5fzdIItMNLBuG0
         2viuuPPHTThK+864MoMfkuizy3wvhh+3kOBO724SxztEJLiCwYyNdUwYEipMopNqXf7x
         e/ccFN0BDYBYcpu1peIDngRHdUqUa+euzKq1M1GZefIO7+5TVrkMyaTD8aGtfSR2WdvT
         TMcoDkcwZFv4RPbj+SG2anHIscfHPSIL6IaRnsuVaoeDwuozXzEoaB49QUKdhDeFJGsk
         1ojJoUeoaSNkffDF8QVZEinA6FPsw2oH9odF95IRwhY7uW00LKNnQpaXv04QN6A/d7Cn
         1ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yBKOaEFP0IcFSqeP1OnEhPRIPrS/lPM9h5REC0zmVcc=;
        fh=gn80QPcL6PRjKCfKCi3Cs3mQl69PK3JZz0FJtRChTOI=;
        b=Q94CX+nPWgLFdwwwkIT1JxryXr7hiQcutDGya0fpMLlMc5lhhJbDLyvBSgeFd5uEr0
         l9utpzSLseDk/eAsr1UaMPEMO8gpyjwkMIciJldBvAwiteYcaDSu6Vem+h8HwXmyLpuf
         qPQvryPSECGLClUPC82I67ikxQeX46fDWXicxdpuHyTlDvYypRDUNeGtAsLf3UkPQgzQ
         HeFWJv996n/B3BhU107dOTnUcSonqbK/kuSWsgeNiWCgDCHPP5yqazD4Uz3iQwUkaaCQ
         sN1okA6b84AkCHb/Gl548KNjiP4WyWl7RFjvENS+WamtnXb8CboQ/94oPicw6TBbv+Xu
         i9vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780862573; x=1781467373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBKOaEFP0IcFSqeP1OnEhPRIPrS/lPM9h5REC0zmVcc=;
        b=G1olJ6LX35qCEbQPHsC9y8rbNANKx1uyxRC4JlVeJTVcQp7Y6FpfKwJ1e40AQACrCY
         ca4uEtuOB3+eL6LgfEL4jqlyTHcQRhn1BePIQcWymxhGUlfeVIVl7PHK5kKfzIhz9nkI
         EK75YB+V5Cx3qYdV3Wx7xQIuY8M1MyhQUQMKp17DlyHg3NoK/2ROdydlY2mJTdzddonq
         2yHosdpVkUAXIUo5axLHpFscvN/W6vWYIsFGjl8quhyqgbPpJ3DZmZyvayD9TsRJRt3j
         AVjl/mj/7fAJue1F+iy1idaqjvBulvpsT2STL0AWjwSigsVnI33IPvl7NcyQdK/shw+N
         1lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862573; x=1781467373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBKOaEFP0IcFSqeP1OnEhPRIPrS/lPM9h5REC0zmVcc=;
        b=Ukx4Ke7t5t4tjnRuLVJEV63Qoxmo5EZKc7bHGRAz9NGOT1yuogSZe1d6n6GKzlN6yI
         JXCFZEyS3VM5uE4WvDpbuHcrTvRdME7ygPsgOit3c/xJyVRKTZBickWeaMJU0dewwanL
         HxhmMWEjObghsFV7YuDY3y46HQc43HRF3CVFM4Haf5VMPJhGAWC8qyPpXWDI8OpMcOtZ
         feq4LwriWs4T98HljGFrao66ZrOCzTGS/gfFaBusP/PQIyBgyZJ819vioqpzSgISh5pd
         qnrFZwi259rBwYIUK5BbZA28p+CTDfE7YVonWzvmEuJdQJAS2kOC+cNK9hlsCd//0b2I
         okVw==
X-Forwarded-Encrypted: i=1; AFNElJ8RoGcpD5ZLtePyDseEk8Eq3+rCxD4pL7dnoR7eesoq/PC1wpsai6eqLvPWEktwWj4Vinc8DfI4bn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzEU26YVhFYSAcZcJgpayNF2sGsM9WLRzInT24nM5IirJOH1n
	qbfO+wZxtM59u+40ALUp/pgv+LFDrqSbWAj1g12FJwAuGtYJYsLosv9rBAmHBimRAifCisCkfDP
	++z4hdm6jEFoON1WEuD4n7mD4XhnStxBRIYFP
X-Gm-Gg: Acq92OGovb48WNE0mXyjdYe3rF/ntoUJimvqzVRu5Q8FFxqD4q4052lNqjkIsceWAYj
	DNRdrsJgHgak8a/9Gb1sv/hAocdrR6lBV668bYG2E4GLpclMaJOV7yw9L8lJPLBBh7kSOplt3fr
	yXw+RaHfiaKeSOM3m6lr9Z96mZzWq/Dn1Igo5keYygD8UgSTkMgORW7z8l/HNp6oSjk/NZpL6Uw
	8BteZnyXz+aFxpxEvJMBMfEwVmJylFY9gCT/974qqlXPczdLnqSRYAH2EabnQBrBcUBPe5Qy498
	K0OXvyNVW+uDm1voIw==
X-Received: by 2002:a17:907:3fa1:b0:bdd:378:3f2a with SMTP id
 a640c23a62f3a-bf372d28da4mr540955166b.38.1780862573018; Sun, 07 Jun 2026
 13:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com> <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com> <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com> <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com> <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com> <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
In-Reply-To: <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 8 Jun 2026 01:32:41 +0530
X-Gm-Features: AVVi8CdAeeFC7M9odqAudTta1b23ySADb23WE1BVh4oW-RtTZab2dfDvSd6yc9Y
Message-ID: <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com, 
	sakari.ailus@linux.intel.com, katieeliu@tencent.com, 
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn, 
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com, 
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com, 
	bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like from all the testing both of you agree on 255 for the
request size. And as requested by Alan earlier, I will go ahead and
create the patch with wLength=3D255.

I want to make sure that this patch approval/merging process is smooth
and its easy for the other maintainers to grasp the situation. So it
would be helpful if you could look at this email patch draft and tell
me what you think. Let me know if I captured the details obtained
throughtout this investigation correctly (and also asking permission
for tagging both of you):

---

[PATCH] usbcore: Use wLength=3D255 for initial configuration descriptor
read to fix quirky firmware

Problem:

Certain third-party USB game controllers exposing (or spoofing) an
Xbox 360-compatible interface (VID:PID 045e:028e) fail to enumerate
under Linux. The device disconnects from the bus without responding to
the initial GET_DESCRIPTOR(CONFIGURATION) request, and the kernel
logs:

  unable to read config index 0 descriptor/start: -71

The device then falls back to a secondary Android HID mode (with a
different VID:PID), losing XInput functionality including rumble
support. The
failure reproduces across multiple machines, host controller types,
and kernel versions including current mainline and LTS.

Expected:

The device should remain in XInput mode and complete enumeration, as
it does under Windows.

Observed:

Linux issues the initial GET_DESCRIPTOR(CONFIGURATION) with wLength=3D9
(USB_DT_CONFIG_SIZE). The device responds to this with a protocol
error (EPROTO, -71) and resets to Android mode. Notably, the device
enumerates correctly in Android mode when the same 9-byte request is
issued for that mode's configuration descriptor, confirming the
firmware bug is specific to the XInput mode.

Investigation:

usbmon traces from Linux and Wireshark/usbpcap traces from Windows are
identical up to the point of failure, with no visible protocol-level
difference explaining the divergence. The root cause was identified
when Michal Pecio discovered via QEMU bus-level capture that Windows
does not use wLength=3D9 for the initial config descriptor request, it
uses wLength=3D255. This is not visible in Windows Wireshark/USBPcap
traces because Windows routes enumeration-phase traffic to sniffers
only after initialization completes. Alan Stern subsequently confirmed
this with a bus analyzer (with a different usb 2 device), and the
behavior has been verified back to Windows 95 OSR2.1 by Michal.

Targeted testing also confirmed the firmware is sensitive to this exact fie=
ld:

  wLength=3D9:   fails  (EPROTO, -71)
  wLength=3D10:  succeeds
  wLength=3D16:  succeeds
  wLength=3D255: succeeds

Fix:

Add a new quirk flag USB_QUIRK_CONFIG_REQ_SIZE which causes
usb_get_configuration() to use wLength=3D255 instead of
USB_DT_CONFIG_SIZE (9) for the initial GET_DESCRIPTOR(CONFIGURATION)
request, mimicking long-standing Windows behavior. The value 255 is
chosen since other devices with similar bugs may fingerprint the host
by checking for a specific wLength value. If wTotalLength exceeds 255,
the existing second full-sized read handles it correctly.
Proposed patch:

---
<the patch will be pasted inline here>
---

Reported-by: Nikhil Solanke <...>
Tested-by: Nikhil Solanke <...>
Suggested-by: Nikhil Solanke <...>, Alan Stern <...>, Michal Pecio <...>

---

Another question, in the guidelines I read the following warning:

> Be wary of your editor=E2=80=99s word-wrap corrupting your patch, if you =
choose to cut-n-paste your patch.

what do they mean by "corrupting" here? Does it just mean that if
there is a single line in the diff and word wrap causes it to go
multiline, the subsequent copy paste will mess up the patch because
the single line turned into multiple lines?

> detail.  As you can see, it is a request for a Microsoft OS WCID string
> descriptor (index 0xee), which this device evidently doesn't support.

Out of curiosity, how does Linux handle the case when a device
requests a Microsoft OS WCID string? What does it generally respond
with? If Linux doesn't respond with a spoofed Microsoft OS WCID
string, shouldn't there be a quirk that does spoof it to prevent an
enumeration failure?

Thanks,
Nikhil Solanke
