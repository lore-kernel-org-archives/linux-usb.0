Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647232;
	b=L+rTzO+XyQE/If1pg0sAMC9FEdJZC5kRFYovZLvro82iv+YYDqUK02HrWm8Wz3fZ99Ya
	 CBK9GgQ0qaJcQARJulPn6DvY/NZ2sg9N/7gsbfXByIwUbTCDuDy21lZbQCcLJ7pJxejGA
	 MOuTKgVO4Cl2XJtsXu7dVttCZNacJjEv3o105QfbqhNM6V8Vj4o0uyR4p5ED6r/dBllK4
	 7Hm4pOD8EyPbB1r1zPPSdeySW4XGH7Uxml2oeBECj1Tj84kzf1guA8oY62IxZ9Qak6k6P
	 JdRpbqTdjatp5aR94vpHaf7is5OWHoIuKqDFRlY3eZlO+gdvDZ+Aw1/ycswm9ZpXpGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647232;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qXRJidCDHnr0j0zDHwrOJes44kngcHLp+tYykqG8OkU=;
	b=jcKC1OYGc8sTJ8LP++hGs6ycJqOktkKuh88hBVNRvzDoekmDk2K03xpebV6bOnZj6RxX
	 0f7L0E0+egh+h0y6y2qK6arCWYCF/Y0eHKZr/fZyG6QjZ2N2nFTiLaYDPUVjYwUHVG2vB
	 nY0lLTsIhEr+1gj80l9E4BOxFpemFri6Wj58/EuoeVqsClhv8dc4etpMYtOHmkFYTvflq
	 j6KsOhaFR6cljGjBR+SrfOo7ii6o/vsQCcmlalp7RpTbRUzut6FSKVEgH1n2kYvMOowrB
	 XqkGW1yfypdUxyhqRdbqCDSxBR3hvUpEukaD+K6w7henqsEuEvmWac8ub+HBZFWjerg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCOfd3z3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18791606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCOfd3z3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C861F000C5;
	Thu, 22 Oct 2026 05:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792647231;
	bh=qXRJidCDHnr0j0zDHwrOJes44kngcHLp+tYykqG8OkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCOfd3z3MYM9Ixilk1XQevoNXmCBLoR6QMJuHQ3holgL+T80H1GJykrTigfLs7LR7
	 gn/7d+F7cO9ePAgcyadpuMm7qezjCQIKAjVXybhBlnxn28wAlDtzoq6fIa3sS6FCHB
	 QWCrwCmwuzn0GeI/JdL7KrwXiaNoHYMbrcVDeX22tNLF3h+aLhyCzCn8KcBtA6K3bD
	 DTdyzDuPVEPMfas0swrXMXGIqy4IuNptDHMhMZG8mxvDVCL6xBCa31WeYV8vDQfMdz
	 qce2JU0kYqDJEvCFRpzeFc3U0LN5rHWNRFZQGcYWlpxGKBVPw9tWX9Wo3XUjTZ0S4W
	 M2E7nAp/AsS6A==
Message-ID: <sashiko-outbox-181034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
References: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 05:33:50 +0000
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
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022052602.2335=
652-1-prashanth.k@oss.qualcomm.com?part=3D1

