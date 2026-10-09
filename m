Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79430BB80
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540471; cv=none; b=sgJODOz2keStlD6XZ7AzsJX0KaHiIRowz7Ki8nHhwg7vYnwrZi3j73lp69+H0XbO+sH6PwZfMwIgQVRuoCWf8Yr8Fv5Uiy2yHIj8TculEmtsH6rLR+82RvpBi/xdMmtyUVtHi8uP0JKGMEjiOvraJy1ErNSsz0dGbtgM8bO7CmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540471; c=relaxed/simple;
	bh=EE7OFJKiFVy5yjwIQKPW2SkMVVhxTfnvho7dOtR6gqE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hyBl2qGse6JJA9ijIpFmX0yeOjSoYyXunOztRqSudOaVtBcvOuCofuGdgBcPHUmvaehAyljSZYf35WsQ5l0MbD4R6Mabes5aS5D0xNE3w+FoOjj1KoMXOFSjrZtFtZ+WwEPXU89RqmqpLRmYNZ9Tmrd0nOfYxNah++RQ5RZuyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfmbCFJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfmbCFJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30541F000FF;
	Fri,  9 Oct 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540469;
	bh=q6288MWE7DpqervG9Yem/P8waQh7ybpY+qkWX45QNAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jfmbCFJCKI4SJcGA1tZpIBk+u+h1Gu4FQuHKKRjz2Tm9875MLPED3G9kG+MSjoRj0
	 7QVMatmWZhE8wt5Zjytvbt9S+J++sSp1tF3/yeiTkMqFvBvqcPrUe60qKLi54iAjRh
	 kO01X+Ik9Dv6iqtckmiMVVkyDE7KwtUpjmrOqcVv9t34v3UbKHFkhdybFSdQQUzFJU
	 3Jp/3Ks1TD0ECGbxhsCpejr3qPWCEerLLZxJmU7xw8v66MPP8LBcvur+N4OHrffDZH
	 mYcCmyH5EmISkX/N3B/AmHQh4w2ZNF/bctS2zNsl4wDcPCjoya1c4eyp7XhuOI0/ly
	 nEq7Y2cmSJUoQ==
Message-ID: <sashiko-outbox-165196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/14] usb: xhci-pci: Add TUSB73x0 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-9-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-9-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:07:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: incomplete refactoring of TUSB73x0 PCI ID magic number
--

commit 876cce743788b879e20245be68d1112387a5be14
Author: Fabio Estevam <festevam@gmail.com>

usb: xhci-pci: Add TUSB73x0 definitions

This patch introduces definitions for the TUSB73X0 PCI ID, USB_CTRL register
address, and PWRON_POLARITY. This replaces the hard-coded values in the
code to improve readability.

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index a8889081ae824..c580e0b860118 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[ ... ]
> @@ -95,6 +98,8 @@
>  #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
> =20
> +#define PCI_DEVICE_ID_TI_TUSB73X0			0x8241

[Severity: Low]
Does this code leave an incomplete refactoring of the magic number 0x8241?

In drivers/usb/host/pci-quirks.c:quirk_usb_handoff_xhci(), the TI TUSB73X0 =
PCI
device ID is still hard-coded:

drivers/usb/host/pci-quirks.c:quirk_usb_handoff_xhci() {
    ...
    if ((pdev->vendor =3D=3D PCI_VENDOR_ID_TI && pdev->device =3D=3D 0x8241=
) ||
    ...
}

Should PCI_DEVICE_ID_TI_TUSB73X0 be placed in a shared header so it can rep=
lace
the hard-coded value in both files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D8
