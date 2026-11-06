Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943418;
	b=AErqIGm4PV6ArbFcofc7CdiqA0CtIl0v7GIftQNKiTJxtcw+Cysq0b1E+WuJPnnoYauO
	 yu+cSh+1E9pFuh98lT6N/YWACNVDZVpSON+7b+GUDN8CLF/LpP7U++F+FizbS6WCsTgsT
	 aP9bBh78IrP4+2HhjwQds/pLGQZrD6GVEsjzCQKdbPd1R29awGFERjWd7JeqrsmNXmjPD
	 ZLc+Lj+3P0QbfU7THpeUJaOWBpZ4PAT82Xp6EOj8ZC1jZV3+H/6ulu0cS/s1SQi6HJsjo
	 JhQrWKngvBnDAth7c3SCgYdkb+Flx7Og72pB6baoKKuKelu8JxBglDJM+TlJIRm7I9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T93gWEXeUP8lRE7FWXoZl4nnry0vUnQlHVJSql12RzY=;
	b=y1XQWQ+AfwqhZVZF4NGbmIyc0pUyF/bWVUhQtzt5XqfDc5s1nvnoDROJ2W/4sj24YRTH
	 951lJlRxJ7fy1RFkwFyIW9bnhQYEul6ehpvGDKMsdc27mZm4Ge85Mu4T5HA2y2IktQ8SA
	 7CTQmKSIYyOUSIULBrQE2lsmfY4w4EQpTemGwxbYdVaTiZ+koVpla9UgHBxijZlCkkj46
	 jO08Fmc2a2zqDpQg4fMh84fkBJT1ibdlrQlbW+bltHLV79moKhVad+t3wv4y//TyJeyxc
	 PDT/TzcsfIyn6OOs5hI11h2xxwb6GKSiviExJtEyb1MCzJiFBP22TdW2KtcFrbkNd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neXdZyHA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D4606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neXdZyHA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2FA1F0089F;
	Fri,  6 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943417;
	bh=T93gWEXeUP8lRE7FWXoZl4nnry0vUnQlHVJSql12RzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=neXdZyHAjO59QkovYNCewzCCTH4Fc+dJpDGxPJ2z84HLjU9YDVyDN1RAFkKGJe2pb
	 s6yNl0jzUxSqYQ6LLhT6USYk2HE39oCU6Vhuypaq9vnu6zGvODgxtnFEVzvHPLCMwR
	 gX/EiaTrZhCTE7yBFOzh2gxqtUQUdWCsY9Yuw5xGOunBNlRZRvTveoag63csM1g4nT
	 9q8WmhlDHxcwC32bnt7TXtDILmtnaB6nDwq0e+JSTbJ3iVNfwIXzaTjGm4Cqx2Ez7D
	 cY4UkdmXmjsDPLyDY5zt1+wJiB9dkXJnTKGBMOPS9hB1yNgz6Vqu+5Qk8VJIgFVLU9
	 j8+735JYuzq/A==
Message-ID: <sashiko-outbox-200836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
References: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:36:57 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106051605.1398=
445-1-prashanth.k@oss.qualcomm.com?part=3D1

