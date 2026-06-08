Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028B1624DF
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 01:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881885; cv=none; b=L/3b1mNk7trHM7Py7iRKmaGTh2a9+NPvqRYQ/07Kp3Y1izKW6lJzUVyk4fTszf9jacoZp3VLdNPqkD3oevcAZZzEXmXvUQRxy0PrCEHj3+dp+gxsGqYuqwHJuHSJvaBxfY7JfMT1bmyDxAoZRlYntQMJ1SgvxQI6NA7+Z6NZmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881885; c=relaxed/simple;
	bh=kPRtF+QLQhHq/rylhWUhPm/vPAUCbkrDyAj0l0ntt/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNs+a3sdm2QmY3AoljLmIbNoZT35XjhdlwF6l2Dl+ErdLnRvkQPn6Qgn+VMFTwPAdcpR828sHfjI5ip3lfSJcz3MqL4ugVVxOIAoF6uX09uYIZ2UPE4L6ZSsFaF6u0BUeY9XfQxoQtRfrRK1iczeM24RzDXOz1dHvwDBRUdG5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M9PQw1qV; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M9PQw1qV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5176465a4a4so55197671cf.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780881883; x=1781486683; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0/znkz2sIZ5QC90aWON2MB4ZpAJgLBFmF+punYlEKA=;
        b=M9PQw1qV4wXXjB69DdpluY80dy/8zDZHCyucxKx62BboIjZrZv4OkvOCAFu5ascv8l
         vMXHRzsdq4tRBHPvOsfsYQ3aMPUcJthy4HHfSgtFyCcZE/gHvm9IxcSvO2ot2slGPRGm
         SBxhoAsg66Cxeh7i1+jVGD46N+UtsRDBpK4iWWPCScoMLoN59Gl0Rrz5Q5UuM/HswbZo
         H9mPWp7O0fc7ppq3HPwITPdkNCfaL9g3/J6Q+yOhnaXI8WWijMxArQkm3i1SH6MIIemV
         dIGdJsrpyMvniZeApgDul8RNJK3Bzk6JgVwWbrFgycZ/kY7RscGQGmDM0N/4+NKGPZN5
         unJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780881883; x=1781486683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0/znkz2sIZ5QC90aWON2MB4ZpAJgLBFmF+punYlEKA=;
        b=KaB3kuRvB5gkAxKXDOSp6Z17uXDRMHw1FT6/czeOFmgdZVbKQxisBLGkxH33iQaNr2
         6Mg0lsEBv2LjJbVn8Tpc09jl6GD52xNPL73c/kcMioBAb8OzHKsNMjjnx9Sj0J49QXwi
         NVYornA5fkTOanxKD2xtj+njdM6AM29Z/ZXkZIvMyK8MvfBb48/WEpkb4uPxf8D+u1ew
         7zBsa8XNZU0TGPNjXyqTRII+C82eyB37W3YIWkccsNTf8viSOMdMqieVm2KhDh6noG5W
         2VfCy0KCCcVcbe7o3LkspTQvj5YU7ZBB22518FNrFfEUKA7tRADTkPUthZj5xCNykE2j
         f+Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+0Sb9V/yrLqNy4F8RAWGE+8n1mBnLKdPhZzqh02MrEfuQ7cIojB8c/XJ9py1lcBqfEj3r7MGohffk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YPpQO3JRttHFhMl18L0+KJWK0iWvJ05MRhz4LtrRQyYYGJeb
	siUuGMdvdIVfUwYQa4YefE26sdLbVp2QJgpadUCMdDL3Gkj4eBk50NkzpXysa/VVrw==
X-Gm-Gg: Acq92OF2IDXVqXJxOVnxPFxXr4TBr6+69+quA1COrU+kXpcwtSviyhlZmBxRDvE9l8P
	275IXro1jUMVR7usQopzhL6wZzbyF55yho7jF9Tz3FmfS3BCK5glXk4htF0t4SanIsyifMjdLR6
	QdzSqe+/Cvkczm6nqWBEH7YgBVLE7PjP9tKSgKVx+iReITLS63htntNl8pFRwvv1uo7kqD9cO35
	KB6nMhB3onVlhxc9a+1+L5sBOHLYif73rVHQesAIYnnsgdPwz+dqmvVI5aVu/vOrVUu1GtjUEG+
	Fk5g0HjOs/YW4ddPD20TyNou1y0jX2I3oIFErs3uzRz2Z5kpvhWYgpKgWF0har3a3/VrSShk6GS
	dTXrvpIfoqmW3bjUCVBYsSSwtbp2xZO4l4ylihfNrTjNzcBWAQRsIahSFZFYy5B24wPdvQER3CB
	P9Cv7EhNiI9/BlvHamI+0RLjIulJ+yr+/qF0TWzetVeYt+K6axOQFUmw==
X-Received: by 2002:a05:622a:2b45:b0:516:d557:15bb with SMTP id d75a77b69052e-51795cb176cmr211332461cf.46.1780881882636;
        Sun, 07 Jun 2026 18:24:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d8100fsm141660061cf.14.2026.06.07.18.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 18:24:41 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:24:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <45f91c9a-e4d5-44e3-a0d1-9727806aa00d@rowland.harvard.edu>
References: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
 <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
 <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com>
 <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com>
 <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com>

On Mon, Jun 08, 2026 at 01:32:41AM +0530, Nikhil Solanke wrote:
> It looks like from all the testing both of you agree on 255 for the
> request size. And as requested by Alan earlier, I will go ahead and
> create the patch with wLength=255.
> 
> I want to make sure that this patch approval/merging process is smooth
> and its easy for the other maintainers to grasp the situation. So it
> would be helpful if you could look at this email patch draft and tell
> me what you think. Let me know if I captured the details obtained
> throughtout this investigation correctly (and also asking permission
> for tagging both of you):

