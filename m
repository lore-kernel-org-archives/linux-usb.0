Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114496;
	b=s0BT0L9JmpAZ2bLgm87uUgQbSZqVyft/FnhAoJ/9l6CM6JPkLbVz1RR3cIjb/FAsRUp0
	 EJYdDabJHZgb89ZfD+/adwGsXdeI2ayeUsg5vaYC/I1yFvUUQ+U1m/X1dU9laI6JJu+3b
	 0iozlPHoMoCrr0/JnAsDVLFoK9bB0sJNI8Y2NaOaOK1QgfiHNpy6T+oJCy1ZwGxt7APG6
	 hrtx+wzMNzpu0FciymDoJ1aNtVx2KOmbZOut641mONt5v9ZioF0XAYTVkCsZaSitRTnHK
	 dvxEZdGtwXY9A4v+E1EutOXkp3zXEYrz9fNTrFekuzaf9UN1of6kD2o130F/A2Vy4AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:References:In-Reply-To;
	bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
	b=KpTqh62mA5c4+xb5rt4gfQBpPFcLt6t0T9vvtyrBzWCT+Eafmgw3Babfv9bdDPjxsxNI
	 MSgHOQpi+UzKxSOi72JjtXBiX3MR6jEEjxWelWQ0gKIkG9nV5VVOINwT9wKSw11ev8DT0
	 upmlw2mruNK6XdYGCnAypyTRDYtmLxl95mk6klIAQqv/8MehfPeC60xS5Pdi6vvopncS3
	 xPFgw1nJ7cAfGJT7HcXJAzHLYy/1dcv7tYjChN3V34v7cQQ3z+pwRIqJm2lBdLNpHJQy5
	 CZM0jiUBn2uWjDlUaR+GHUCtcvJDdA4YywaVQLBdHr72i5iFGHJEYRHE6E8ubX2nh4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mycwa3Lj;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332B606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9332B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mycwa3Lj
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c498fa2f365so317872666b.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793114494; x=1793719294; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
        b=Mycwa3Ljz3PMgTATSXkD/0igHVvL5QzqIzwVGRON1FfP4vtsAaxBwW4R2GJjRa9PmT
         p8YpXPLssxVlFE+0z9QXDHSOQGvdYFIZjbDa/ZOKYVpIBNZn5XZGH8Tf4RBXz00iGc5R
         7B+zvlRG9QZYfPyHkjVJh2tSstM60xE64Ma0I2ftMAlhoZUdw+1119D2OeMjMd5gdFyW
         CUa660yqsHdT9ZNAcmDi0370RIjt7/+fCy3cJ0muReqWsjOBP21UTbrE1fZBU4/uyPmi
         EtLWPXgehhd0gYNn+wvuGoA1fUubpLUo7vaUXB8RhQ9HxHVnZUWkRgaX4dmEycR88M3P
         Aexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114494; x=1793719294;
        h=in-reply-to:references:subject:cc:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
        b=kUNkEy1J6HbkrdJrPS+eRxDyxIxTuO/FDpb/MJKk+la3s7ZpS0VW69appVjK4p6NNd
         W1JFgiAc2fXMTpk8cGRrVQukZu4iXDA3pKvqZElk/47gt+EYFsHy9gz2AiI6dDjiu2ul
         XZg64NQGPFFcZmewhfV/vtZ/vcovhFuZuyyHarqoYgp+Z/xxLyvCWvBe4t8zl66It7Oz
         LnB7BD0ua78T2mFIaPOm7YUxvd8YmG8TD230rJABtIIHx/Mbn7YIHf197wed1b9fmo0I
         HSamxeVaXtwaGXXGj3EzrSOonhT2WSdPSR7iaUnvcczTiJEM8pv516UdZIJ7vNjPjU3a
         Q92A==
X-Forwarded-Encrypted: i=1; AKwUvBzhrYd1eNbP8kWSrJauQVkivLQ3RXP3p6zd7he3DvRtW2Rkpk1XFUKkbZrR8HnQxpG60i80UweyCME=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvdG/FOhxYkxEkCPXfq5bMJGy3zSOoyf7R3uMSsJc3oTsdBjbA
	wt+lodC3QwUst+EAbDXfhCnXtty1Yiz/0fx40ZN4slnXHVPgXQ3TQsV2CrHQVei41fk=
