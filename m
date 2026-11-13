Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553019;
	b=xodBje+UwgbfrUEzZPH1VZhip5L5Ehv3RlmmdPw0hFYoLWBjMd6P2PshkHqRb9IZLEPY
	 CbTTLL/Hh7cmaJcUUbwgihVmDBTfhVGg2Wfmxln7fRFdi1OWPz3hB+p/SriaV3wvtTDnp
	 Io+bJ/LCFkBIRu4k8gVE69jR99DHaZiQ+KEut2XCtaoRfTU9rORFdOdON8yqXAJ4NALGI
	 p/nBIIqzinAfGlNIe7+qqdApS+D8QLNDl4DWtMufbT5t/mJ9EBYjksr866bQetTxoW2kp
	 RuyvcSGFhMmuDicSOKuPS7yzklDstS34edrakq2IgRxiOq8xwGa3pgNUFgs+S4VNhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553019;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w/FH0whPa8EKzYRc42r9Cy1QbSWLhQECzOW55cvX9zg=;
	b=Iw8JZMK42BCdiIjXfrgloRChRhCFDFYM0yfO+sOUFEX4VJDPosdSPXAOLl2EqHZKAJLT
	 vY9YTwx28zMZsWy691wUkLLCnhQ6QVaOsRkr4Lzpi4ikNUNbm0xthCt2aqKacsVJofs2H
	 fycwwHEfHq5uabDYQns8jgJMxdI9b5GrC8siB0+3KCG2jFEMdE6yWVvuSf9/oGjgUrG+H
	 5isGiLMWM/KEnzq/ogdZk4R+S9p+4AZEhGaDG7x53aSPkjCX5s7zPn6jkxZo2VFz8sUwE
	 YutxqRZNM5zGqpbfC82n1iYKWeA+yrl7a+MNlCQGKtPpSAxGE9ULOa/w7PxEn7rVBkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvIeFjsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D8606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvIeFjsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAF01F000C4;
	Fri, 13 Nov 2026 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794553018;
	bh=w/FH0whPa8EKzYRc42r9Cy1QbSWLhQECzOW55cvX9zg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HvIeFjspUMsHYCJKjUGw+yrFalqWi+xvv5MBr6JgHiMzDA0Y0q0X6RiiWHposTh+p
	 9xsccHEbTNfASrs2AC6v29wRODwSPUcvkSSkzNm8BseBi+5l6BlneDo7Nf5Sa8O/UA
	 9B+nTFTS202Q5MsVRh07QYAET8TypMLUbKRqfCyRUstPvv9FTegNYDQK57bTz94P/y
	 cnSG2m7OAsR7VUpMROtR/1dB/pvi6c1vNlqoJXAKHOvZ/3pSgA7HJiln0kvxVSlYVU
	 nKC1kiXL3u6FTVTAU1LC41u2o+iqiB7cSlokm8yit4ATYT6WJbE+6AdzUTmNpEGfG+
	 kmR7nO/BjKxKQ==
Message-ID: <sashiko-outbox-212300@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] usb: musb: cancel the delayed works after
 quiescing the interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261113063409.47485-2-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
 <20261113063409.47485-2-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:56:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> musb_remove() cancels finish_resume_work and deassert_reset_work up
> front, while the interrupt is still enabled and the root hub is still
> registered, and cancels irq_work only later.  All three works can be
> armed past their cancel:
>=20
> - musb_handle_intr_resume() schedules finish_resume_work from
>   interrupt context (RESUME in OTG_STATE_A_SUSPEND, via
>   musb_stage0_irq());
> - musb_hub_control() schedules finish_resume_work (ClearPortFeature
>   SUSPEND -> musb_port_suspend()) and deassert_reset_work
>   (SetPortFeature RESET -> musb_port_reset()) from process context,
>   and the root hub is only torn down by musb_host_cleanup();
> - musb_stage0_irq() schedules irq_work, which can also re-arm itself
>   from the session recheck path (musb_pm_runtime_check_session()).
>=20
> [ ... ]
>=20
> Suggested-by: Neill Kapron <nkapron@google.com>
> Fixes: f730f205cc51 ("usb: musb: Split PM runtime between wrapper IP and =
musb core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113063409.4748=
5-1-lui2012qwq@gmail.com?part=3D1

