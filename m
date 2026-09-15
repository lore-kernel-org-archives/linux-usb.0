Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97633B969
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508904; cv=pass; b=IPIVCUuRzi58HZvjbsFuW5+ev5u4J9Iy9f/LWQxDJOP/Wc5hu87SlepDi6JS1J30Ssp8lncqBb8eRPv3Dv+OXq8eP76Ptb7TESc/Eq2UlsozCRAUgIvUD09NvtHbJAtHaqsXHQIrEudaHTNKnAUx6vLr6wgq3EX31rpNu8RNTlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508904; c=relaxed/simple;
	bh=nluMotzuvyfQBBacTu6S31Z8h47e2NGM8xSwwTJ4Byw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p0SfzXLZt9mPn2/A7fdEXvHha7S5rIB1mtfpgBKlQ3KKzM2dXIw2lNGT0uoCA4s85ODNBZEP9IO8wVOnjGAupC5HPaz3Nl3l2IM4U2DlUELbIUDTSZ7iEHbyev8Ci5D09d1wiNFfUscC56lgOWCgZY98gW3pH32R0Nm/DLspu7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGdTMq7o; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGdTMq7o"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so1204e87.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 14:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508900; cv=none;
        d=google.com; s=arc-20260327;
        b=IMt8vFCSDMXzzdBMkJJN/U0WNTX2LLb6p6PhHV3o3k4h0hISpcHs0CI2CwQIM1G+8l
         6nzKFCsi+XV7S18YMXGsI91B4R3br3mjhhojcyk6lnAzs5u+BjA39PJBrzy19EzUFcfm
         RADKsamc9pJthh+cRWU9DGN3T8VA/BP94FGyKrKG9mutG+hOKbosWPnN3+HPR2QruPYx
         khh9F4nbhZZS4l7TdjyEtB8Th7YStfYkqmusR9bQoD7e41+IlX2Xo5B1DqfhBdWQX6S0
         aiJVz+46yYvWbJxw5gdULPoqFwNX1WadL6fAOV7PhR99Sz09DeejTPPUsp1UD9LEWv0T
         sZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=raUcs9w8c8+49uR5r2LYZQMNRYVlzNMqviwksfE5cQc=;
        fh=pU6ey+KNMRLC7HAQLDh4XLOfoNkJrzBBX1iK5bYJRsI=;
        b=RSuCW83+wfM+9UytC9zTuVTeCRNst4wC8F85P79FpU9Y9aIHpg/jdggzZDPrsbVvgO
         GJ5lAcladOpny2TcjtsJvngjdv239CF+DnGedI66337uvWLUnsXcZpD1dlfvmW07RzG0
         6R0pwfLUqD729waZ3fd6hiTf6v753Npux0i+1ETFjFphzQb0mKdyC+Ji6FaRxRlVvNF5
         WW9htBn2adbjklQnvfGlcFkU3HsD5BKXwjIclGWEM0UJVYkp9DqnZ+QG0/F5XoISQlSv
         4613WOavJPrWmJrUT+4hBczlYiTFTHxEnJ4ReCwlX56H+HR2ZNE0IhM4yoUtVd0yNugT
         zXUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508900; x=1790113700; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=raUcs9w8c8+49uR5r2LYZQMNRYVlzNMqviwksfE5cQc=;
        b=tGdTMq7oKXnG3/1njwMTQbgon6HHu7ecruIq/cXtG5kWnPG/GxKJextdndTJDv+H6b
         kWA8WuxcNBN8xAHJLI9Iv4y9CnSRo77+Bi5oDwRf7qVKvA8QzxUEOshSPDsapTyOfePw
         s6shk9sTLHDrL4tZBhRAlJb7Rb9VUoo4LeixtS57kiLtWJ7YNy9sMSLABVXCNvrn+Tbm
         nr/38IUVCMwZzTnKMwGaLKi4SNoRZukDmbe/TWWA1JF0Cn5ZN2UxkwpBBbo1JYimyrHB
         MW2S9eobMCuEG4l371+1rB9qTdo+qXNdd4Usj5IU3lvy1AwGJmcgwgf/ktM4AlIHwl28
         oVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508900; x=1790113700;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=raUcs9w8c8+49uR5r2LYZQMNRYVlzNMqviwksfE5cQc=;
        b=thsfz0occAc6gFNrZf/jyiBoe/0M7xLKYCpxTw8e5xAFJ1K3ogVzNDEIrEhgLQ4RNy
         u4Em/rZ8uUVEzFR05EiPu7WXSXlGfsIbhrJqcQRZVJpboNIg/YNF+nSn0eybmCQeiFxB
         ZT2S7bl2MRPGttzbCtNZGEhT52EDUxIPcTFklkuYpJV5ypIryG1uwvO15UNvbTxKPixo
         YmBNyIC8S96iKzAvdzi5LEgA0wjXpitS36Q/8D4zo8+unB/pLbj2tpQOg0vje1IGKIod
         14SLSIz7TH7i23nz7IGc4llu1K0bCem3CdibIHywgpQf74/TajSlZsOPt9BK1saUx+KL
         FDhg==