X-Gm-Gg: AYBFou22WY9CuskGhm4CO9lNXTI1yxeO+AwRlQutiiG4wPbt64ZqOr29nu/IfWM0cEt
	svrPpORy7lBs81Bmu80dOV0TAu5698ODtjDmVFFc6shOypHT/fVz4WHKdTVUSPBTnHHjU6fTuUN
	S3BJPP3ovcVALk1CqeIAUes/VSQTzq8hOBday5PGNjIvmGsai/DqFAhfjvu1Ppsm2bmdX5p14EL
	NN3tA2cEx4NyTQwtzmX3e2QBhs2KB4HyMKjblk3tWrANwo5kqQeubbGO898LZAiuqIaMA3Q+d5Y
	yElyOyplZ+fYlyt+DjscFwFcTkVUP3q6KJcFR7CNpary4zoWgc6bgjxSMNq3V35UMtJlc1jVB0l
	Yn045jOxRMCnlpIyiYgNvon9AN8ilYszlbOyUso2YY97csUQyDIEgMoX2VSjSrJt1Xwq+5Mxj5b
	fhYf2YvyKYPGbxS0wE9GnEcwqndw50uZF3aNiEpJKHXW+8ycKCTOSgte9n4KHi0MVFonfGLw6/6
	njpS+doxQGWNl7Wqf5BmkFmS1LzXSBhP4UAVI2oxZfTh6Ye45pv0+Be
X-Received: by 2002:a17:907:97c8:b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c46bdac62famr1094811566b.6.1793114493665;
        Tue, 27 Oct 2026 08:21:33 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:17d2:d825:e2b8:2e8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm24538097f8f.24.2026.10.27.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:21:33 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:21:32 +0000
Message-Id: <DMFQ1DZZPBFX.1XLHN38PX92AF@linaro.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>
Cc: "Alan Stern" <stern@rowland.harvard.edu>,
 <linux-kernel@vger.kernel.org>, "Josef Bacik" <josef@toxicpanda.com>,
 "stable" <stable@kernel.org>, "Rui Miguel Silva" <rui.silva@linaro.org>
Subject: Re: [PATCH 18/19] usb: isp1760: wait for the TT clear in
 endpoint_disable
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>

Hi,,

On Tue Oct 27, 2026 at 2:57 PM WET, Greg Kroah-Hartman wrote:

> From: Josef Bacik <josef@toxicpanda.com>
>
> The driver sets qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer()
> when a transfer to a full or low speed device fails or is unlinked while
> it is running. The hub driver stores urb->ep in its list and
> hub_tt_work() hands it back to isp1760_clear_tt_buffer_complete() after
> the CLEAR_TT_BUFFER request to the hub.
>
> Nothing keeps the endpoint until then. isp1760_endpoint_disable() frees
> the QH at once. If the device is unplugged, the unlink of a running URB
> queues such a request, and usb_disconnect() goes on to free the
> usb_device and its configurations, which hold the struct
> usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
> and, if it is not NULL, writes to whatever it points to. A change of the
> configuration or altsetting only frees the QH, under a callback which
> has loaded ep->hcpriv without the lock.
>
> The HCD has to wait, like ehci_endpoint_disable(),
> xhci_endpoint_disable() and fotg210_endpoint_disable() do. hub_tt_work()
> calls the callback for every entry, also if the request failed, and
> hub_quiesce() flushes the work, so the wait ends.
>
> Fixes: 74ad60292bf0 ("usb/isp1760: Clear TT buffer on interrupted low & f=
ull speed transfers")
> Cc: stable <stable@kernel.org>
> Cc: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Yup, LGTM, thanks.

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
> ---
>  drivers/usb/isp1760/isp1760-hcd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1=
760-hcd.c
> index 6c52c6f59d69..3cbf5fe3ed34 100644
> --- a/drivers/usb/isp1760/isp1760-hcd.c
> +++ b/drivers/usb/isp1760/isp1760-hcd.c
> @@ -2071,12 +2071,23 @@ static void isp1760_endpoint_disable(struct usb_h=
cd *hcd,
>  	struct isp1760_qh *qh, *qh_iter;
>  	int i;
> =20
> +rescan:
>  	spin_lock_irqsave(&priv->lock, spinflags);
> =20
>  	qh =3D ep->hcpriv;
>  	if (!qh)
>  		goto out;
> =20
> +	/*
> +	 * The hub driver still has a pointer to the endpoint. Wait until it
> +	 * has called isp1760_clear_tt_buffer_complete().
> +	 */
> +	if (qh->tt_buffer_dirty) {
> +		spin_unlock_irqrestore(&priv->lock, spinflags);
> +		schedule_timeout_uninterruptible(1);
> +		goto rescan;
> +	}
> +
>  	WARN_ON(!list_empty(&qh->qtd_list));
> =20
>  	for (i =3D 0; i < QH_END; i++)
>
> --=20
> 2.56.0



