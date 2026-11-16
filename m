Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842999;
	b=VPpYKNRZKaqiJfe8C0nNaQf/jULEdAe6UAJClt0SViPYdVmpdLrbyKIQxl5Iobfog8hr
	 wIGoXRye0+u6OrRTYadlCtORsXeU0AF+hVOCrc5NPztb67Xa69Onyh+cmfSco3xRhxxdl
	 ZlCgXSTXNiFqSLUw10lYgNpvd07PGMXowBO5dXQcbX3YbGtaoNBFjNQif0REeV70Imzw4
	 idy26GvuIhVLar+jRMNWUwpl7ASVfqAApbwqhUdjzJNHorEAE5DnTmYQHQshD5aOZnfgq
	 qd3Ot1uz1gEzYOKSRFWMXKPdgJE3kwB3gSrWurWmPJItgzuU0V91ZPAaRcxyUUkMGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/uqM0FjtzPU8Lt9sp/L9yQsEZf3BkdZ8Ue7dGlXTZJo=;
	b=qyfN1a97anidgAVWbDd8R6y3ov2BV6Aml1JIWerAqsLjPfZHH6HGAZZAHcDlL7zS8GW3
	 /lylde4Dr2ZYyn+LfRaX12+xF0wBvw1a5J7aIhl2D0ti0u2pG5X6c0mZRWGLxB5Ixx6/n
	 ONOC1PhFqQoQMsvQsNQDxjv8rv4Y6eNrBQeajJMW3nWmJzMuT+OlrFVJvDN0O4mi5OWY3
	 ZlWSpsqYGKglDKxigwwdCbAD5rF+C0wCWaZbdvew4/ZXhLpdcvPIgKnX+H7QQIJ0CcYjn
	 TuPirMdmfjBYsWFdNDkSd0ZGvgFmZR72Vgsvqrs6gN+dLmd9ows69Zub8OS1dli85pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7Ret9OP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E0606A881
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7Ret9OP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE1E1F000C4;
	Mon, 16 Nov 2026 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842998;
	bh=/uqM0FjtzPU8Lt9sp/L9yQsEZf3BkdZ8Ue7dGlXTZJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7Ret9OP9PqHEESJoRAPmyiWhK6Snko6Sotgsy03ULJ2bFsSx7OudTw1ptXfM8L31
	 ut6hbP2N71DKmyFqC5QRVnI641tJjKptZ59kJvoyQDdug44umix0yNGlRXKOHR0Kgi
	 gMEuYG0/sidfNEQzc5BpCsGvxzIsGliMVFvPgRKpNGHXkZEP47PzRjtnH6R8jQa2mZ
	 /8OdMXH8fCEYC243owW2dmbu1CCb+JugpiYiKQInhkroVDvGX4NhBbcCiwXwZkWDWX
	 r6efPMEktHO6SVKcJiEAEzB/6cjd89cTAcsLjAau/OWG+4QxFLRXHVgD2437+Ybas8
	 XlkaZq2hI4P4w==
Message-ID: <sashiko-outbox-217277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/12] usb: gadget: tegra-xudc: Fix CNT65
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-7-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-7-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:29:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Both tegra_xudc_limit_port_speed() and tegra_xudc_restore_port_speed()
> prepare a value for SSPX_CORE_CNT65 but write it to SSPX_CORE_CNT66.
> This leaves CNT65 unchanged and overwrites the preserved bits of CNT66
> with those read from CNT65.
>=20
> Write the prepared value to CNT65 in both paths so the Gen1 and Gen2
> timing values are programmed correctly and CNT66 retains its own
> preserved bits.
>=20
> Fixes: 88607a821ffc ("usb: gadget: tegra-xudc: add port_speed_quirk")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D7

