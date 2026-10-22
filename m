Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675902;
	b=feZjCTkMcLb2IKI3eYyhq/CkwUN9VhjhlDelCWSqc9Z5QKHWA+TAXiGKUIMD9f67dNl7
	 SaRccUTsvs5CZujwCKhmvCKEGIsaDG5hlgNZ5MwZvjh+ajYAFOaxuuW4d3ZhfotZA52Mp
	 0m0LA7JYczDXs199dY8SU7RHJpZmcX1hhon/lxe9M4/2KGXnut6MBys8DG7r+s6zlEwIc
	 zKolwkVmk20O49n86oV/xvEIQfm9tbV0WEGS76CmqJNXi07KsE5LCJWSMNrOjdMhuwbZm
	 BEjhZ/6+FcDpVReD2v+GvGg2IiqssMVp8TcE0Tg8iW9nUEIMUEV1Rdz17XlKvsSJjdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=licjKEGbIxqH2Fd12jgENFIPiBy9mgDOIWo1zjuB26E=;
	b=NCOq02Y2SvBujPNXv7lBHJcojQUFk4d7IVERMmWYRAsjHG02Utaqn83CO3WVSxmVOLO0
	 B/imBEGD3MIIUM16ftUy9Mg4N42ZnQidQ4s7THxspLE6bOR6UmX1W5xwshUglSd8a6xRx
	 XJ0pm4nrspHDJeEVyaHAmLHlAT6t+iLlEgUM4AbTp+o3LVJGakB3b+hWaJH5uHzDbZELf
	 czq7qExRgPTdIZvgZefLCOiP13OAx77YHoOFS6cUup9d575TYIaWqoAJbDd8fwJevQ7D4
	 eR+dEN1HJnqdGzlNgOUSO0iq/bAgh1Kunhg77TKdnI8GUX3uAjdCm4VdL0FebJxDPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsKjuhH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B81606A335
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsKjuhH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2CC1F000C2;
	Thu, 22 Oct 2026 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792675901;
	bh=licjKEGbIxqH2Fd12jgENFIPiBy9mgDOIWo1zjuB26E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsKjuhH23iydCVU4nhR9HvGy5ZhCCfzZBudOmBM0L5F3m0EAFSabtACoXxN5C/ClA
	 cOXGBUlsH9WSQZLyIv+ZOsTQir+7DHXc88vepoCYlqWcfNsUr/62uLz/5scN2VOWav
	 FdQRQbMuqas1vIIKVgrm4qiCy+q2HaXE+m1E9sNZlIt0077ZXXsfAQTE5jMetS0iAN
	 hCNHd4JlqeDHv3ur8sljir5iVXSjdSOgzpl1iVqSJde9nw3o3lfj8vBfmOiw1o8Qba
	 ha4MJEN/xQdhwZfbfubdBMq965qScC2gqCT9jfR7sggf1tjCsQjwmjDDuNcaPvtEUP
	 pgQRZ30HIEWOQ==
Message-ID: <sashiko-outbox-181541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022-hpd-irq-events-v6-5-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-5-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:31:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> events to the DisplayPort drivers.
>=20
> The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> preventing extra cross-tree merges. It will be removed once all
> drivers are converted. The drm_bridge_hpd_notify() function is kept for
> the drivers which only care about the connector status and will always
> pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D5

