Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750159;
	b=uv9PAB+OgKN7UooMWdSVIsY9YOHm4oIWQ4V1+xJpGinQFmoc+tDS/r0YwmvBPpEMd7Wj
	 LIBqOELorHRguMaMSydK7+2Y6eun7LRLk+yZYax12B7IP0MaUt8JW203bAIk8ykChcTp2
	 pRdlxUbl8PSiqRll7kzra/Dh++LDI7FR0ehlSA6qU1VWTAXJNbmKbB8SOh3PvLl+CJ6D/
	 5zoQ8Jvb6mqDJirfGfmCDwwDeXiPQvNs5Q2KjMwrf5/UzgquMJV+2hil3MxCmvypCGvPH
	 UD7jpLQmphFnvi+rkAqLtLvcCMAPN4PaNV/ft2gjWKZL9xo8cNqHR0A9EK7zkAS2KQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IgRjvC9eGJRSt9FCn+oU8QsB+KTmHQqlgzImOzb3+uo=;
	b=06Si6XN/fDjZlQDTjoICnUo8J7gT1RspjM6HTxYiidEGGqrqwOlS/JOaTPB9UcGIdgpU
	 dKVHTJ89ALkodlE4tcLFKh/WcFwFauMkcChzQuMpnRCrdBjZS0wIr4JBIvtADm+0toZvZ
	 +WooWdkgVqkdzCcxKpjbLdNJpfiSk4DQob1RLkFDNRFoTUTtdnNLnOuMYI5aNYk3EvP3O
	 Qfy2IgGwflhpv3YXSzolsxIGEgUL4S/r0gT8kWSnFtMty5gdF+xZpK4VbWn2a4e9l5Ksl
	 SNUn8m7qmwmY5L3yPGHoZjjHZ+6VC5Qvb4FgrYdhSY1ArWPm4ujbX0iSbzTX+NOlcSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8Eueczj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CB606A326;
	Tue,  3 Nov 2026 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8Eueczj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D211A1F000C1;
	Tue,  3 Nov 2026 23:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750158;
	bh=IgRjvC9eGJRSt9FCn+oU8QsB+KTmHQqlgzImOzb3+uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8Eueczj0WOvLuGlnz0j6hFuD8oSmG8uwj3twKL4UJzCdmvAG+TaAiihDlYIyCXpX
	 PGAq8Umg66y6FRFksHH7a+0dcW01eLwhZ6ga+OhvZW0yRo/CfQsL0a3PgmndBInBMg
	 dnod7aPWhWjvUIrNMP5+waa+fjRAV+/6Mh5Bxau1XKQevb5HjaokH4ro/l9mVMUDgJ
	 kpwICfqx4YWUsPLYtFOLhUWEADB7w3/cyYdm6c+UyCfocumbHNQbHOaYFoxrjMvFEH
	 tyHs/RLx/M6pdXTtizgr/aJu/pSmDdolrmEkZUC1DZ8c9tAD4VwP7kbDvyeTkD2jea
	 O7m/2zEfjErLQ==
Message-ID: <sashiko-outbox-196255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261103-16k_offload_v1_b4-v5-3-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
 <20261103-16k_offload_v1_b4-v5-3-67184126e91c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 23:55:57 +0000
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
- [High] ALSA: usb-audio: qcom: sideband endpoint leak on prepare_qmi_respo=
nse() error
- [Low] ALSA: usb-audio: qcom: missing @card_num kernel-doc in enable_audio=
_stream()
--

commit fa22ee4117b1447d736029e2816192b5570645e6
Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation

This commit moves the xhci_sideband_add_endpoint() calls from
uaudio_endpoint_setup() into enable_audio_stream() so that endpoints are
tagged as sideband before snd_usb_endpoint_prepare() triggers transfer ring
allocation. It also introduces uaudio_find_host_endpoint() to look up the
usb_host_endpoint from the altsetting descriptor table before the interface
altsetting is activated.

> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_=
offload.c
> index e4bfd43a2488b..48ee551160044 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c

[ ... ]

