Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B733AD506
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932407; cv=none; b=NIEP80HzEwymr5SK3QPbEMT7lDjHb7d8ig6ftpQktLjl7iw1reQ40uyOoh0eZbaezbTiA4a2vnak/8SxCVAJ01UZXoeGB+XuNfdQ2UNsc1g8LwNhsaLo0GVUIKLN8bEvgwi/dMu3biZViogP/irKVGZWAo3T14YRh/r70h2fjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932407; c=relaxed/simple;
	bh=Awk4gHStXNe+SsdJMWe6V5mysupa7InsP5iDVSNe7UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2JlPo6yF5zZZ2M9zlPx1bdM884vsHQ1sCCZcHvfb8EV+3is3DlXhw9m6DTcnENu+jAddEeQmMRYs8SR5X/1j024yZLL5T3C/1lOGB8XhcRkD9XFfDPihuc0m1P7G0lfuq/xmRMAGDwGWFm6kkjVe19v6Qct9cDTy7NbZCYkiAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Hbu127ub; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Hbu127ub"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBA773F181
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783932402;
	bh=K2Yp4b4cielWvPpIJjqJ9dpzfqVERB7QaLNXPsZ17c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Hbu127ubDkya+41SajFNiLU9aAPipBunMbK5Lg6G8gS31t88skshp7EOg1aaR3Zv1
	 XyilHaqH5IIfyJDlV2EWQjsD97WksZsnGGjTVevur9lihTSgpB6fcgVp78TSFzlMNI
	 4xeiMobA+wxZ542eB8RseYvQQXZ16PxJ8eXCKyEisNne+3F46oNe69sCGN0JevdHCk
	 cAwy7IvwF9DCOOgoxgKT+s0+Y8w38HaT6058HXgUZr3F8hx5+g5f7EcE23OSWYM/Mp
	 hv0cFx1LV/5rbS5tLIFUooW83VfG4jlTf2CwnuB1G+Mo+C8HprksjjOeoudzvnNZRq
	 +20ZIAS6BnKnEknJcnlt7+YYCSpAXa8Ngp6F2NFpb5g8bbRFG60AhspBEwr7V1BHbx
	 W1Mas8O29NISjwQdxZSrovpTad7WHcXTbndcWna/ROzkjfhwRaDZFS3g3aY7js/EtP
	 ZDZQSF6X8jpZcl3c+gh7x57QQ2bXZI34RQ1qS8wVmCa6TnXBZG8GGB8X04p4Sk4FYG
	 +FjdwMVCAfY7BklUY4LAdgNxQG8wCWwj1A4pGZjzGzdEVt/BYsBgbsRYJu5YzdHPyw
	 1W0CrzX+gEP4pNm4cToa4WD1jP6lEj9udXEhjKvIoKe+qNR21R6pFDUo+kk+pbZjvY
	 hnPhqIaJMlMLMXzV/2UHyBKw=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso66982665ad.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 01:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932401; x=1784537201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2Yp4b4cielWvPpIJjqJ9dpzfqVERB7QaLNXPsZ17c8=;
        b=Qfph0MfSR7YY8EeESypYGv28ccV4oZ4K6/IuAYzZt+ps3t5goxzuw+a3NHDW31GQVq
         RX7wcF5TjuCjuQ3snF1yUkEYYaXjthax127US1p7UpegiJzzangw6Dpjya4mYq/VrC6e
         ZMF5MC9vjMRZyQ6BR2KUQRCdWXjURIX7Ycf98hxNmtz+p7/lIzWqEE5bx6tVvEl/Nu0a
         2Oqg3GavfO93FMFj91SKnJ+mQ1+n1azgUMyXgvfBsrPBbLDmFOVBy8kL12zxuhYHWkuQ
         y08O5Cg2H6E+2DmirlOUhOFJJ/oEs4eNCJT8L22OFF7CONWQbEJUK4flubmc6dHegNuE
         Frew==
X-Forwarded-Encrypted: i=1; AHgh+RpXNflywTv+6zqk7eQ8NJCBJeja9fbLDyL+YizOEbTNdt4QztUUI8YVN2GFpYkfzYGz4fBodU73lPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCgAwa5fkt/upmeW6CWnxQMEo4YaoNSXGR+5rMm8r2YAJxdAX
	Jzpe1GZ3VV/ZtdMwWk4MH5m+YobR6lulGA/proW4968t8vXLVJ/+A+cwUqZ481kgU2yYi18CnfD
	f5zhalIacVrDm3Ommy7ownlAh9yBZD7DBaNJfyGaa1MqfKQipROxHeOWggkNRskLsdV4LIzdfVx
	JkXg==
