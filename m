Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F5230BF6B;
	Wed,  8 Jul 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511210; cv=none; b=C1aF4YJKmJLjGi7FonpFiPlmI1LJhq/gk95LBIgaez+e7rPp2/9+ARfIpGl6vOHE/P1s7XYRQ6R4lpQtUocDZu4F39nujOwYIOQCHN8lulcCryUb4yiE90jJWZ+FtVQMMdniPJaoTeAVZQ99vG49bBlHM2PbjGBXOwGSUafd4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511210; c=relaxed/simple;
	bh=iuEZFPSb0B3ng1g3J0mwkB68hJHo5zbBwtY3zaHV2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB25mFjrXIQ74OQ68VICr2B7ZQ2sngDd+wblGmXkRbRD7bwg5VnKPBSnryK9cIHzL37XHYhKW/2Xi/y9zav60FjklHc2LL3ANd5XUGv9Kb11qvkEtr3n2TwHnjAQxnwLqNuRpHnbSvFt77unVcFPuI21xKMgdDiX/BMEQM7ioGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MBfv9QQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MBfv9QQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFF21F000E9;
	Wed,  8 Jul 2026 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783511209;
	bh=SQuKv1IMb8zSFYB8bJmnDIuhVCIeS4fLGGGCy7zQsgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBfv9QQSgyL4eI43IHjYwfsNIc33ku6/PzFIy1NFJqxm0UiuWaFjhGbhPfx4Sw0jI
	 ZQkv6Mdh27+MaCkEdSaOfbO/vgq6hyXCDLLXmgw1CKdi8pp5UQCZo77H8fnfFdlvH3
	 q77utfWMOIrBvgtoB+QmY9QPX2Nb+VYTj4l5xZo4=
Date: Wed, 8 Jul 2026 13:45:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: heikki.krogerus@linux.intel.com, bleung@chromium.org, jthies@google.com,
	myrrhperiwinkle@qtmlabs.xyz, pooja.katiyar@intel.com,
	abelvesa@kernel.org, yuanhsinte@chromium.org, johan@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <2026070844-hermit-postwar-9b7c@gregkh>
References: <20260612052112.1325812-1-acelan.kao@canonical.com>
 <20260612052112.1325812-2-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612052112.1325812-2-acelan.kao@canonical.com>

On Fri, Jun 12, 2026 at 01:21:10PM +0800, Chia-Lin Kao (AceLan) wrote:
> Some firmware implementations incorrectly return the same altmode
> multiple times at different offsets when queried via
> UCSI_GET_ALTERNATE_MODES.  This causes sysfs duplicate filename errors
> and kernel call traces when the driver attempts to register the same
> altmode twice:
> 
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> 
> The matching rules differ by recipient:
> 
>   - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
>     Two altmodes with identical SVID and VDO are byte-for-byte
>     duplicates and the second has no observable function, so drop it.
> 
>   - UCSI_RECIPIENT_SOP (partner):
>     The typec class binds each partner altmode to a port altmode of
>     the same SVID via altmode_match()/device_find_child(), which
>     returns the first port altmode with a matching SVID.  If the
>     partner advertises more altmodes for SVID X than the port
>     advertises, the surplus partner altmode(s) collapse onto an
>     already-paired port altmode and trigger the
>     "duplicate filename .../partner" sysfs error during
>     typec_altmode_create_links().  Use the port-side altmode count for
>     SVID X as the authoritative cap and reject any partner altmode
>     that would exceed it.  This preserves legitimate multi-Mode
>     partner altmodes (vendor SVIDs that the port really does
>     advertise more than once) while filtering the firmware-generated
>     duplicates that have no port counterpart, and is therefore
>     stricter than a plain SVID+VDO comparison (which still admits the
>     Thunderbolt case where firmware reports the same SVID twice with
>     different VDOs) without being over-broad like a plain SVID match
>     (which would falsely drop legitimate vendor multi-Mode entries).
> 
> If a duplicate is detected, skip it and emit a clean warning instead
> of generating a kernel call trace:
> 
>   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring.
>   ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001

Can you change the ", ignoring." to ", ignoring but please contact the
BIOS vendor to fix this issue." as they need to get told this, otherwise
this looks like it is a kernel issue.

thanks,

greg k-h