X-Gm-Message-State: AFuF++kB6HBtLH3LyV4lNjLJBNbBed/KgdLjzBlJoUf6VMmkJqA69BQU
	YPAHcxguk/RHFVcqT4o1d0sCMfYP68uh6k3nJj7ldbOq9n4oAvkj5M/unr1A1i29lAgQlJgsQaQ
	GCa7GQOI0m2wDFxlkac2nXrVYEPkaWmJ6xtUaVHMtWL+lT+Ka/3rP0++Ix/8=
X-Gm-Gg: AYBFou1UlQcdEXOCsu2z4sUsXSxDNLLoVkH0ylBxsnVH51tg5SbCsTnuHpD79ZQsRLt
	i8blnWCcSvSNccep7jPDOuXj+GpIcb6Kfq/wekzxJSm1FAGBumQRAfJ1K81yLlXjcHSLZurQJqj
	pxAmdDSlo6Zp2KQm6lRPpPLLYN7Mhd9+nvRWKAXbrypglUNQn842QDM6Bdq136W4B2QDXlSPoIw
	MeQ8Vb4NVMKPm9tnCBEiA8X6oSSR+wNNGjtwrgPeH8Pf+2AOVwf0ASYCvwZV2mvBtsbatVK2PI2
	YnOMeokwh4WVxP/wCy1i5pGH6ZY+HnnU1SCLO12eowXHGfe0BcbPUGPsMICQHq3w2DqwvZfgGH1
	zfpV8uAQct2CVNd2T6Ll6HzNDDJxCf1zKeXcA4Y9uQw==
X-Received: by 2002:a05:6512:10d3:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b8b63637ecmr11095e87.8.1789508899845; Tue, 15 Sep 2026
 14:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabien Sanglard <sanglardf@google.com>
Date: Tue, 15 Sep 2026 14:48:08 -0700
X-Gm-Features: AcwNN1VuGnyCHTepEIAO5l1NopbW_fZljokOq-pQmZ58eTysaDiKJqRZdvFsTtE
Message-ID: <CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com>
Subject: Missing uevents after successful USBDEVFS_RESET
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

Hi,

I am investigating an issue where userspace processes using usbfs (such as
ADB) cannot reliably track device state across a USBDEVFS_RESET ioctl by
monitoring netlink uevents.

Repro steps: (Lenovo P620, kernel 7.1.6)
1. Plug an ADB device into your computer.
2. Open a console to monitor netlink events: udevadm monitor -p -u.
3. Send USBDEVFS_RESET a couple of times (i used adb_usbreset).
4. 50% of the time the event sequence is UNBIND/REMOVE/ADD/BIND. 50%
of the time, the event sequence is just UNBIND.

When USBDEVFS_RESET is issued via drivers/usb/core/devio.c, it calls
usb_reset_device() -> usb_reset_and_verify_device() in drivers/usb/core/hub.c.
Depending on the reset outcome, userspace sees inconsistent uevents:

Case 1: Full re-enumeration (descriptors changed or reset/verify failed)
The device is torn down and reprobed. Userspace receives:
  UNBIND -> REMOVE -> ADD -> BIND
Userspace processes monitoring uevents immediately detect that the device
is available again and re-open it.

Case 2: Reset succeeds without re-enumeration (descriptors unchanged)
The kernel unbinds usbfs/interface drivers before reset, generating a
KOBJ_UNBIND uevent. Because the usb_device structure is preserved and
usbfs does not re-probe, no subsequent KOBJ_BIND, KOBJ_ADD, or KOBJ_CHANGE
event is ever emitted.

As a result of Case 2, userspace receives an UNBIND ("disconnect") signal
and assumes the device went away, but never receives an event indicating
that the reset finished and the device is ready for reuse. This forces
daemons like adb to fall back to polling /dev/bus/usb instead of relying
on netlink/udev events.

Is the omission of a completion uevent after a successful reset without
re-enumeration intentional?

If not, would a patch emitting KOBJ_CHANGE (or re-binding/notifying userspace)
upon completion of usb_reset_device() be acceptable here?

Thanks,
Fab
