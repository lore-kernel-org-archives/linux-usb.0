Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D73D9524
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858064; cv=none; b=jf/Xx9byAstOSALnfRYovGTDhu/V/RA0D+o3x2sa5nvea3QOkChBDysNKtksrD3cdvRenAK28vRwXU8iIcY/EmzN5o6EabJJWLrp69pXlqkHKICZGExIJ3AIbU47f/73I1+Npz1zXF8XC7oYRkQ0t0Q+4kgjAgLFmNyIFyhbiTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858064; c=relaxed/simple;
	bh=/6toUVWtYHRfRT7IKbkcIOblJbhjRMXwxT+uiopr8EE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g/ISyHmncAo4Fr+Xg+EL7gf7McMK6qAmdmHrN5BQjFN3+kFA/OtiDn59YyiFLX/bd8GohoQc+3WKGcfV4BnxF3E7pKiN5c6JRtJAwmBiXijlvuaVXxD9kijk6jkeujU8hLYq0hvOvrdizDQFquPrjDVnBa3g1KQ+/jYLoQgEPv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP/6pQmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP/6pQmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5C31F000FF;
	Tue, 13 Oct 2026 02:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791858063;
	bh=rse1LcKpeV03xgy+b2IhcX2rYpmA1fwKL7AsiW6iE8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gP/6pQmDYLtYoSBEXloRW3kiO12F+t1C1OueJRJTzE/086ZCSHUAYoJsy15Iq6zPi
	 N5XZx0N+4ghwHukEt87B5Tbe2FwICes7zOO8OCyFldOpp3eDWY8Gh47ZaWdGSGoHE2
	 pwg6qNB19otsObV8aWfm4W6RJWDw+JFw6iBSqgZXqyxlW2FVsrOGvrX9MK8nTUiYAx
	 mFUtNAfLqzgYzefd95RlRh/CZTDIYfs0QwRS+oyE9lTU7eUfXzn9YT8DkBa8gc9HeD
	 WpuNOjqgTI/9fCloW05UGEI8119DbFT742CZLBnQ+HmIb/UkY32t6xcYHRnwtgbPQe
	 Z6KEG3yDCukwQ==
Message-ID: <sashiko-outbox-168860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: cdns3: Fix PCI device reference leak in
 cdns3_pci_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ma Ke" <make_ruc2021@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013020827.4099844-1-make_ruc2021@163.com>
References: <20261013020827.4099844-1-make_ruc2021@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:21:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: cdns3: TOCTOU race in probe corrupts shared wrap state
- [High] pci: UAF of MMIO resources on partial unbind of compound device
- [Medium] usb: cdns3: PCI device reference leak on pcim_enable_device() fa=
ilure
- [Medium] pci: memory leak of cdns3_wrap on concurrent unbind due to devre=
s timing
--

commit 8da98a756feb810e31a39db878f286ba953f3a5d
Author: Ma Ke <make_ruc2021@163.com>
Date:   Tue Oct 13 02:08:27 2026 +0000

    usb: cdns3: Fix PCI device reference leak in cdns3_pci_probe()

This commit addresses a reference leak of the sibling PCI function in
cdns3_pci_probe() and cdns3_pci_remove() by ensuring pci_dev_put() is
called. It also tracks the allocation of the shared cdns3_wrap structure
to avoid freeing a dangling pointer when the second function fails probe.

> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3=
-pci-wrap.c
> index fd06a3d8e638f..31089eb9ca29f 100644
> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> @@ -72,6 +72,7 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  	struct cdns3_wrap *wrap;
>  	struct resource *res;
>  	struct pci_dev *func;
> +	bool own_wrap;
>  	int err;

[Severity: Medium]
Does this code still leak the func reference if pcim_enable_device() fails?

Earlier in cdns3_pci_probe(), before the changes in this patch take effect,
we have this code:

	func =3D cdns3_get_second_fun(pdev);
	if (unlikely(!func))
		return -EINVAL;

	err =3D pcim_enable_device(pdev);
	if (err) {
		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
		return err;
	}

If pcim_enable_device() fails here, we return immediately without dropping
the func reference acquired by cdns3_get_second_fun(). Should this error pa=
th
be routed to the new put_pci label as well?

[ ... ]

> @@ -99,12 +100,17 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  		if (!wrap) {
>  			dev_err(&pdev->dev,
>  				"second function not initialized, retrying\n");
> -			return -EPROBE_DEFER;
> +			err =3D -EPROBE_DEFER;
> +			goto put_pci;
>  		}

[Severity: High]
Can a Time-of-Check to Time-of-Use race happen here during concurrent probe?

If both function 0 and function 1 are probed concurrently (e.g., via sysfs
or async boot probing):

1. CPU0 enables device 0.

2. CPU1 enables device 1, sees device 0 is enabled, but wrap is NULL because
   CPU0 hasn't set drvdata yet. CPU1 defers and keeps device 1 enabled.

3. CPU0 sees device 1 enabled, assumes wrap is initialized, and registers a
   platform device with incomplete resources.

4. CPU1 retries later, gets the wrap structure from CPU0, and proceeds to
   register a second platform device.

This second platform device registration overwrites wrap->plat_dev and
wrap->devfn. Since the remove method relies on wrap->devfn to unregister the
platform device, does this permanently leak the first platform device?

[ ... ]

> @@ -184,8 +193,10 @@ static void cdns3_pci_remove(struct pci_dev *pdev)
>  	if (wrap->devfn =3D=3D pdev->devfn)
>  		platform_device_unregister(wrap->plat_dev);

[Severity: High]
Does this leave the platform device accessing disabled MMIO resources on a
partial unbind?

The driver registers a single platform device for both functions, assigning=
 it
the resources (BARs) of both. If the function that was probed first is unbo=
und
via sysfs, wrap->devfn !=3D pdev->devfn (since only the second probed funct=
ion
records its devfn). The unregister is skipped.

When cdns3_pci_remove() completes, pcim_release() will disable the unbound
function's memory decoding. The platform device remains registered and its
driver will continue accessing disabled MMIO regions. Can this lead to mast=
er
aborts or system hangs?

> -	if (!pci_is_enabled(func))
> +	if (!func || !pci_is_enabled(func))
>  		kfree(wrap);

[Severity: Medium]
Will this skip freeing the shared cdns3_wrap on concurrent unbind?

If both functions are unbound concurrently via sysfs, they will both enter
cdns3_pci_remove() at the same time. Since device enablement is managed by
devres (via pcim_enable_device), devres_release_all() only decrements
enable_cnt after the remove function returns.

When both threads check pci_is_enabled(func) for their sibling, both will s=
ee
it as true (because neither sibling's devres cleanup has run yet). Both will
skip the kfree(wrap) call, permanently leaking the structure.

> +
> +	pci_dev_put(func);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013020827.4099=
844-1-make_ruc2021@163.com?part=3D1
