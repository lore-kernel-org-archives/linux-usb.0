Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0894A5EB7
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017488; cv=none; b=MhQgYF2plIndH5/9GIiywK1mxEML9XQYJOvBW9PSNzPJh136b5TGESFz/CT039/39LthEEUoAmfV3ITbz5p48cLSURr2GhE9RqQaMi2lHpDjDHf/tDFvDCM3bQcIcuLrgr6WvDVeCd7fB1D/h8fyiuTJ2D1upyUacmAxhfQeHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017488; c=relaxed/simple;
	bh=Rtlv/tcoSiQaK4VHH7GtFKp/elzjN2GIZJ1hByjGsAU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=brenlKTk586OLpxQH+367rwio0NQt3PqjKk8AS8GpEX0oq59iNLOTaOd0gAPSMshe3kEJUmGpNF7fe9DaYzSurLCEtEoAieej4RLCWR+fh/v76oFs3097Sgni83t25X2QJmK9XybxeKgc4FyZ19CH1qPEr6BpWBcQVoQFADHJc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKJNZunq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKJNZunq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952A61F000C4;
	Wed, 14 Oct 2026 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017486;
	bh=s2UfqfNcF7+vf5YKiC9W7PUICaa/jm+U37ODUB37HRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKJNZunqoxDbhUA7hMV3LFyyRgmTrjTIV1knyOaas4x74Z4ulB3IkFxONw+WXE1xR
	 v75tMDcPty+wmOYOtfWayP1vD7RosTX+N1Jxjuv0PIyVJeyfRMiwKLnM0KAWjyfuGb
	 oVqSM2m+ARGmqalNuU2yTMO95e/KdMS+fGqoODs1XOAXO/a1lEKRVNbHUaQJApo/oz
	 98ssjrj8h8RFVq9L/w5BZ11gjj+Jo22qpkJ8oSa00ivQ2Vzo9TYSdc2Pd4DWvSxawn
	 0Kx9QEkd6XPEqrhMmXT/c98JZsAiBeHidVZLsHnqhSGQmYWTOMH2Uv8A871RgtM9qA
	 c2mctf3r89naw==
Message-ID: <sashiko-outbox-171982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] xhci: Reset TI usb controller on xhci shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: wenxiong@linux.ibm.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014222855.13698-1-wenxiong@linux.ibm.com>
References: <20261014222855.13698-1-wenxiong@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:38:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: xhci: typo in commit signature and comment formatting
--

commit d01818bc6cd938fdc83cd4a8bea9dbde80b9d813
Author: Wen Xiong <wenxiong@linux.ibm.com>

xhci: Reset TI usb controller on xhci shutdown

This commit introduces a PCI function reset on shutdown for TI xHCI
controllers to ensure they initialize properly in a kexec booted kernel.

> Signed-off-by: Wen Xixong <wenxiong@linux.ibm.com>

[Severity: Low]
This isn't a bug, but there is a typo in the Signed-off-by name (Xixong
instead of Xiong).

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index a8889081ae824..36191639bf430 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c

[ ... ]

> @@ -950,6 +952,13 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
>  	/* Yet another workaround for spurious wakeups at shutdown with HSW */
>  	if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
>  		pci_set_power_state(pdev, PCI_D3hot);
> +
> +	/*=20
> +	* TI xHCI controllers fail to initialize in a kexec=20
> +	* kernel without a PCI function reset
> +	*/

[Severity: Low]
This isn't a bug, but is this block comment introduced in xhci_pci_shutdown
missing the standard leading spaces before the asterisks on the second and
third lines?

> +	if (xhci->quirks & XHCI_RESET_ON_SHUTDOWN)
> +		pci_reset_function_locked(pdev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222855.1369=
8-1-wenxiong@linux.ibm.com?part=3D1