X-Gm-Gg: AfdE7cknTaoTBBsSQ7eCahxr1nWf30haFfxIDTD95fFSsGQ+4nTKOsDVaQy9GY9eoJ7
	ntuHaG8Ow7caXB37lhgut43cEPMbndyEgyhiCfL7ZaejdUmnwK3O0d+RavAWTAt0VWQbOP+dsNH
	iLK7a/lJJtE2ByskUuDrzyOpGB1bKqcpxk6SpgxtpGahBTmru/83z4M7RaTsXIckK7eZaUJuuL5
	wksZAmbGz6HdSUjaVhn+gIp4YHkmipAFwfegd//j5jdpAlioc79m4D8TKDTM6uErDHpEQjZa3+7
	pQy3PbZ4Ryl89snIhgyDplWsZuhOYj0fO2YK3XjXYGlseALCMVmzQRcnSaPwJPtWv1rRwbkSuZT
	En6qx3PCiOGZF608uRl0Sr+mCLv73k9jNJ2QynvdNm6v9E7GXMSuPTF2GJ5VVZ5lLyVo=
X-Received: by 2002:a17:902:ebc4:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2ce9f16db14mr78552365ad.41.1783932401500;
        Mon, 13 Jul 2026 01:46:41 -0700 (PDT)
X-Received: by 2002:a17:902:ebc4:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2ce9f16db14mr78552145ad.41.1783932401131;
        Mon, 13 Jul 2026 01:46:41 -0700 (PDT)
Received: from acelan-Precision-5480 (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce8217a64bsm49494215ad.13.2026.07.13.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:46:40 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:46:35 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, bleung@chromium.org, 
	jthies@google.com, myrrhperiwinkle@qtmlabs.xyz, pooja.katiyar@intel.com, 
	abelvesa@kernel.org, yuanhsinte@chromium.org, johan@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <alSlvJKufAMp4zde@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Greg KH <gregkh@linuxfoundation.org>, heikki.krogerus@linux.intel.com, bleung@chromium.org, 
	jthies@google.com, myrrhperiwinkle@qtmlabs.xyz, pooja.katiyar@intel.com, 
	abelvesa@kernel.org, yuanhsinte@chromium.org, johan@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612052112.1325812-1-acelan.kao@canonical.com>
 <20260612052112.1325812-2-acelan.kao@canonical.com>
 <2026070844-hermit-postwar-9b7c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026070844-hermit-postwar-9b7c@gregkh>

On Wed, Jul 08, 2026 at 01:45:32PM +0200, Greg KH wrote:
> On Fri, Jun 12, 2026 at 01:21:10PM +0800, Chia-Lin Kao (AceLan) wrote:
> > Some firmware implementations incorrectly return the same altmode
> > multiple times at different offsets when queried via
> > UCSI_GET_ALTERNATE_MODES.  This causes sysfs duplicate filename errors
> > and kernel call traces when the driver attempts to register the same
> > altmode twice:
> >
> >   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
> >   typec-thunderbolt port0-partner.1: failed to create symlinks
> >   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> >
> > The matching rules differ by recipient:
> >
> >   - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
> >     Two altmodes with identical SVID and VDO are byte-for-byte
> >     duplicates and the second has no observable function, so drop it.
> >
> >   - UCSI_RECIPIENT_SOP (partner):
> >     The typec class binds each partner altmode to a port altmode of
> >     the same SVID via altmode_match()/device_find_child(), which
> >     returns the first port altmode with a matching SVID.  If the
> >     partner advertises more altmodes for SVID X than the port
> >     advertises, the surplus partner altmode(s) collapse onto an
> >     already-paired port altmode and trigger the
> >     "duplicate filename .../partner" sysfs error during
> >     typec_altmode_create_links().  Use the port-side altmode count for
> >     SVID X as the authoritative cap and reject any partner altmode
> >     that would exceed it.  This preserves legitimate multi-Mode
> >     partner altmodes (vendor SVIDs that the port really does
> >     advertise more than once) while filtering the firmware-generated
> >     duplicates that have no port counterpart, and is therefore
> >     stricter than a plain SVID+VDO comparison (which still admits the
> >     Thunderbolt case where firmware reports the same SVID twice with
> >     different VDOs) without being over-broad like a plain SVID match
> >     (which would falsely drop legitimate vendor multi-Mode entries).
> >
> > If a duplicate is detected, skip it and emit a clean warning instead
> > of generating a kernel call trace:
> >
> >   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring.
> >   ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001
>
> Can you change the ", ignoring." to ", ignoring but please contact the
> BIOS vendor to fix this issue." as they need to get told this, otherwise
> this looks like it is a kernel issue.
Here is the v7 that just rephrased the warning message.

https://lore.kernel.org/lkml/20260713084323.287516-1-acelan.kao@canonical.com/

>
> thanks,
>
> greg k-h
