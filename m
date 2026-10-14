Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C94D7948
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976079; cv=none; b=eIex6B00vQxp6cBPY8IbxnnL7Gps/L2GhkNFGndgN0NBRJeOv1fJQ4oqJWDcAeiwAfYrW20UX0MPz3utkQejgdvOywOqcxvok94HmMmdJdbvMpDv0AyRYZ1AbZDcATOCAD0uGOi7wqVEWuOn5N3wHkc194dqeI8C8qHnUxdg9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976079; c=relaxed/simple;
	bh=GvqRNnYqco6yUJpUNGYstfZncNY30nQ+nMAnIMzcfCE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CJVbdpcwdAR2sUIkNrFMYnbOSSDODIqP3/Kc7KYT9i2wfWgckD8ji6swLP/+NBMUBE2CJzUzv4x9Cvw86MH6Y+juhwPeTrmKTRLtWb6zzDwvoZ6Yx5XStZ9aJM8zlvcbB6k4cJTAYEoM74oH/Fr3WoKuXPlgsMSoAjQN9dZaia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOkbXt0a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOkbXt0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63FF1F000FF;
	Wed, 14 Oct 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976078;
	bh=xia5ImPowvEv6Sligyzz/D7pbOs2ngd91Y04wh7Hrx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oOkbXt0ayuqqtN3Bg5ghCUezc6o1/Upauy/HirSjV+Zf+lc33RKMf87h2EpxwSASk
	 2o7Ino5R9CpiO1Xn2vZfglyAxfIMDwTsfK8GhvNMDODtU2p1mgbG6CWLqIvJIOYfk0
	 EC08t/MCAoJIHfwUpN7DA1MlRjeYHjMQU+1yuu/nRm8POeXttXlyC5MGTgwflJmCxX
	 Jg7JftWOZ+uhIuSOBbd8aVjkgm3X06fsDYxGcTtO02fr9f35A/BSbpAjXXh6TPITIA
	 h9Qq/qpnqZCOlwJ9qeWl00Qi8gdzdZTgMFPJJf1XQQKzlY4FZ+KZvcnUIBN8WRTakY
	 Ov+ZfaTYgPorg==
Message-ID: <sashiko-outbox-171174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: host: Mark dwc->xhci as null if xhci probe
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
References: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 11:07:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: dwc3: NULL pointer offset dereference in dwc3_host_exit() dur=
ing role switch
--

commit 24753f0ba9a09a8a782231f3b06d19d819bc300c
Author: Prashanth K <prashanth.k@oss.qualcomm.com>

usb: dwc3: host: Mark dwc->xhci as null if xhci probe fails

Currently dwc->xhci is not cleared when xhci_plat_probe fails, leading to a
use-after-free or null pointer dereference later. This commit sets the
pointer to NULL in the error path of dwc3_host_init() to prevent this issue.

> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b08..b01cf49454c2e 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -219,6 +219,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	return 0;
>  err:
>  	platform_device_put(xhci);
> +	dwc->xhci =3D NULL;

[Severity: High]
Could this lead to an invalid pointer dereference during subsequent role
switches?

In drivers/usb/dwc3/core.c:__dwc3_set_mode(), the role is updated to host m=
ode
before dwc3_host_init() is called, and is never reverted on failure:

__dwc3_set_mode() {
    ...
    dwc3_set_prtcap(dwc, mode);
    dwc->current_dr_role =3D mode;
    ...
    ret =3D dwc3_host_init(dwc);
    ...
}

If dwc3_host_init() fails, the role remains set to host mode, and dwc->xhci
is now explicitly NULL. When the system later attempts to switch roles (e.g=
.,
back to device mode), __dwc3_set_mode() evaluates dwc->current_dr_role and
invokes dwc3_host_exit(dwc).=20

Inside dwc3_host_exit(), if dwc->sys_wakeup is true, it unconditionally
evaluates the address of dev inside xhci:

dwc3_host_exit() {
    ...
    if (dwc->sys_wakeup)
        device_init_wakeup(&dwc->xhci->dev, false);
    ...
}

Because dwc->xhci is NULL, &dwc->xhci->dev evaluates to a small non-zero
offset. This bypasses the !dev check inside device_init_wakeup() and can
cause a fault when attempting to read dev->power.can_wakeup.

>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dwc3_host_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014105711.1708=
244-1-prashanth.k@oss.qualcomm.com?part=3D1