> @@ -958,8 +992,9 @@ static void uaudio_dev_release(struct kref *kref)
>  static int enable_audio_stream(struct snd_usb_substream *subs,
>  			       snd_pcm_format_t pcm_format,
>  			       unsigned int channels, unsigned int cur_rate,
> -			       int datainterval)
> +			       int datainterval, unsigned int card_num)
>  {

[Severity: Low]
This isn't a bug, but should @card_num be added to the kernel-doc comment
block above enable_audio_stream() in sound/usb/qcom/qc_audio_offload.c to
avoid a W=3D1 kernel-doc warning?

> +	struct usb_host_endpoint *data_ep =3D NULL, *sync_ep =3D NULL;
>  	struct snd_pcm_hw_params params;
>  	struct snd_usb_audio *chip;
>  	struct snd_interval *i;
> @@ -997,15 +1032,45 @@ static int enable_audio_stream(struct snd_usb_subs=
tream *subs,
>  			goto detach_ep;
>  		}
> =20
> +		data_ep =3D uaudio_find_host_endpoint(subs, subs->data_endpoint);
> +		if (!data_ep) {
> +			dev_err(&subs->dev->dev, "data ep # %d not found\n",
> +				subs->data_endpoint->ep_num);
> +			ret =3D -ENODEV;
> +			goto detach_ep;
> +		}
> +
> +		ret =3D xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep);
> +		if (ret < 0) {
> +			dev_err(&subs->dev->dev,
> +				"failed to add data ep to sideband: %d\n", ret);
> +			goto detach_ep;
> +		}
> +
>  		if (subs->sync_endpoint) {
> +			sync_ep =3D uaudio_find_host_endpoint(subs, subs->sync_endpoint);
> +			if (!sync_ep) {
> +				dev_err(&subs->dev->dev, "sync ep # %d not found\n",
> +					subs->sync_endpoint->ep_num);
> +				ret =3D -ENODEV;
> +				goto remove_data_ep;
> +			}
> +
> +			ret =3D xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep);
> +			if (ret < 0) {
> +				dev_err(&subs->dev->dev,
> +					"failed to add sync ep to sideband: %d\n", ret);
> +				goto remove_data_ep;
> +			}
> +
>  			ret =3D snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
>  			if (ret < 0)
> -				goto detach_ep;
> +				goto remove_sync_ep;
>  		}
> =20
>  		ret =3D snd_usb_endpoint_prepare(chip, subs->data_endpoint);
>  		if (ret < 0)
> -			goto detach_ep;
> +			goto remove_sync_ep;

[ ... ]

> @@ -1140,14 +1210,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *su=
bs,
> =20
>  	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
> =20
> -	ret =3D xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
> -	if (ret < 0) {
> -		dev_err(&subs->dev->dev,
> -			"failed to add data ep to sec intr: %d\n", ret);
> -		ret =3D -ENODEV;
> -		goto exit;
> -	}
> -
>  	sgt =3D xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
>  	if (!sgt) {
>  		dev_err(&subs->dev->dev,
> @@ -1637,7 +1699,7 @@ static void handle_uaudio_stream_req(struct qmi_han=
dle *handle,
>  		ret =3D enable_audio_stream(subs,
>  					  map_pcm_format(req_msg->audio_format),
>  					  req_msg->number_of_ch, req_msg->bit_rate,
> -					  datainterval);
> +					  datainterval, pcm_card_num);
> =20
>  		if (!ret)
>  			ret =3D prepare_qmi_response(subs, req_msg, &resp,

[Severity: High]
As reported by Sashiko on v4 [1], now that enable_audio_stream() calls
xhci_sideband_add_endpoint() for both data_ep and sync_ep before
handle_uaudio_stream_req() calls prepare_qmi_response(), can failure paths
in prepare_qmi_response() and uaudio_endpoint_setup() leak the sideband
endpoint registrations in uadev[card_num].sb?

In sound/usb/qcom/qc_audio_offload.c, prepare_qmi_response() has early error
returns before uaudio_endpoint_setup() that do not call
xhci_sideband_remove_endpoint() for either endpoint, and if the first
uaudio_endpoint_setup() call for subs->data_endpoint fails, it returns
without removing subs->sync_endpoint:

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
	...
	ret =3D uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
				    &resp->xhci_mem_info.tr_data,
				    &resp->std_as_data_ep_desc);
	if (ret < 0)
		return ret;
}

Additionally, in uaudio_endpoint_setup(), if usb_pipe_endpoint() returns
NULL, it jumps to exit instead of remove_ep, leaving that endpoint register=
ed
in uadev[card_num].sb:

sound/usb/qcom/qc_audio_offload.c:uaudio_endpoint_setup() {
	ep =3D usb_pipe_endpoint(subs->dev, endpoint->pipe);
	if (!ep) {
		dev_err(uaudio_qdev->data->dev, "data ep # %d context is null\n",
			subs->data_endpoint->ep_num);
		goto exit;
	}
}

Since xhci_sideband_add_endpoint() rejects endpoints when sb->eps[ep_index]
or ep->sideband is already set, wouldn't any of these failures leave the
endpoints registered and cause subsequent stream enable requests to fail wi=
th
-EBUSY?

[1] https://lore.kernel.org/r/20260909-16k_offload_v1_b4-v4-4-f24a86617597@=
oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-16k_offloa=
d_v1_b4-v5-0-67184126e91c@oss.qualcomm.com?part=3D3
