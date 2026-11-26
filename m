Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670843;
	b=xytH1GafKzWeWEadi6yki+KTlxkaHNHnPgNwYZJ7SvWUOPGv/STsXZyEtK3CRCgW190x
	 mpETC0CVutATQd5EArXGHe14/+4d/KvCGwYLL9lFGgezbviGHsqFFiwGColZy3CbSXAxY
	 UwdOR2eM6IwaEiZEdfk6R5epdwQvQkjWCXjdtewu1HV3a9rfjRhJBn7C4FpLof/QBTw+h
	 dsrljJXaQjY5UEo1upp0OlUdbSNBNyeENgy/vyokMV5mBeo+1vlBSLkuaYq18/sLc3+/a
	 lQ9EeiQ3EJof2IgcuSjzlQmpJqGzmCzXurZASGShS3Ame1rjoHIwZSMk4b1hxJX2sdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670843;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VBnDw+v0kXn++Vki7VVr4hbIHoqusFed0vacOXEYH2g=;
	b=FtN+7f6RhKbELbmRX184zpS8JCVkSKwfKNiWZpg4brO+aWeuGAPVfy+/xr4ONAU4ug0m
	 qzKewRPVi4sXGzmzAJuvvgEg3Q+ZoSujJ1U7RV41JoPcYEeRM9pt9xZsjgnq1x5WSgI3K
	 R7+t6tGAQW9GEvhMyw0PdrpVHKfMpDtQ9ioNufi/MPZJwEH3/HiI7Fc77dv7GGcSEAjd9
	 SY9MX1jnBQtcaCus+4uo62wOK5wbXD+qfWcgE704d9Ec+3kTIWb0nCl/H0RYqgtNv/7Gx
	 p/hWFRbXCHjmVHlXjmzt2ZwUU16Wpyr8FdugadPyKaqgG+Qf51v9Gdj0ELRwQgJa88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LfPTAurJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B1606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LfPTAurJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62061F000C6;
	Thu, 26 Nov 2026 05:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795670842;
	bh=VBnDw+v0kXn++Vki7VVr4hbIHoqusFed0vacOXEYH2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfPTAurJt6CLTZfQJQS76WqAyQvEyExbbFmaeQv6RRj+KcxVGINgffVW4qD2+mCcs
	 Q71ey/yGYIzAMIXaB+ye4YBHNODBrTIrxFVf3MM1/dwFazJC7MHnAWHK+qt2GnUvax
	 S+f8M35YlwUE2GXRiImbey5AwAfObLMUOg5H3HDaEOCxvklPEs8Y0HIqlXqgBeMfH+
	 h589ISE9NPoBfVL3+6BopXCE5KmvAwKZSpTsLrBMjWKfYj0r5kA4v8rAowuWrtg9La
	 cLMkrQw6es2zSY9wVV/dAnkvt4bvgEIhA7qnGXLmW6dQPGBVwBVh5HSMJL7DjYYHwk
	 nZxtTECqY2Spw==
Message-ID: <sashiko-outbox-234787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126051958.2983579-1-prashanth.k@oss.qualcomm.com>
References: <20261126051958.2983579-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 05:27:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
> system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
> xhci is initialised. Since the probe failed, hcd will be null, and the
> subsequent access results in a NULL pointer dereference
>=20
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000058
>=20
> Call trace:
>   dwc3_qcom_pm_suspend
>   dpm_run_callback
>   device_suspend
>   dpm_suspend
>   dpm_suspend_start
>   suspend_devices_and_enter
>   pm_suspend
>=20
> Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
> before accessing it.
>=20
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during=
 suspend")
> Cc: stable <stable@kernel.org>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126051958.2983=
579-1-prashanth.k@oss.qualcomm.com?part=3D1
