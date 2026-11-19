Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109755;
	b=mD9t6w/5AGdKyVgh81DrUdIfqL6CXeup7l3jnepbHE2xlLe5iliwvFmEonfz3QyQaGm9
	 bhC9juzrM7elw/umEnrWDfz2LR7rnSklv3B5+owX4W1uVfs0pvC1M4AMlaBrc6+l91lEV
	 MgWbkTYpyc8MD5d8NupQKP7qL36bB16gQnILYxJaE2a6uRYzTatoNKLLZZKgdzGq5MXsl
	 8L+s5P+kKX5wEzAgm2ap4p9XDdGtAE94oeNIqABVY60SiDOtLrDvpDlfmjOELOhEPulpj
	 ylFkSD9TOrTWr65n8MlgY511MbOM9142oxPq141iSFUzSS01pNcFlsZjE8dGh++salA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109755;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qB0pAipWAaliYhdsVW4ddu4rlHxzv6sC6OA3Fzc8AEA=;
	b=r/vQNARN9r7ndlFjvGcelbcaE5pLDK964yM+fCgFqAV8M2aSXzxfu3pdBF2QtMIgLqf7
	 WqP2QfLQrLbUOfpNAJgZ2I37oMWpQZ4Urazh/WfEDs7zzd8/YsJyMYIui9TIZgn40mloX
	 hasnXDB6tQHPD0KLd8lhQwrc0fswYFZg7dGlL3stUhYFWtb3AJXfXbHMVrymOBZzenEQI
	 qds9aBaHzWxFsb/lF9yVbUHpZCRVk5mJKnrCXa5091k+27IIaDdgGEzc3cUmiKCGV5dci
	 9rpaotsd87u/YtlRs3mmdaUQw1ReFjiWMeg+jaIhlvIPcHH6mKXeFLzuxAaZ227UpLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwZVSPFe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D315606A33D
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwZVSPFe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2731F000C4;
	Thu, 19 Nov 2026 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109755;
	bh=qB0pAipWAaliYhdsVW4ddu4rlHxzv6sC6OA3Fzc8AEA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QwZVSPFeGXZuodY/N5TTex6Pj+kyWiRzhZy03ZfJtzd8XAcQqa/A0F/Yho9yDNyMx
	 /QhYN4q3BVe5Ef9eAYym7ETuQ8yVJzboqEYzKVMALE9wnlokf04qc5rklvxMrhi3F+
	 uD0JE0eIEEnO71OzBqmHGRTSGkk5UU7wPYHz1QINlNSPK/RzVt64kya3lh9aAfGg4R
	 ocmNkrG8ysbVs1fz3iGYO2GgdapdesKOe0L/mCgeyU3rtoNrUIRPt+bp12vT+2Pl9M
	 FO5hyvQN27wMCllSfJ3FQmHRDWKm0P6wAWXf/QL8N9iKrwswoC3SMU6ERt6G8h+fxF
	 DdCsWpeWd8yRA==
Message-ID: <sashiko-outbox-223706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/18] thunderbolt: Re-apply Alpine/Titan Ridge flow on
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-6-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-6-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:35:54 +0000
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
- [Medium] thunderbolt: missing tb_pci_post_activate() in
  tb_runtime_resume()
--

commit 087ef2024705f5c81e4d876d241a868e52e4e3b5
Author: Mika Westerberg (Intel) <westeri@kernel.org>

thunderbolt: Re-apply Alpine/Titan Ridge flow on resume

This commit extracts the PCIe L1 enable and xHCI connect steps into
tb_pci_post_activate() and calls it when re-activating PCIe tunnels in
tb_resume_noirq().

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 3c4903adb687d..6a11d686bdf14 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2315,6 +2315,21 @@ static int tb_disconnect_pci(struct tb *tb, struct=
 tb_switch *sw)
>  	return 0;
>  }
> =20
> +static void tb_pci_post_activate(struct tb_tunnel *tunnel)
> +{
> +	struct tb_switch *sw =3D tunnel->dst_port->sw;
> +
> +	/*
> +	 * PCIe L1 is needed to enable CL0s for Titan Ridge so enable it
> +	 * here.
> +	 */
> +	if (tb_switch_pcie_l1_enable(sw))
> +		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
> +
> +	if (tb_switch_xhci_connect(sw))
> +		tb_sw_warn(sw, "failed to connect xHCI\n");
> +}

[ ... ]

> @@ -3239,6 +3246,8 @@ static int tb_resume_noirq(struct tb *tb)
>  			usb3_delay =3D 0;
>  		}
>  		tb_tunnel_activate(tunnel);
> +		if (tb_tunnel_is_pci(tunnel))
> +			tb_pci_post_activate(tunnel);
>  	}

[Severity: Medium]
Should tb_runtime_resume() also call tb_pci_post_activate() when it
re-activates PCIe tunnels?

drivers/thunderbolt/tb.c:tb_runtime_resume() {
	...
	tb_switch_resume(tb->root_switch, true);
	tb_free_invalid_tunnels(tb);
	tb_restore_children(tb->root_switch);
	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list)
		tb_tunnel_activate(tunnel);
	...
}

Generation 3 routers use runtime PM (tb_runtime_suspend() puts the routers
into sleep via tb_switch_suspend()), and when the NHI is already
runtime-suspended at the start of system sleep, nhi_complete() resumes the
domain through pm_runtime_resume() -> tb_runtime_resume() instead of
tb_resume_noirq().  Without tb_pci_post_activate() there, Titan Ridge PCIe
L1 and Alpine/Titan Ridge internal xHCI remain unconfigured after runtime
resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D5
