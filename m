Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844445;
	b=Kpw+6/YBPOzVpZaoJBpwhUiBU+t3ArhFGXvgxwu+HxV0GzLBtnXyRam9Zqt8Vah3BZbI
	 OyBWCTvV5l37NvMFon/+a20MSsZcH71KSm5+D2m7rDCgbVJrziWpCbDfKEzFoWjZ10Xdb
	 IDr9bzQXF2E4s4BviK4ZYCbaBotVEGHBMl3SxUXpm7plZBpPH7X0eVSJ1b8JxT918hsiO
	 SPgcW9kl1KBxlaRMaEDUMkGYARAFklK3p/n/qTSRRpx+Fu2qwHtV0oxZkZiA783n4BAPv
	 ue5IzAu8Ex5Ci9UyN9aVlYjxgYYtXruVxaK2kdvEWd1sycm5HojH1G9e0S8+toTAhcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NWRdhyGF/OmGFSNeChtRw7cFLrscUlkWLVkf/Xw+0HI=;
	b=lp0llXOxR3KIIviZVflb/iEnXi0HG0EEl7YisO2y3qDv55m9dZGLFjY5Pqc/WKuCH5EJ
	 3G9ZweJO7RDAr41UVblP1M3qCcMi7lXkuiP0Ewq5uQej8oNt+dw6WikWydrsQ1aMCiyYo
	 T43tTzYpzKAN/4RDpDXa2sEMqPTyXR/nOoGBvf7H/pVJZ1bb/s40PUldhGrxNnvgt9IB0
	 qfyxmi7vd1CYsnIWlk3+GMTAfXO2bN1Zyhx/8jjPOPEMpCXJD2iagniW7LSF7ICCDERqh
	 MEo35QoCCO/YEzbLmnjKm0HnW6xSbYnbH/3rnRrzSjATQ2zQc0c4EZmqux4P3oeHR8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUCjnufJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF225606A33A;
	Mon, 16 Nov 2026 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUCjnufJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5501D1F000C9;
	Mon, 16 Nov 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844445;
	bh=NWRdhyGF/OmGFSNeChtRw7cFLrscUlkWLVkf/Xw+0HI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUCjnufJSpYUxmLjtKYEMo5DkKQpAaPasieX0MrIIufSH8hznup+3WcCkKXB0ZAlD
	 2f/BQ2LClUs15uv6qnm76soYFrlT5qpGC80Ryf0bt9aDhFlbmmkZ+E0uJQ31QPswm9
	 F4ZgU1Iw9kEB6W6LrZNDXa0hAkFez/TE6+zUwwxQD9QkvzM0dcrNzibJ0CYdbleFc6
	 yOOhTjROR5DNw3rCOkiOwXGitQV4Mog8Y6aZdILecmv9urZd9d0y9SfD6uR2i1AJPu
	 Vx65jdQmboOZ4BeCu8UZj35ZZ/C2i1lVBfsDwaSh5SRszxplVNbUk1TSzeLTWe29W8
	 Rafvu/4jFuH7g==
Message-ID: <sashiko-outbox-217318@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] usb: gadget: tegra-xudc: Add support for
 Tegra238
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-tegra-usb-v2-9-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-9-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:54:04 +0000
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
- [Medium] usb: gadget: tegra-xudc: unconditional reset assert in
  tegra_xudc_remove()
--

commit 01f4840c1e0e2937e62224e3b8e14a7ec36d25bd
Author: Jon Hunter <jonathanh@nvidia.com>

usb: gadget: tegra-xudc: Add support for Tegra238

This commit adds Tegra238 SoC support to the Tegra XUDC driver, managing
the xusb_dev and xusb_ss resets instead of power domains when
has_powergates is false.

> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 43a1940ed88ab..3d7254d6ebcd1 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c

[ ... ]

> @@ -3916,6 +3958,23 @@ static int tegra_xudc_probe(struct platform_device=
 *pdev)
>  	return err;
>  }
> =20
> +static void tegra_xudc_assert_resets(struct tegra_xudc *xudc)
> +{
> +	int err;
> +
> +	err =3D reset_control_assert(xudc->dev_rst);
> +	if (err)
> +		dev_err(xudc->dev, "failed to assert device reset: %d\n", err);
> +
> +	/*
> +	 * Release the shared SS reset vote even if the device reset fails,
> +	 * otherwise the next activation adds an unbalanced deassert vote.
> +	 */
> +	err =3D reset_control_assert(xudc->ss_rst);
> +	if (err)
> +		dev_err(xudc->dev, "failed to assert SS reset: %d\n", err);
> +}
> +
>  static void tegra_xudc_remove(struct platform_device *pdev)
>  {
>  	struct tegra_xudc *xudc =3D platform_get_drvdata(pdev);
> @@ -3931,7 +3990,10 @@ static void tegra_xudc_remove(struct platform_devi=
ce *pdev)
>  	tegra_xudc_free_eps(xudc);
>  	tegra_xudc_free_event_ring(xudc);
> =20
> -	tegra_xudc_powerdomain_remove(xudc);
> +	if (xudc->soc->has_powergates)
> +		tegra_xudc_powerdomain_remove(xudc);
> +	else
> +		tegra_xudc_assert_resets(xudc);

[Severity: Medium]
Can tegra_xudc_remove() call tegra_xudc_assert_resets() when xudc does not
hold a deassert vote on xudc->ss_rst?

tegra_xudc_probe() only acquires dev_rst and ss_rst, leaving them to be
deasserted by tegra_xudc_activate() on runtime resume.  In
tegra_xudc_remove(), pm_runtime_get_sync() is called without checking its
return value before tegra_xudc_assert_resets() runs unconditionally.  If
tegra_xudc_activate() fails (after already unwinding its reset
deassertions) or never runs when runtime PM is disabled in the kernel
configuration, reset_control_assert(xudc->ss_rst) will underflow
deassert_count in __reset_control_assert() or drop the shared SuperSpeed
reset vote held by the active xhci-tegra host controller.

Also, when pm_runtime_get_sync() succeeds, tegra_xudc_free_eps() and
tegra_xudc_free_event_ring() free the coherent transfer and event rings
while the controller, clocks, and bus mastering are still enabled, before
tegra_xudc_assert_resets() asserts the resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D9
