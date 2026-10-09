Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE594156C6
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540665; cv=none; b=Qoa0AZJgWh5VaARhjoBBq9XiKAsRQC2R+xGuIopKlfEl1hEGDZVi9+4q5uk0vPpv0kMMwPwaKLs/IcXTkIOWX+zy210/yI+hjyvkNbkdFA/08gckWJxmhbQT6eQ/OBVEZACN8bjHE7tQ57sbjXzJkRRktD6/NJ/2WKuY+2Wj8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540665; c=relaxed/simple;
	bh=7NmeVMknXAYVz3jClI54XG5mFsbnz/Odm5FbarSXOEM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qN0jiY/Gh2YG1O/S3Urvibal9HjNhrVIn33g3MeaQNjI45aMLU3rNoCmM8f4fizmQvQ2t9iOIruUXfwYpAuqSSojdY4XkJNY+TUb+ga6FXF2REaOFOEoxMz5wIzlOO4D3PDzHu68QrgHiFyA6TOe0R731q4DeaBHbfOity8xgUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7t6LqTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7t6LqTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F791F00893;
	Fri,  9 Oct 2026 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540664;
	bh=C1kCzKtwFUgrB2gqwmnv1390e61d7W8D62OaAFNfnXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7t6LqTuaPED0/LmNC98CwUufCAIJ/fD9OP32CMbFdEfYxqyQTQAzlnEj4KYYengL
	 PJvfndrDm0RAOHfO0kBHSWfbngqhMI5mI9Qi622lb4u+0l2lt/PsarWh22I2juVHWW
	 Ga6WT0X8BZHft4dvNudghicwteA3f9NECRunAGzdEXbk7aAHC0fLSwkQKqCNxXaNiO
	 Mk4Yr5bFPRoUn+FyPx68dm7B+iRP5bWEp75q6X15weCV8+t3W8qB4S361n7mVZPJvd
	 ZfQDOlEmdkkVdqrx8z1fwLU4gUYffj4m6L9sYAEVMUbzrbeqvD079oPqEbzMY47pph
	 Fcj56zfh8oz7Q==
Message-ID: <sashiko-outbox-165202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/14] early: usb: xhci-dbc: Handle out of bounds
 xhci-xdbc capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-2-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:11:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] usb: xhci-dbc: OOB MMIO read during capability traversal via trunc=
ated early_ioremap
- [High] usb: xhci-dbc: strictly requiring optional LEGACY capability break=
s valid hardware
- [High] usb: xhci-dbc: missing bounds check allows OOB access to LEGACY ca=
pability registers
- [High] usb: xhci-dbc: lockless unmap on ioremap failure causes UAF with a=
ctive console
- [Medium] usb: xhci-dbc: off-by-one check incorrectly rejects capabilities=
 ending at fixmap boundary
- [Medium] usb: xhci-dbc: missing offset=3D0 check processes base registers=
 as capability
--

commit c5569785c857fd1c3eacf9d2844609e296560040
Author: Umang Jain <uajain@igalia.com>

early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability

This commit handles the case where the PCIe memory IO size exceeds the
fixed boot time mappings dictated by NR_FIX_BTMAPS. It ensures that the
xHCI debug capability can still be queried by mapping the base address
up to the fixmap size and querying capabilities within that range. It also
introduces xhci_base_length to track the early_ioremap() mapped size.

> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 41118bba91978..f2ed8e52cc56c 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c

[ ... ]

