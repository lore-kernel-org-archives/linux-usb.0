Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279343;
	b=QjPyFCsQ8FGqV5KZxhUIaa0LLbEFN63O7N82nMq+qPmAyEDI9Iv5odxijeV2G03d1/wL
	 EuiPxWrY/YDSSwQbhlr3yTITyx0fzDV+hPZkaDnV+53MJo9F9bi3vV/9S1wpgYU59hm88
	 gsEOmzPMHxessFpp5muN3TItCNd9DWn0GUE8ALlbJs8ztV5ldBDYCDz3CBPJXNnM6cWQJ
	 GLx+VqCMf6yfNbjGzAnzCFXy3qsxwUU9BH1L0LVD49te5s82jkfQ1XVK+/2FaKDJkwxNw
	 2TicY0dA+6ImPhir8nzfeBjgfYiXXUo7j7UNf9qPDrWxLwaQAGDPO8fpcnwKDxG71EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u//4hVR7QXoHGrjc/Jm6jQYjTP33Z6+lar/0WmKpFGo=;
	b=VlEQPuImJ3sFaiiJWeFRR5ETyp53KKG/MtbK46egs4v9ctu9jL4hN8x2tVjMIGF9kMP3
	 vlQH+y95Jm88iyzcjrxMNt0fT8MKA81+BVSCAMCiMWHlCn4Ppc3LdaJn0aVcaKRAY3cG7
	 rJMaG4mKccly9x51WhYOqYWUe34nVmBXf/Hpjmwa/MwhfWx/DCrdLgw3PVK/3FNND26Pl
	 7/CrsEF4mVjfXbGjFQsPmyPt/9bSBuC6GY9s4PVu4DyUnDXD0tsVgiY3WNiC/hKyMsE5i
	 WsEsHLV0r74YBtdWRWJL3s46pM85ThggF5dxvYnX4siCRTptqmxJX8723dhmyXxBGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMJkH99d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6A60A260C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMJkH99d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCB91F0089F;
	Tue, 10 Nov 2026 02:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279343;
	bh=u//4hVR7QXoHGrjc/Jm6jQYjTP33Z6+lar/0WmKpFGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RMJkH99dRwh2HkaZfi3PodLaiMl3zIjShFMZBGOwbrlsogpJyNTy1NZJTRg0uNrPA
	 8U1a1LteyKAthHcQP0SkpePJsuOVoXUvIj4HGc4FJogHb003XqHYvAiPsebiHRV0eW
	 mgbv0FxPBFb1/r0dkjfUYadzDV+zmnlktga8iLrcx28U6IOHSbxB+pUk7+qgqgfOW7
	 VyNNHTceGsHktV6oXlAVpwpCXCepWIMK0i/nEhLwQisY4MyNh0s9r2mruysTvGNhPX
	 KFwvJC4HtMu0TAvIrUtp7ErYUXNEWtuSsjkWmijHeK5QRG/ZUJ2ONFIdnzHX7OpXKR
	 ARbr725ccgawg==
Message-ID: <sashiko-outbox-206070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-16k_offload_v1_b4-v6-3-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <20261109-16k_offload_v1_b4-v6-3-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:55:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On kernels with a PAGE_SIZE larger than TRB_SEGMENT_SIZE,
> xhci_endpoint_init() allocates the ring segments of endpoints that have
> already been tagged via xhci_sideband_add_endpoint() with
> dma_alloc_coherent() instead of from the shared xhci->segment_pool, so
> the buffer reported to the ADSP over QMI is guaranteed to come from a
> page of its own.
>=20
> xhci_sideband_add_endpoint() must therefore run before the endpoint's
> transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
> triggers xhci_endpoint_init()) for that allocation to apply. Move the
> xhci_sideband_add_endpoint() calls out of uaudio_endpoint_setup() and
> into enable_audio_stream(), before snd_usb_endpoint_prepare() is called
> for the data and sync endpoints, and unwind them on the new error paths.
>=20
> Now that its only caller tags the endpoint before the ring exists, have
> xhci_sideband_add_endpoint() return -EBUSY if the endpoint already has a
> transfer ring, so a sideband client that adds the endpoint too late gets
> an error instead of a ring that silently came from the shared pool.
>=20
> At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
> populated, since the endpoint's altsetting has not been activated, so
> usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
> uaudio_find_host_endpoint(), which resolves it directly from the
> interface's altsetting descriptor table instead.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-16k_offloa=
d_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com?part=3D3

