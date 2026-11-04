Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750440;
	b=MMxdgFXm+YAP/z5iQHTqKEqUFrTwxi9RFfFrzj0N9Fyd426IeB7lWHHzfWru4xaKmGru
	 qLQYcoJIk7743iaJaC4RJV2FQjOGfdd+G3eZgIE8I5Md/dAyIpqg2iEoFZs5m6EG2ZLLT
	 9F8fpWoh1d7j780c0A74c75Wm31lmsJXKJc9yq0INtIRNyLktcQ5AphjgspTwnffXQaxm
	 GFBTZ+cQd4ekRxkyxb4HJONwHEiE7mo0cAUYlwDQ16c++bgKtL73ZFqpdA3kcAYNhDFpQ
	 xvF2Ia9EeBMj8poAWQqFDmIYARngqMr6yfYW4LPxn737I83Gs00BYlqsmqYzcDodBnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750440;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l8f61hDTUmSz7gSMvEkWtc2CbAt6BzmONfviYXfm4XQ=;
	b=Go1Gd0qptineL6fL4LNwKKwhrkhswWHONV8+QB1VIOzLut29f+Cjs7aAKxgDH41vsCVm
	 +0DdRTfxkVkU/b7o+TUfUXjebrA8sfIzm0Cm8eEPY+jZsYbPOnrujlQI7v2vxjPL9iqSK
	 FJ2YMgGDISeIi8QmGPiLmFkaCa3tf68DUxM6fglQvMgNly3eoKMcpGPtnEUJQ0kI3HMIn
	 SLSovhv2VH+zvrMVmyC2afd2+p2Llchlr+ofIUzvNeKzTvtb/i6qOoui5k1nPNZOxe1nz
	 SmUxNoQ9jXJ39HrAhrv02vWj5IpZbxc7m+eMMZEQaBExO0mCbBy1dC5kQbPyVYYSZjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wujl+Xu9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B6606A324;
	Wed,  4 Nov 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wujl+Xu9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125C31F000C1;
	Wed,  4 Nov 2026 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750439;
	bh=l8f61hDTUmSz7gSMvEkWtc2CbAt6BzmONfviYXfm4XQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wujl+Xu9J7IBvFnCDFxD5W2TROtXEbFEKWfM3DIgl9Q56ZWPWL7zQZpW4t83dB0zl
	 tBG6mI4OVgf34j557vPxLW4fyvRWtwIflqLQkjn8WIQ79xKHTBcvRelB6XIIG23OeT
	 INsJJiD5g5puUVVrzqvmO/H4Eig2hziaqEnUokofaSp6ZroUqNtjk3obcSKt3Ve1/7
	 OtOQUfypp8mtcPM72mIW+7q76U2puXpD5b5VY6aQUM5MYoS7uXP0yNjrSpWUA9YcHA
	 WGBZ4Hak0KusP96YwFTsf7A3SYdMvRcXt3CKrLwHo+AX8Yu0CrgMZMbPcFowKWLLEJ
	 BC268m353vWRA==
Message-ID: <sashiko-outbox-196266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap
 on 16K+ page kernels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261103-16k_offload_v1_b4-v5-4-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
 <20261103-16k_offload_v1_b4-v5-4-67184126e91c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 00:00:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ALSA: usb-audio: qcom: endpoint and stream leak on prepare_qmi_res=
ponse() err
- [Low] ALSA: usb-audio: qcom: missing card_num kernel-doc in enable_audio_=
stream()
--

commit 7b2fd8f864f08004dfcddc27ca3dd72dfea2f7d5
Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

This commit updates uaudio_endpoint_setup() and uaudio_event_ring_setup() to
add the scatterlist intra-page offset to the QMI-reported IOVA and use the
scatterlist entry length as the ring size on kernels with page sizes larger
than 4K. It also returns the raw page-aligned ring IOVA from
uaudio_endpoint_setup() so prepare_qmi_response() can cache and unmap the
exact IOVA that was mapped.

> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_=
offload.c
> index 48ee551160044..dd904d72baddd 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -1178,6 +1178,7 @@ static int uaudio_transfer_buffer_setup(struct snd_=
usb_substream *subs,
>   * @card_num: uadev index
>   * @mem_info: QMI response info
>   * @ep_desc: QMI ep desc response field
> + * @ring_iova: returns the iova the transfer ring page is mapped at

[Severity: Low]
This isn't a bug, but while updating the kernel-doc for
uaudio_endpoint_setup() here, earlier in the series commit fa22ee4117b1
("ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation")
added the card_num parameter to enable_audio_stream() in
sound/usb/qcom/qc_audio_offload.c without documenting @card_num in its
kernel-doc comment:

sound/usb/qcom/qc_audio_offload.c:enable_audio_stream() {
/**
 * enable_audio_stream() - enable usb snd endpoints
 * @subs: usb substream
 * @pcm_format: pcm format requested
 * @channels: number of channels
 * @cur_rate: sample rate
 * @datainterval: interval
...
static int enable_audio_stream(struct snd_usb_substream *subs,
			       snd_pcm_format_t pcm_format,
			       unsigned int channels, unsigned int cur_rate,
			       int datainterval, unsigned int card_num)

Should @card_num be added to the enable_audio_stream() kernel-doc block to
avoid a W=3D1 kernel-doc warning?

[ ... ]

> @@ -1470,7 +1486,7 @@ static int prepare_qmi_response(struct snd_usb_subs=
tream *subs,
>  	resp->std_as_opr_intf_desc_valid =3D 1;
>  	ret =3D uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
>  				    &resp->xhci_mem_info.tr_data,
> -				    &resp->std_as_data_ep_desc);
> +				    &resp->std_as_data_ep_desc, &data_ring_iova);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -1479,7 +1495,7 @@ static int prepare_qmi_response(struct snd_usb_subs=
tream *subs,
>  	if (subs->sync_endpoint) {
>  		ret =3D uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
>  					    &resp->xhci_mem_info.tr_sync,
> -					    &resp->std_as_sync_ep_desc);
> +					    &resp->std_as_sync_ep_desc, &sync_ring_iova);
>  		if (ret < 0)
>  			goto drop_data_ep;
> =20

[ ... ]

> @@ -1578,15 +1592,14 @@ static int prepare_qmi_response(struct snd_usb_su=
bstream *subs,
>  	usb_offload_put(subs->dev);
>  drop_sync_ep:
>  	if (subs->sync_endpoint) {
> -		uaudio_iommu_unmap(MEM_XFER_RING,
> -				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
> -				   PAGE_SIZE, PAGE_SIZE);
> +		uaudio_iommu_unmap(MEM_XFER_RING, sync_ring_iova, PAGE_SIZE,
> +				   PAGE_SIZE);
>  		xhci_sideband_remove_endpoint(uadev[card_num].sb,
>  			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
>  	}
>  drop_data_ep:
> -	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data=
.iova),
> -			   PAGE_SIZE, PAGE_SIZE);
> +	uaudio_iommu_unmap(MEM_XFER_RING, data_ring_iova, PAGE_SIZE,
> +			   PAGE_SIZE);
>  	xhci_sideband_remove_endpoint(uadev[card_num].sb,
>  			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

[Severity: High]
As reported by Sashiko on v4 [1], does a failure in prepare_qmi_response()
after enable_audio_stream() succeeds leak the xHCI sideband endpoints, the
prepared USB audio endpoints (and their ep->ring allocations), and the USB
device runtime PM reference?

In sound/usb/qcom/qc_audio_offload.c, handle_uaudio_stream_req() calls
enable_audio_stream() before prepare_qmi_response(). Following commit
fa22ee4117b1 ("ALSA: usb-audio: qcom: tag sideband endpoints before ring
allocation"), enable_audio_stream() calls snd_usb_autoresume(),
snd_usb_hw_params(), xhci_sideband_add_endpoint() for both data_ep and
sync_ep (when subs->sync_endpoint is present), and snd_usb_endpoint_prepare=
()
for both endpoints.

Inside prepare_qmi_response(), if an early check fails before
uaudio_endpoint_setup() (when !uadev[card_num].ctrl_intf,
uaudio_populate_uac_desc() fails, or !data), prepare_qmi_response() returns
directly without calling xhci_sideband_remove_endpoint() for either
subs->data_endpoint or subs->sync_endpoint:

sound/usb/qcom/qc_audio_offload.c:prepare_qmi_response() {
	if (!uadev[card_num].ctrl_intf) {
		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
		return -ENODEV;
	}

	ret =3D uaudio_populate_uac_desc(subs, resp);
	if (ret < 0)
		return ret;
	...
	data =3D snd_soc_usb_find_priv_data(uaudio_qdev->auxdev->dev.parent);
	if (!data) {
		dev_err(&subs->dev->dev, "No private data found\n");
		return -ENODEV;
	}
}

Likewise, if uaudio_endpoint_setup() for subs->data_endpoint fails,
prepare_qmi_response() returns ret directly without removing
subs->sync_endpoint from uadev[card_num].sb, and if usb_pipe_endpoint()
returns NULL in uaudio_endpoint_setup(), jumping to exit skips
xhci_sideband_remove_endpoint() for that endpoint as well.

In addition, in handle_uaudio_stream_req(), when prepare_qmi_response()
returns a negative error after enable_audio_stream() succeeded, the error
path only resets subs->opened =3D 0 without calling disable_audio_stream(su=
bs)
to run snd_usb_hw_free(subs) and snd_usb_autosuspend(chip):

sound/usb/qcom/qc_audio_offload.c:handle_uaudio_stream_req() {
	if (req_msg->enable) {
		ret =3D enable_audio_stream(subs,
					  map_pcm_format(req_msg->audio_format),
					  req_msg->number_of_ch, req_msg->bit_rate,
					  datainterval, pcm_card_num);

		if (!ret)
			ret =3D prepare_qmi_response(subs, req_msg, &resp,
						   info_idx);
		if (ret < 0) {
			guard(mutex)(&chip->mutex);
			subs->opened =3D 0;
		}
	}
}

Because xhci_sideband_add_endpoint() rejects endpoints that already have
ep->sideband or ep->ring set, won't any subsequent offload attempt on the
device fail with -EBUSY until the USB device is disconnected?

[1] https://lore.kernel.org/r/20260909-16k_offload_v1_b4-v4-5-f24a86617597@=
oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-16k_offloa=
d_v1_b4-v5-0-67184126e91c@oss.qualcomm.com?part=3D4
