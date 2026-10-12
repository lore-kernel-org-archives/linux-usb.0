Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0B376BF4
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789093; cv=none; b=mfCiv5W89DTn3shnN2F2TArCfWse6w9SNmxe2nTyw0FADx3XzDi+EYbFaP2z2XAT5dO/1OqnF24Mg8A4odtKeudWQT82cNzkH+OsuVmZXRXAKnoKFAWxfhKw9NCtvydqNhFbhUXUdNyOT/RYH/3C7H/FTy+XY8Wi5mbywkMQ7Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789093; c=relaxed/simple;
	bh=7qG9daNLo9plcSsXioIA8Sc2lFsTgy66oa/mAWZlP2s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m4j5Hr/oA++c1JT4uV+cudRwHUJy69iLYJ9qYE5JkkN6ZXQ3LrZIeJ+3MpG2PkEu4h8Pbl6TC3aQEmQbW+EAW9xivs3FG/XAkIW73wIJpg8wdzhGnh3y/yoJKyWN7NrfdfzgMa0R7bvDDcaDFTnfKeLvWFcBzhRiwXR4NS9HV6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhaMY2M0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhaMY2M0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B2D1F0089B;
	Mon, 12 Oct 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789092;
	bh=founiSuybRySlI8Vm7M9U7l7ctSYVmzs1sU7b0j7J1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UhaMY2M0p4X5FOwF0m9iD38Kl6Fqf9jOvvKIhA8yuUZYzGzUPYFh3Sy/NlesNp+hD
	 xeBkBYvetTcsqOdq0HTQ50XD0gk8W+hZarGXDcAm8ChTwt52MjnJ/jAHwCAO8ZazyZ
	 9kDYzmQtGccjizrfxh06EV4encdoF7ExPjygomjHr6MvopMJSjTZg5r+zYewAO1Tqh
	 PHqPiGYzVB4qY7TZzzPT/NkRUjiYPgmOckQrhBgrgT6WYp3/9PiU0GRuKERajvtoj6
	 flwXSoNWItiExuWxZc/6JtMihjiRprBN425vrtgkF5dyCkbWHynmOVhLX6pvXzaU02
	 kRLgsADOhMnoA==
Message-ID: <sashiko-outbox-167779@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: cdns3: Fix PCI device reference leak in
 cdns3_pci_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ma Ke" <make_ruc2021@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012070310.3704130-1-make_ruc2021@163.com>
References: <20261012070310.3704130-1-make_ruc2021@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:11:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: cdns3: UAF in cdns3_pci_probe() error path freeing shared drv=
data
--

commit 4c0bd2a76b0d6740fa24b374ecb3e7b1b96c27ce
Author: Ma Ke <make_ruc2021@163.com>

usb: cdns3: Fix PCI device reference leak in cdns3_pci_probe()

This commit addresses a PCI device reference leak in the cdns3 driver by
ensuring pci_dev_put() is called on the device returned by
cdns3_get_second_fun(). It updates the probe and remove functions to
properly release the reference, including in error paths. A missing NULL
check before pci_is_enabled() in the remove function is also added.

> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3=
-pci-wrap.c
> index fd06a3d8e638f..7799349bba771 100644
> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
[ ... ]
> @@ -165,11 +168,13 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  		if (IS_ERR(wrap->plat_dev)) {
>  			err =3D PTR_ERR(wrap->plat_dev);
>  			kfree(wrap);
> -			return err;
> +			goto put_pci;
>  		}
>  	}

[Severity: High]
Can this error path free a shared drvdata object?

When pci_is_enabled(func) is true, wrap is retrieved from the sibling
function's drvdata:

cdns3_pci_probe() {
    ...
    if (pci_is_enabled(func)) {
        wrap =3D pci_get_drvdata(func);
    ...
}

If platform_device_register_full() fails later in the probe function, the
error path unconditionally calls kfree(wrap).

Because the sibling function still holds a pointer to this wrap object in
its drvdata, freeing it here can cause a use-after-free and potential
double-free when the sibling function is subsequently removed or accessed
(for example, when cdns3_pci_remove() dereferences wrap->devfn).

Should kfree(wrap) be skipped here if wrap was retrieved from the sibling
function rather than allocated in this probe call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012070310.3704=
130-1-make_ruc2021@163.com?part=3D1
