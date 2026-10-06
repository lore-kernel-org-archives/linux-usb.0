Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAA39EF1C
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305396; cv=none; b=gElxS5NQSN2AdrsGxrEP2YRE/zzwz+QDgTMRGOYyF6SC0LA9dvO9vvk2kLFF/pmlwmrgFIrNJNKYTXqzDggOvHxlW3rS4l7FkKUP0lengRT4fFKdUHJLQ3v2OfdUYqY3UxChhsKv6PNXrwVnQCN6x59vjCgm9aX3UemUhkQwGPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305396; c=relaxed/simple;
	bh=hY33spk6jA7xdlVYYhCalSX7H0xaMpc10/p0lRTVKO8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=R506FMqBJthaKMUKzOKxPZ8ngMtoHwITTSLrQMcMOMdfjKP13611S6zy3Ec0Mm1CSkBc4A+mJZvDDm6y6xMhuabHbLaBFgj7RKOoD+dY4x7Dxe4a36NkUCgKvLwiudl9ufk4MWiLFK75lQM1H+g/5txeivkDFGBKb1oLJbSpaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zvuxa4lm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zvuxa4lm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6971F0089C;
	Tue,  6 Oct 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791305395;
	bh=+ud7ESQn5CTQD6GUcq7JzdZhbDPWYA4+MPQZXWHhXm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zvuxa4lm0v4uvzHlhrG2sYtX7/x/TnZftaxziOcVTXXleblJIkmgPTd4PjF8uzw4M
	 GpUcp/BKYuGkOxZPUf3XEoBxDlttkkwDIzUznhqtCNiaYn9ZKuSofre10pg0Z+GMFa
	 JfrzAly8VrnQkBJlw+rUMfQtvtSKB0wVzYbFEXwLTDob2TnTCqYz6YhkvA0q9ek4Mt
	 pR8JM2EAnDbk1BxZwkiDn6JqVxrcUlWqzB39NN5kNq5dLCOwbMfoA83oqalNL3LONL
	 G25SI06q/4OEixTwePBp38zKfaASEuZJM1gM6x+yFACmZapAIwIeUcJBGItaKseQSr
	 88w8pwYATswyA==
Message-ID: <sashiko-outbox-162270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] thunderbolt: Add quirk to reset host interface for
 AMD USB4 routers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <26ea33592937dcd93d06c901443a9b938cc24caf.1790854235.git.Basavaraj.Natikar@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <26ea33592937dcd93d06c901443a9b938cc24caf.1790854235.git.Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:49:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] thunderbolt: NULL pointer dereference in nhi_reset_work() due to l=
ate dev_set_drvdata()
--

commit 9823327103fd3f6d1af1a55c73b76fed9264dad0
Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

thunderbolt: Add quirk to reset host interface for AMD USB4 routers

This commit adds a quirk for AMD USB4 routers to reset the host interface
before reprogramming a reused DMA HopID, preventing TX ring hangs. The reset
operation waits for DMA rings to stop while leaving other tunnels intact.

> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 4408229d8ac7b..b26f5b39e923b 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
[ ... ]
> @@ -63,6 +63,27 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nh=
i_pci)
>  			nhi->quirks |=3D QUIRK_E2E;
>  			break;
>  		}
> +	} else if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD) {
> +		switch (pdev->device) {
[ ... ]
> +		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI0:
> +		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI1:
> +			/*
> +			 * These hosts may hang the Tx ring if its HopID is
> +			 * programmed again without a host interface reset
> +			 * in between.
> +			 */
> +			nhi->quirks |=3D QUIRK_RESET_DMA_ON_REUSE;

[Severity: High]
Does adding this quirk expose a race condition during probe that leads to a
NULL pointer dereference in nhi_reset_work()?

When QUIRK_RESET_DMA_ON_REUSE is set, it seems nhi_reset_work() can be queu=
ed
when a DMA ring stops. However, looking at the initialization sequence in
nhi_probe(), drvdata is set very late:

drivers/thunderbolt/nhi.c:nhi_probe() {
	...
	res =3D tb_domain_add(tb, host_reset);
	if (res) {
		...
	}
	dev_set_drvdata(dev, tb);
	...
}

During tb_domain_add(), event processing is started and the lock is dropped
before returning:

drivers/thunderbolt/domain.c:tb_domain_add() {
	...
	/* This starts event processing */
	mutex_unlock(&tb->lock);

	device_init_wakeup(&tb->dev, true);
	...
}

Because tb_domain_add() allows asynchronous events (like DMA ring start/stop
operations) to execute before returning to nhi_probe(), nhi_reset_work() can
be scheduled while drvdata is still NULL. If this happens, it leads to a cr=
ash
when trying to acquire the lock:

drivers/thunderbolt/nhi.c:nhi_reset_work() {
	struct tb *tb =3D dev_get_drvdata(nhi->dev);

	/* The connection manager must be blocked over the reset */
	guard(mutex)(&tb->lock);
	...
}

Can we ensure drvdata is set before enabling event processing, or otherwise
prevent the reset work from running before tb_domain_add() finishes?

> +			break;
> +		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790854235.gi=
t.Basavaraj.Natikar@amd.com?part=3D3