> @@ -85,7 +98,59 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus=
, u32 dev, u32 func)
> =20
>  	xdbc.xhci_start =3D val64;
>  	xdbc.xhci_length =3D sz64;
> -	base =3D early_ioremap(val64, sz64);
> +
> +	fixmap_size =3D NR_FIX_BTMAPS << PAGE_SHIFT;
> +	if (sz64 < fixmap_size) {
> +		xdbc.xhci_base_length =3D sz64;
> +		return early_ioremap(val64, sz64);
> +	}
> +
> +	/*
> +	 * Base address size is greater than fixed size boot time mappings
> +	 * hence, map maximum allowed fixmap size from base address and
> +	 * determine if the required extended capabilities lies within the
> +	 * fixmap.
> +	 */
> +	base =3D early_ioremap(val64, fixmap_size);
> +	if (!base)
> +		return NULL;
> +
> +	offset =3D xhci_find_next_ext_cap(base, 0, 0);
> +
> +	while (offset < fixmap_size) {
> +		val =3D readl(base + offset);

[Severity: Medium]
If xhci_find_next_ext_cap() returns 0 (indicating no capabilities found),
doesn't this loop unconditionally enter because 0 < fixmap_size?

Inside the loop, readl(base + 0) would read the base xHCI Capability
Registers rather than an extended capability header. XHCI_EXT_CAPS_ID(val)
could then mistakenly extract the CAPLENGTH byte, potentially misinterpreti=
ng
it as an extended capability ID like XDBC_CAP_FLAG_LEGACY.

Should there be an explicit check for offset =3D=3D 0 before entering the l=
oop?

> +		switch (XHCI_EXT_CAPS_ID(val)) {
> +		case XHCI_EXT_CAPS_DEBUG:
> +			if (offset + XDBC_MAPPING_SIZE < fixmap_size)

[Severity: Medium]
If the 64-byte DEBUG capability struct ends exactly at the fixmap_size
boundary (offset + XDBC_MAPPING_SIZE =3D=3D fixmap_size), it is fully mapped
and safe to access.

Does the strict less-than operator here incorrectly reject a perfectly valid
capability that ends exactly at the boundary?

> +				cap_flags |=3D XDBC_CAP_FLAG_DEBUG;
> +			break;
> +		case XHCI_EXT_CAPS_PROTOCOL:
> +			cap_flags |=3D XDBC_CAP_FLAG_PROTOCOL;
> +			break;
> +		case XHCI_EXT_CAPS_LEGACY:
> +			cap_flags |=3D XDBC_CAP_FLAG_LEGACY;
> +			break;

[Severity: High]
This accepts the LEGACY capability without ensuring its extended registers
fit within the mapped fixmap region.

If the LEGACY capability header is located at fixmap_size - 4, the while
condition (offset < fixmap_size) is satisfied, and the header is read.
However, later in xdbc_bios_handoff(), the code accesses the control regist=
er
at offset + XHCI_LEGACY_CONTROL_OFFSET (offset + 4).

Will this result in an out-of-bounds MMIO read when offset + 4 equals
fixmap_size?

> +		}
> +
> +		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
> +		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
> +		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
> +			found_all_caps =3D true;
> +			break;
> +		}

[Severity: High]
According to Section 7.1 of the xHCI specification, the "USB Legacy Support
Capability" is strictly optional.

By requiring XDBC_CAP_FLAG_LEGACY to be present here, does this patch
introduce a regression that breaks DbC initialization on valid, compliant
hardware that safely omits it?

> +
> +		offset =3D xhci_find_next_ext_cap(base, offset, 0);

[Severity: High]
Does this blindly request the next offset without verifying bounds beforeha=
nd?

Inside xhci_find_next_ext_cap(), the helper computes the offset to the next
capability and immediately dereferences it:

xhci_find_next_ext_cap():
    do {
        ...
        next =3D XHCI_EXT_CAPS_NEXT(val);
        offset +=3D next << 2;
    } while (next);  // loops back to readl(base + offset)

If the computed offset exceeds fixmap_size, readl() will access unmapped
MMIO memory and cause a kernel page fault BEFORE xhci_find_next_ext_cap()
returns.

The offset < fixmap_size check at the top of the loop is too late to prevent
this out-of-bounds access.

> +		if (!offset)
> +			break;
> +	}

[ ... ]

> @@ -1004,7 +1069,7 @@ static int __init xdbc_init(void)
>  	memblock_phys_free(xdbc.table_dma, PAGE_SIZE);
>  	memblock_phys_free(xdbc.out_dma, PAGE_SIZE);
>  	writel(0, &xdbc.xdbc_reg->control);
> -	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);

[Severity: High]
If keep_bootcon is used, the console remains active. If the permanent
ioremap() fails in xdbc_init(), execution jumps to the free_and_quit error
path.

This error path locklessly unmaps the underlying MMIO regions by calling
early_iounmap() and writel() without acquiring xdbc.lock and without
unregistering the console.

Concurrently, if another CPU calls printk(), it could invoke
early_xdbc_write(), which acquires xdbc.lock and attempts to write to the
now-unmapped xdbc.xhci_base. Can this cause an MMIO use-after-free or page
fault?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D1
