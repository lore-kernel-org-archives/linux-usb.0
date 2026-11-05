Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901369;
	b=ECe+wegD7Bn0g0DIk1vfa8fHnGVTJHhSIzxDEHOdT/dkKm1nrIKEFM/DRbyb5jtp7zuJ
	 eeI2mEm9SWehoqYnhUD8MZllnx/KuqYG0UeLvnoRhVEe+8L4r++8/Ju30rmr6O1wGxBmE
	 yS4bvT0L/wViOiJEiaGNem03syjR0aZ2ezE19mx08lf8BxL3JzUkwFPuAQKIZBi+MgJ8g
	 CFdC9IUHdIc3jTOW1x6lyTIpuH7l9ohjVW05T/GkJZpG3aW9JxfADJoP8i4N1yWO50LTA
	 NU6ei9q4TmuoaYuyqZDk9kwNwSc3Q78eNj3FXlZtdyJVZEOhJ/fe2+d2jYbUxV+783g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oQbbThKBbz+Doj3Dnzj8IgE6cj0mEID6rGNUq0N0dik=;
	b=OxF6UUPTxnMK4xdUCBZ+XjwdUa20BEyuyvHVFT8mj1qBBqa+RBAD9wpiYOiE/SL0HIS4
	 uYQlFYZUtxONWUwSibipYxymPlC/hDs5wXlMZC0BBUln6dOrrbaSX0xBCHM0FmEdMKcRb
	 8YnV+7DT4dr0yM1oLPM17BLaduWa7ey9ZhD9TylKQu/IoBq4E8BHzpMdc84tbZ1AG+mDT
	 uYOmT4gMOobwKYRQFADLUCvRM9j6QfQoU1UizC3Wf6eqyZcSCrr7iLZHeK0PGwhmFDcCC
	 GQPzfpul3eVLl9H6+ZoakcuMai6MkJdYE7s7obVPNB/nCG3s1J6IJT/6eSVGWQ1Kd7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDGlzeCy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77657606A336
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDGlzeCy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFD71F0093A;
	Thu,  5 Nov 2026 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901369;
	bh=oQbbThKBbz+Doj3Dnzj8IgE6cj0mEID6rGNUq0N0dik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IDGlzeCyNPNQImS/GAKW9zTX8+MyTugrZLm3FPIGGA31w65dnLDRgBe8XgDNIYe9w
	 Ullq7DLcxF0iEVMrutx58JlLCXXUCEz+aGxwVKw/IrLA6z6EAMcR5SbuD1Wt/FDjID
	 APZvK9WEg8vqMt+k+IMcie6TNr4x8UkNGoJjfHS1PTnlCDdrUsKOCCkBSwii3OHve0
	 wsokNW5gO22z+vgyfWAkq6mGnvUBng8eBnxIUKnsBkjc7OICFIHhydki0CG1RTqmfg
	 h/1HWFqddDMjJIIBcSHY7okMoJVEtEaMAaDFgu0zCwxYMStIcOFyHTHaxduUjUeuXh
	 Of6735WejvEqA==
Message-ID: <sashiko-outbox-199672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] usb: xhci: clear stale bandwidth data after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105175106.241182-5-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-5-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:56:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>=20
> Controllers using software managed bandwidth accounting maintain
> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table=
'.
>=20
> Each root hub port owns a bandwidth table and a list of TT bandwidth
> domains, where each TT has its own bandwidth table. Virtual devices
> reference the bandwidth table of their current bandwidth domain through
> 'bw_table' or 'tt_info'.
>=20
> Historically, resume from S4 reinitialized the entire xHCI driver state,
> which implicitly cleared all bandwidth accounting data. After the
> hibernation resume path was optimized to preserve parts of the driver
> state, virtual devices and TT bandwidth information were freed and
> recreated, but the root hub bandwidth tables were left intact.
> [ ... ]
> Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> Tested-by: Harald Judt <h.judt@gmx.at>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105175106.2411=
82-1-mathias.nyman@linux.intel.com?part=3D4

