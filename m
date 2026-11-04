Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759435;
	b=MLfmodohwlABkafLs3Qk2yFVETmbMInr25QlgiszK1Xm4XQp2lcMZ/U9mmhFoeh8A++e
	 bQxL51czxvcYfjxd/GVhM5jJP02gQydHtDiGsSCTRglnOZLCYcJWJsEfRFOMoHTGnve8z
	 ayrlK6XsslY4zAX0SGZXLE/GE+Vky/rnocDdfxcnS7kyMngE0+7Fot2oClXJZu/hCE+25
	 B6JWOavWSrUD44tYDdppjCWdlINKdC5k4hQfTfG5jAemdeurbJMMWFtn+UDeBnDd5l9G4
	 iC8dF+AUD/IZcDoiHljdrwuBJRnWcw0FMDoipjEISKh7jj+NfsTiT2cREEA14I/gv1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xuy9e70clJP30qZnzsqOsVCe6vd0MmtXZgZqGy3Us5c=;
	b=ajg+OyUDKCw5jNK0M9n2SeVuiAiO++0cHkcRjq2gR6ewWs9+3d2iHy02q9HJRhDLv0C1
	 vuPI9b58U37ToLTL2uZPKZOWnUaB4rvSVI3ONIvt5XJddBUzLHKUSzpcr4UMbctgxi9XR
	 l4EUeUUlVBKQ9m0KZ67RaJI/+FQdJnzNYZS2uBQegtHdyz+83boV7xl+2I1H05Gcu19SU
	 M3q9J1n5ktGcNGnOPT5GytmuMSx13O7WT2esapleCh60WPbLnlVIz9jMcbO5r7Uvs21Qz
	 JB/0AOrW00RNIIVJnNoLbpJqpJJSl3T1LUMxKc9hPjQJrRj/z+JDBNFHsSG6o/w8fmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ii+QHSi/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07D606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ii+QHSi/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC991F00919;
	Wed,  4 Nov 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759434;
	bh=xuy9e70clJP30qZnzsqOsVCe6vd0MmtXZgZqGy3Us5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ii+QHSi/WvWw5TAA25qm5GdJDxvTofxFz6GOt5OKNLtAef4Vt1v/PTRqaR5zkxDHP
	 VqJxv38nJAiJ1xOCcCD2jADd8vayp3QAoZaHeB2dtCWXlpeCA6scW/nmNpJWRv1LLZ
	 MgVZ/W8kMMZjd/Iknu7NkRWI2sa+qc289TXxzRnr9BvCf/rxPQhQW9IAjitqgGVe+E
	 IZvqvapfhyOR6jk69oquiknVIW+K6pQfl1kf8uU0kLZdZzyZ8ug+kN+XKuC39VZ3Nf
	 qOymus73qtnGiwD1z3O0hlGga3d4Wse7cWX6p/SWOnKnjJMFbUjQ8WzNhTvoJGgaqg
	 6Z2xMZvqM+dYg==
Message-ID: <sashiko-outbox-196474@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021503.1468519-1-vulab@iscas.ac.cn>
References: <20261104021503.1468519-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:30:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] usb: cdnsp: dangling cdns->gadget_dev on __cdnsp_gadget_init()=
 failure
--

commit 70891c067700e0e2a381cc692d3a9164919460f6
Author: Wentao Liang <vulab@iscas.ac.cn>

usb: cdnsp: drop runtime PM reference on gadget init failure

This commit adds pm_runtime_put_autosuspend(cdns->dev) to the free_pdev err=
or
path in __cdnsp_gadget_init() to drop the runtime PM reference acquired via
pm_runtime_get_sync(cdns->dev) when gadget initialization fails.

> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-g=
adget.c
> index e84405352caab..d3df4bc4a17bc 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> @@ -2083,6 +2083,7 @@ static int __cdnsp_gadget_init(struct cdns *cdns)
>  free_setup:
>  	kfree(pdev->setup_buf);
>  free_pdev:
> +	pm_runtime_put_autosuspend(cdns->dev);
>  	kfree(pdev);

[Severity: Critical]
When __cdnsp_gadget_init() fails and jumps to free_pdev, does dropping the
runtime PM reference and freeing pdev here expose a use-after-free on
cdns->gadget_dev during subsequent suspend or resume?

Before the fallible initialization steps (allocating pdev->setup_buf,
cdnsp_gen_setup(), cdnsp_gadget_init_endpoints(), usb_add_gadget_udc(), and
devm_request_threaded_irq()), __cdnsp_gadget_init() enables the DRD gadget =
and
stores pdev in cdns->gadget_dev:

drivers/usb/cdns3/cdnsp-gadget.c:__cdnsp_gadget_init()
	cdns_drd_gadget_on(cdns);

	pdev =3D kzalloc_obj(*pdev);
	if (!pdev)
		return -ENOMEM;

	pm_runtime_get_sync(cdns->dev);

	cdns->gadget_dev =3D pdev;

And in drivers/usb/cdns3/core.c, cdns_role_start() sets cdns->role =3D
USB_ROLE_DEVICE before calling start(), leaving cdns->role set to
USB_ROLE_DEVICE with state CDNS_ROLE_STATE_INACTIVE when start() fails:

drivers/usb/cdns3/core.c:cdns_role_start()
	mutex_lock(&cdns->mutex);
	cdns->role =3D role;
	mutex_unlock(&cdns->mutex);
	...
	mutex_lock(&cdns->mutex);
	ret =3D cdns->roles[role]->start(cdns);
	if (!ret)
		cdns->roles[role]->state =3D CDNS_ROLE_STATE_ACTIVE;
	mutex_unlock(&cdns->mutex);

Because the role state remains inactive, cdnsp_gadget_exit() is not called,
and the free_pdev path neither clears cdns->gadget_dev =3D NULL nor calls
cdns_drd_gadget_off(cdns).

With pm_runtime_put_autosuspend(cdns->dev) now allowing the device to enter
runtime suspend, a subsequent runtime resume or system suspend/resume will
call cdns_suspend() or cdns_resume(), which invoke
cdns->roles[cdns->role]->suspend() (cdnsp_gadget_suspend()) and
cdns->roles[cdns->role]->resume() (cdnsp_gadget_resume()) without checking =
if
the role state is active:

drivers/usb/cdns3/cdnsp-gadget.c:cdnsp_gadget_suspend()
	struct cdnsp_device *pdev =3D cdns->gadget_dev;
	unsigned long flags;

	spin_lock_irqsave(&pdev->lock, flags);
	cdnsp_disconnect_gadget(pdev);
	cdnsp_stop(pdev);

drivers/usb/cdns3/cdnsp-gadget.c:cdnsp_gadget_resume()
	struct cdnsp_device *pdev =3D cdns->gadget_dev;
	...
	if (!pdev->gadget_driver)
		return 0;

Both functions dereference the freed cdns->gadget_dev pointer. Should the
error path in __cdnsp_gadget_init() also clear cdns->gadget_dev =3D NULL and
call cdns_drd_gadget_off(cdns) (matching cdnsp_gadget_exit()), or should
cdns_suspend() and cdns_resume() check whether the role is active before
invoking the role callbacks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021503.1468=
519-1-vulab@iscas.ac.cn?part=3D1
