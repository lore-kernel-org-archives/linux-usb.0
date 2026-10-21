Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599389;
	b=RxTJtrnxYJD1uGMObuh9qfel4/L7aDddMr5F1PRcxLJxxTYZwlfAXCbqgxjmGwVOpbST
	 9jnGQ8/VkeOK963eBgLUwA7Z2L7mVuuqGGIr1D6k0+NRAkMXBogfqpvmQSkGLKJxzfSPB
	 YsVvfLGyWXcHCglJey7Mb+AEkisIAYDUp8h2v1ZUkJUdFFQTHCacT8e84vcScMlXRyxNJ
	 lbm6RIiZl7vdvqcYkfGdAdXKrKzSvtFLr+Ul50QcLij+k17lc8Q7xMf9nC6NrfLIn99/g
	 gKOmHvR4lD/Ry+pjdD6ZfQDzsXQrrsni1JixiOAkzwQYH7SS7ufu0LUuMZMYY/Ks++Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bg+1+4ZPaQi6eUD7Z5Axj25aKV9yf5JpgYmXlfjkdck=;
	b=v0jbrCL6CbwnDa1dBxFPaehiOkLej6S4JuzQmgiey9fIEagJlzl9yCxGxHLvY36BXvrx
	 kVd3wydDAUy/hSuJgrYYL8GD2BsJAjDmWiRPv+659nQlAqDbsSgKb7M8/JbkXNJH8i15U
	 1VDVqgQDsDHcSTPtXdlMfpEBsYFV5ueThrwXZ+4nR108gOY3AIoi8CGBCCmksK3vdCXOY
	 3V3pE4jIPwaiYNcNeLZk6NqFRP8zZb9EPNVircGPdh+eiSRunTMjc4WPWOL696pEWQeru
	 cDFUE7aLHCPlLcQUzXRCJ/Sg3CTAUybks7f0I65Jq0eRR3kbuFOzD0FPJcaTQy8Y5lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tw7ylmQ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E88606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tw7ylmQ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A09D1F000C3;
	Wed, 21 Oct 2026 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792599388;
	bh=bg+1+4ZPaQi6eUD7Z5Axj25aKV9yf5JpgYmXlfjkdck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tw7ylmQ1O92+IehlkVMS0Zqlw7T/lb/0hQUXee6u69Qj7f7SkKV/KvYX38MW8N4re
	 bqNAfQQhbdz17JdkDzl/8PhGgjh3j/ft3vHvQ3TFsJrgjKzfmjlnwnTPPOpgekiYsg
	 9AcYdEb3AL5Khx12HJ7Wo7VLNnjTOBuD6Z22J2FvjonCD4E6aTpntKjHgP2ELPpBxW
	 nIGfMIwP8y57y/5NpuK2hKgszOuN76gOwaWuJWJrIjAYoubPG8/6Y0BDGf3UYSo7ZF
	 sQgdyWQjfRpMZ+ceQDQ0erg4Yh8GegG6QZZYb9/kYRRPuGsAyFET6yhGoSyOzOUNFp
	 ZxXsEHtmHBMRQ==
Message-ID: <sashiko-outbox-180461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3] xhci: Reset TI USB controller on xhci shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: wenxiong@linux.ibm.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021160608.8229-1-wenxiong@linux.ibm.com>
References: <20261021160608.8229-1-wenxiong@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 16:16:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] xhci: uninitialized variable err in xhci_shutdown()
- [Low] xhci: build failure in xhci_shutdown() when CONFIG_PCI is disabled
--

commit b61fa6ad71541414d2813b27997006fef547aa43
Author: Wen Xiong <wenxiong@linux.ibm.com>

xhci: Reset TI USB controller on xhci shutdown

This commit adds an XHCI_RESET_ON_SHUTDOWN quirk for TI 0x8241 xHCI PCI
controllers and calls pci_reset_function_locked() in xhci_shutdown() so the
controller can initialize properly in a kexec-booted kernel.

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c280..8e5e25ebb6b5e 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -750,6 +750,7 @@ EXPORT_SYMBOL_GPL(xhci_stop);
>  void xhci_shutdown(struct usb_hcd *hcd)
>  {
>  	struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
> +	int err;
> =20
>  	if (xhci->quirks & XHCI_SPURIOUS_REBOOT)
>  		usb_disable_xhci_ports(to_pci_dev(hcd->self.sysdev));
> @@ -781,6 +782,13 @@ void xhci_shutdown(struct usb_hcd *hcd)
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>  			"xhci_shutdown completed - status =3D %x",
>  			readl(&xhci->op_regs->status));
> +
> +	/*
> +	 * TI xHCI controllers fail to initialize in a kexec
> +	 * kernel without a PCI function reset
> +	 */
> +	if (err && (xhci->quirks & XHCI_RESET_ON_SHUTDOWN))

[Severity: High]
Is err used uninitialized here in xhci_shutdown() in drivers/usb/host/xhci.=
c?

In xhci_shutdown(), err is declared on the stack without an initializer and=
 is
never assigned a value before being checked in:

	if (err && (xhci->quirks & XHCI_RESET_ON_SHUTDOWN))
		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));

When system shutdown or a kexec reboot runs:

  device_shutdown()
    -> pci_device_shutdown()
      -> usb_hcd_pci_shutdown()
        -> xhci_pci_shutdown()
          -> xhci_shutdown()

this reads uninitialized stack memory (and triggers an uninitialized variab=
le
warning at build time), and when stack variables are zero-initialized,
pci_reset_function_locked() will be skipped completely.

Should err be dropped so the condition only checks xhci->quirks &
XHCI_RESET_ON_SHUTDOWN?

> +		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));

[Severity: Low]
Will building drivers/usb/host/xhci.c fail when CONFIG_USB_XHCI_HCD is enab=
led
and CONFIG_PCI is disabled?

In include/linux/pci.h, pci_reset_function_locked() is only declared inside
the #ifdef CONFIG_PCI block and does not have a stub when CONFIG_PCI is
disabled:

  #ifdef CONFIG_PCI
  ...
  int __pci_reset_function_locked(struct pci_dev *dev);
  int pci_reset_function(struct pci_dev *dev);
  int pci_reset_function_locked(struct pci_dev *dev);

Since drivers/usb/host/xhci.c can be built without CONFIG_PCI, calling
pci_reset_function_locked() directly in xhci_shutdown() causes an implicit
function declaration error on non-PCI configurations.

Would it be better to perform this PCI function reset in xhci_pci_shutdown()
in drivers/usb/host/xhci-pci.c alongside the existing PCI-specific shutdown
handling?

>  }
>  EXPORT_SYMBOL_GPL(xhci_shutdown);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021160608.8229=
-1-wenxiong@linux.ibm.com?part=3D1
