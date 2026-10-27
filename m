Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064366;
	b=bGRztDKsH3iUsboPYKpEdXsrQhYcdUjaTAVRt0msyicLNrx9HnB7G8G8cztCluYaoY2d
	 JtY/Kz254FaCDTiWPLJgtEem81jTe5YZd8hi0422wIetnq3hEKWYs7wFoP62uKZGBpdnI
	 aRRkNosK5QbEGXOJywmj5aSiy1c/ngMGZB2FrC/QJjiy2wAywDc8WUwAgM7d9xIWgEW9w
	 FTHnBWfcO8WShcof6TH4kHiJ9p7Iolfx4QIyMb8svcjc7HDVdn+yTC5IwOCr+l78t2zLi
	 c4FOk6Hfmckp19QBxzCSO1tTvEZR2lXe8AcHdIJ/8Rv6S1BAyLCZJS4dyR9SmTflBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vzY41+Cp/yjYeEoD+jjYQ0c3s6HdUuoj8US995hKomA=;
	b=RP467oajlWR2VlNfDXYsxOJ3d1ojwMpp6BrCeOi4GUUyhiZn01e0ZtxJmT+NdmT7FzuW
	 oQlpqoNZbXZCJh7I4hwmAKQkJ2s5T2J8SMky8/qRPbJO5qLOcA4fX0+ZEZgix/I77QDM3
	 VvvuBUQOfzgUJ+nCr5NLWvL5dyhU572YCPFw7+r1PDB/e+rUd2xQCDt2bltcARDxKWpdr
	 SPnd7VwYRkZmp/ONT7y7HGSfW7+4NLdeVyt41f66Y/D8F5HW4J3t9n53QYAlgRClP8HCa
	 rmc0iLlt4xj1FnkNYAQsB1hO9WCHJ6R0tfMrPspA2gfNJX6vShQd1MO168LwdUL/RJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbhkFxcU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD8606A329
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbhkFxcU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3AD1F031E5;
	Tue, 27 Oct 2026 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793064365;
	bh=vzY41+Cp/yjYeEoD+jjYQ0c3s6HdUuoj8US995hKomA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cbhkFxcUKH5J2oT4G9Kms16lIkkdMvARqCHl/Qx5xVHCPYDQBfBSRFtMgRHHgqzap
	 AqBdpCdNyTR+shVz/q4cbD9rAcjwQe7Sf1mvdvmWGVfYEs3AXvamIDNII/ODZl7ji4
	 qfXsm4ABQ7hmYXgHDxQwc5Z+Go3B680U6h4BSgAbMnoGq7l1cvepHmqhoovoIqUOzS
	 mlSbBZ58vI8Im8er1ybXuooFtw+fj84B7pdWBOX8A8WVVz3F+E2BJlG48mgW1kzxkx
	 tMlpIBKr4iJZFGE15/aFy8dhmhdsoLyCCI/bfSDVu4SoGN/hpJ15fuWOd/s5XWclIu
	 qLVmMQH/SoMfw==
Message-ID: <sashiko-outbox-185979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Filippo Falezza" <effeffe99@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
References: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 01:26:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Boards whose controller has no SuperSpeed PHY set
> qcom,select-utmi-as-pipe-clk, and the glue then programs QSCRATCH
> GENERAL_CFG so that the core's PIPE clock domain runs from the UTMI
> clock. This is only done at probe.
>=20
> When the SoC reaches its deepest state in suspend-to-idle (CX power
> collapse), the QSCRATCH registers lose their contents. On resume the
> core is reinitialised with its PIPE domain unclocked, and the gadget
> does not come back:
>=20
>   dwc3-qcom a600000.usb: failed to enable ep0out
>=20
> The link stays down until the driver is unbound and bound again.
>=20
> Remember the property at probe and select the UTMI clock again in
> dwc3_qcom_resume(), after the clocks and interconnect paths are enabled
> and before the core is resumed. Move dwc3_qcom_select_utmi_clk() up so
> that it is defined before its new caller.
>=20
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-dwc3-utmi-=
resume-v1-1-ca9f0aa65783@gmail.com?part=3D1

