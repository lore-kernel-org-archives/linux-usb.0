Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B43DEAEB
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341933; cv=none; b=Urx69kkrQBF2KkuuDWI3OHCQM0SSNv/O3x6VAzsMsK7DMJ2rkU/83c3sO5IMdkV5BHrpJmbShbVR+z3ySVlXSrfUPr07KZV/HkukO7yerSfL/cnxZEM7jToOsq64GWGqPOsMKq2BTimP5MuZFhvvuj8jpKr5D/oOnMO0Xw1qTok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341933; c=relaxed/simple;
	bh=SS7qDGTk7HYzo62Z/tccYpCaWMTfK1Nl0uNv3vQNbP0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TRfkmwtRqrqrivsPMo79qQf4T3xniHlFjfgXErxckbwfPe5sC5yfOvathOuqKIDFDG2T13H5dULeVh3UIjt/4QgRT90AIkQkyIxPZn62zIsswyOikKQhSzL9pLEcprcrs8OyXhwfl63sIKD8LZt6EbRQrfePpT+ciaagzWkmU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mC68yuxa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mC68yuxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C43C1F000C4;
	Sun, 18 Oct 2026 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792341928;
	bh=b6HlfSF96CDrmRe0ToMhHcWTLN8ahzYFC6jfW2ufdMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mC68yuxafFuXGA3CzIVZEPw+KTHHc7ZJ7VkyyHMlOnQWMBarDqW4z+EqNUTwkBcUJ
	 kmiQcjMfkvdpw5m/zp/KwT0TwEM6GAaTEC5svymN5HSK0Fd+lW29+VK3jHvnd7LkGo
	 GuiY2c1bfQr11xSAB8FxlV6ou89hxPgAxf5GyDmFNXM/+S5vHYf1ZIjjBSJjuoZ1u6
	 3EITv4F1MjJkj0lZVDQZ1aKV7RScONeWUCehUZwkpDTm/GnWV6we/A/lWy/qP7PJRc
	 riK5e9rcMSNVlAMrwtVIqcJF3rcUCKrE22HKBDt3u3xqVr85j9id+WkPPDNvVy2jNr
	 /H+CNdmhk3lcw==
Message-ID: <sashiko-outbox-176290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: hcd-pci: Do not disable an already disabled device
 on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cole Leavitt" <cole@unwrap.rs>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018164134.134106-1-cole@unwrap.rs>
References: <20261018164134.134106-1-cole@unwrap.rs>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:45:27 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> suspend_common() calls pci_disable_device() and resume_common()
> re-enables the device. If the host controller is hot-removed during
> system resume before its ->resume() callback ran (for example pciehp
> handling a Thunderbolt/USB4 dock or host router that did not come back),
> usb_hcd_pci_remove() drops the enable count a second time:
>=20
>   xhci_hcd 0000:b2:00.0: disabling already-disabled device
>   WARNING: drivers/pci/pci.c:2198 at pci_disable_device+0xac/0xc0, CPU#9:=
 irq/128-pciehp/225
>   Call Trace:
>    xhci_pci_remove+0x89/0xd0
>    pci_device_remove+0x4a/0xb0
>    device_release_driver_internal+0x19e/0x200
>    pci_stop_bus_device+0x63/0x70
>    pci_stop_and_remove_bus_device+0x16/0x30
>    pciehp_unconfigure_device+0x96/0x170
>    pciehp_disable_slot+0x66/0x100
>    pciehp_handle_presence_or_link_change+0x62/0x190
>    pciehp_ist+0x14f/0x1d0
>=20
> (usb_hcd_pci_remove() tail-calls pci_disable_device(), hence it is not
> in the trace.)
>=20
> Only disable the device if it is still enabled.
>=20
> Fixes: a0d4922da2e4 ("USB: fix up suspend and resume for PCI host control=
lers")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018164134.1341=
06-1-cole@unwrap.rs?part=3D1

