Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409816;
	b=csOEdzcQ9Ce0NieR/OpcG1cARBLlrrIUkgGndnOxIen5QAF88u9tNvDwxjcVXsd647l4
	 0yZm4p7t+3zdK3W9zOyrNr5XeuT8Ts4/oiiZFfspQaRW92GJ/VPf8FdMvARkHGGI1jiRh
	 +Ei8SqCMJLjT7uMyHZJceY2IwuygUrnWeXil4VHeHFqNIK+agh5QzvvZAYtNna1gpsRSc
	 Q0GuSLtIdYfes5nr9iUh0/wSzmAc9rjAMSZgjsgkTYLoVbu7mAe/kLm9e11vPqXYCMYd5
	 hb6k2htOUntWjgncQsmDrRa+CYNdXdkzLTAVGpnzFNyuqcohxLaLNyFnwpZvieOEMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DBPDbY39nQ8zf04WFYZvHfTCl2NPAAJGS4aRelIV+J8=;
	b=1xV9hhUawQcdSkMcMXoeZbbmc7H0y7ZpHlNzFWu3KVoqq1gBkptkIEU0BymhquUgfdxQ
	 ZD25A2I1I8uL71FGQDelE4b5hHwlQkfiHqqggs29VVainooX64pfixoHQFW51V9Bkf/qb
	 3EWZBgBqURLgt4Z0CSbL4HdeIAZ7WA3yAp7RI+6oJJ0qYqfi007oCIsXQiTSbYhBZ9bKj
	 Ai8Mn+i+b/4n0xLqgCKeGYKwqbbWJtHAvHGmcIa4JERrgkC/KWDGKph3PpzjDRMNyniWB
	 n8Hp1Ebo9nvTVqolF4ARph5omwJER1nF3W4JvIYD4/Q9JsJY0ZijqG2y/3OjcR2iO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjlYrdq4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC353606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjlYrdq4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1D71F000C0;
	Mon, 23 Nov 2026 04:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409815;
	bh=DBPDbY39nQ8zf04WFYZvHfTCl2NPAAJGS4aRelIV+J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjlYrdq4BniQCsnTtl1mmi/T1VRU3iTXXHyZ6r4WF8n2X0WNvHPcFuIC7OngMIBBi
	 LTml92GhIomNn7XGQpif+vJ42NqtYvW0vSI5LwvTfYC6E482GiQvdUXu8/WnF4hs9F
	 Zv0ynVCXSmLuoywakbvKmq0qjpRVVUJ7W9/+zngHGmtmGAtAZQV2168ridwNZDkkrf
	 VvNolEyNLH51Z3GorvD/3RMMmG71MIGtQaL3qUNhe/30zTDDQhoT6Npbr/kNUJ7hXZ
	 dG1/mLur879GxgYDkSJ5ieEreCOb+JTTSPBwtZO6oUrHiyBQOGwMHeMCKpr1hjhAB1
	 2tE1l1qWz85zQ==
Message-ID: <sashiko-outbox-228681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: cdns3: fix NULL dereference in
 cdns_host_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guomin chen" <chenguoming88s@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123044347.3273-1-chenguoming88s@gmail.com>
References: <20261123044347.3273-1-chenguoming88s@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 04:56:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: cdns3: dangling cdns->host_dev on __cdns_host_init()
  error paths
--

commit 65a7dd0ee7f8dab7d9774ef07f61af4db003e801
Author: Guoming Chen <chenguoming88s@gmail.com>

usb: cdns3: fix NULL dereference in cdns_host_resume()

This commit adds NULL checks for cdns->host_dev and its driver data in
cdns_host_resume() to avoid a NULL pointer dereference when the parent
resumes before the xhci-hcd child device has been probed or after host
role startup fails.

> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index e01264dc625da..2f430e1e00897 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -140,9 +140,23 @@ static void cdns_host_exit(struct cdns *cdns)
> =20
>  static int cdns_host_resume(struct cdns *cdns, bool power_lost)
>  {
> -	struct usb_hcd *hcd =3D platform_get_drvdata(cdns->host_dev);
> -	struct xhci_plat_priv *priv =3D hcd_to_xhci_priv(hcd);
> -
> +	struct usb_hcd *hcd;
> +	struct xhci_plat_priv *priv;
> +
> +	/*
> +	 * The xhci-hcd child may not be bound yet: cdns3 creates it, but
> +	 * xhci-plat probes it only later, and the drvdata is set in that
> +	 * probe.  cdns->host_dev itself can be NULL, e.g. when the host
> +	 * role failed to start.
> +	 */
> +	if (!cdns->host_dev)
> +		return 0;
> +
> +	hcd =3D platform_get_drvdata(cdns->host_dev);
> +	if (!hcd)
> +		return 0;

[Severity: Medium]
Is cdns->host_dev guaranteed to be NULL when the host role fails to start?

__cdns_host_init() assigns cdns->host_dev immediately after
platform_device_alloc() and does not clear it on the subsequent error
paths:

drivers/usb/cdns3/host.c:__cdns_host_init() {
	...
	xhci->dev.parent =3D cdns->dev;
	cdns->host_dev =3D xhci;

	ret =3D platform_device_add_resources(xhci, cdns->xhci_res,
					    CDNS_XHCI_RESOURCES_NUM);
	if (ret) {
		dev_err(cdns->dev, "couldn't add resources to xHCI device\n");
		goto err1;
	}
	...
free_memory:
	kfree(cdns->xhci_plat_data);
err1:
	platform_device_put(xhci);
	return ret;
}

If platform_device_add_resources(), kmemdup(), platform_device_add_data()
or platform_device_add() fails after cdns_role_start() has set
cdns->role =3D USB_ROLE_HOST, platform_device_put(xhci) frees the device
while cdns->host_dev remains non-NULL.  A subsequent cdns_host_resume()
will bypass the !cdns->host_dev check and pass the dangling pointer to
platform_get_drvdata(cdns->host_dev), causing a use-after-free.

Assigning cdns->host_dev only after platform_device_add() succeeds (or
clearing cdns->host_dev =3D NULL under err1) would ensure the new NULL check
catches all host-init failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123044347.3273=
-1-chenguoming88s@gmail.com?part=3D1