You can see tons of examples of patch submissions just by looking 
through the mailing list archives at lore.kernel.org.  Basically, if you 
follow the same patterns as them you'll be okay.

> ---
> 
> [PATCH] usbcore: Use wLength=255 for initial configuration descriptor
> read to fix quirky firmware

The title could be tightened up a little bit.  For instance, you can 
write "config" instead of "configuration", and "for" instead of "to 
fix".

> Problem:

You don't have to be so formal; a patch description doesn't need to look 
like someone filled out a form to report a bug.  You can leave out the 
"Problem:", "Expected:", and so on.  Just explain what the problem is 
and how the patch will fix it, in plain ordinary English.

> Certain third-party USB game controllers exposing (or spoofing) an
> Xbox 360-compatible interface (VID:PID 045e:028e) fail to enumerate
> under Linux. The device disconnects from the bus without responding to
> the initial GET_DESCRIPTOR(CONFIGURATION) request, and the kernel
> logs:
> 
>   unable to read config index 0 descriptor/start: -71
> 
> The device then falls back to a secondary Android HID mode (with a
> different VID:PID), losing XInput functionality including rumble
> support. The

The text should be wrapped properly, with no short lines like this one 
in the middle of a paragraph.

> failure reproduces across multiple machines, host controller types,
> and kernel versions including current mainline and LTS.
> 
> Expected:
> 
> The device should remain in XInput mode and complete enumeration, as
> it does under Windows.
> 
> Observed:
> 
> Linux issues the initial GET_DESCRIPTOR(CONFIGURATION) with wLength=9
> (USB_DT_CONFIG_SIZE). The device responds to this with a protocol
> error (EPROTO, -71) and resets to Android mode. Notably, the device
> enumerates correctly in Android mode when the same 9-byte request is
> issued for that mode's configuration descriptor, confirming the
> firmware bug is specific to the XInput mode.
> 
> Investigation:
> 
> usbmon traces from Linux and Wireshark/usbpcap traces from Windows are
> identical up to the point of failure, with no visible protocol-level
> difference explaining the divergence. The root cause was identified
> when Michal Pecio discovered via QEMU bus-level capture that Windows
> does not use wLength=9 for the initial config descriptor request, it
> uses wLength=255. This is not visible in Windows Wireshark/USBPcap
> traces because Windows routes enumeration-phase traffic to sniffers
> only after initialization completes. Alan Stern subsequently confirmed
> this with a bus analyzer (with a different usb 2 device), and the
> behavior has been verified back to Windows 95 OSR2.1 by Michal.
> 
> Targeted testing also confirmed the firmware is sensitive to this exact field:
> 
>   wLength=9:   fails  (EPROTO, -71)
>   wLength=10:  succeeds
>   wLength=16:  succeeds
>   wLength=255: succeeds
> 
> Fix:
> 
> Add a new quirk flag USB_QUIRK_CONFIG_REQ_SIZE which causes
> usb_get_configuration() to use wLength=255 instead of
> USB_DT_CONFIG_SIZE (9) for the initial GET_DESCRIPTOR(CONFIGURATION)
> request, mimicking long-standing Windows behavior. The value 255 is
> chosen since other devices with similar bugs may fingerprint the host
> by checking for a specific wLength value. If wTotalLength exceeds 255,
> the existing second full-sized read handles it correctly.
> Proposed patch:
> 
> ---
> <the patch will be pasted inline here>
> ---
> 
> Reported-by: Nikhil Solanke <...>
> Tested-by: Nikhil Solanke <...>
> Suggested-by: Nikhil Solanke <...>, Alan Stern <...>, Michal Pecio <...>

These tag lines belong before the "---" line above.  Not after the patch 
contents.

Also, as the patch author you have to include a "Signed-off-by:" tag 
line.  And as a result, the "Reported-by:" and "Tested-by:" lines aren't 
necessary; the default assumption is that the author did the reporting 
and testing.

Finally, since this fixes an actual bug, you should include a "Fixes:" 
tag and a "Cc: <stable@vger.kernel.org>" tag so that the patch will 
automatically be applied to the -stable kernel releases after it is 
accepted.

Aside from these issues, this will be fine.

> 
> ---
> 
> Another question, in the guidelines I read the following warning:
> 
> > Be wary of your editor’s word-wrap corrupting your patch, if you choose to cut-n-paste your patch.
> 
> what do they mean by "corrupting" here? Does it just mean that if
> there is a single line in the diff and word wrap causes it to go
> multiline, the subsequent copy paste will mess up the patch because
> the single line turned into multiple lines?

That's one possible type of corruption.  Another is converting tab 
characters into spaces or vice versa.

Essentially, if either your editor or your email client changes the text 
of the patch to be different from the way you wrote it initially, it's 
likely to cause trouble.

> > detail.  As you can see, it is a request for a Microsoft OS WCID string
> > descriptor (index 0xee), which this device evidently doesn't support.
> 
> Out of curiosity, how does Linux handle the case when a device
> requests a Microsoft OS WCID string? What does it generally respond
> with? If Linux doesn't respond with a spoofed Microsoft OS WCID
> string, shouldn't there be a quirk that does spoof it to prevent an
> enumeration failure?

Devices don't request these WCID strings.  The OS requests them and the 
device provides them (or returns an error if it doesn't support them).

Alan Stern
