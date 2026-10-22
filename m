Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644795;
	b=Wr+MqfLwUS/BYo6J9ReqwFQWz9pc2g5uv9WMMgbdPQvRnBqG/o6NtkVA8/DTHPuzMKcM
	 PxC/dcb6KPDTqh7pVItd8hrSp7Kmj6xuulWIg6nn3K6xttAKGilzZQ/DHN4xpQ5E47HGc
	 Dd1NqWcK5U/oAfnZ30WjvooursEx4PkpEeJQRgsVXOGZt54cG9T4nmGGNeea5B0kKToyX
	 +QrXx/0W3jTbKDvpIChbpm9MrjsmNNbsS72HnxU/pxnuHoYIeokfaFQDupi75OZA/SCm8
	 BungN592650BUGx/nh0U/l5AuFAHUn1jL12CxGlPuP5I+heTiRXiNZjTYQTyVwLamrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644795;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1+odFfFZlL+satvyqTFdDgbODjbOiEp395vgIB4l38M=;
	b=cswm6KMXw9ITl6d8tS1MP6MyH7DWH6obPoLRsfoRgjpylM8Xlqjy/xd/4+ncodeVhw6c
	 zqV6A6CLPqT1SdwuK7+zv+9InTGejGHymlK5K+5gEpndQEAo/kSDKDemyKa/c+BFjdBCB
	 LZ/omIG4PA8Tr7OUo76jF7n3+pVBw8iIeGgRQaYrCo0n0a9fve51Yrtx47x1Ne+82hpkB
	 HcePg/NvGDVUqTBCTCcWA5rRoPqIZthmy7lN2klvsJfUjni8v/t/nWjs4tnQeP6AtBJ9E
	 jn387p9LCE6YOYHfWFcMGoafq2TomzNhoh5jROrfHrW3Cr3IgndJuASBEtQjjsBoOLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RNO1y3/e";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24A606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNO1y3/e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFAF1F000C1;
	Thu, 22 Oct 2026 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792644795;
	bh=1+odFfFZlL+satvyqTFdDgbODjbOiEp395vgIB4l38M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNO1y3/emaIHZug3m9CAvVVTilY2BoJSqmvhGkGoy4JbBXFyeIH37CEu/oJeHq5cZ
	 Ka5ZPuqUendte9VzI8SjcmkPkZ8IOiQKt0h6uaKmESjJq+ZQAQ/pRu0Y7Y0uX069u3
	 L6nuBrjQKnAJ7gKXdkurCIfLlfM+qCXq7AuYU7QLcDnmUlEa8/cgHAb9rd2oAMV1Pu
	 y3dOWBks6cSgSF0f/L9Cvxo2YP+lW/3GSttVAgTL+0T2qbDvGlYLoeSxjB5YBGlQZ5
	 Paep8oS9mNxMUBFJ1vREstfw1bU3ttwENkavP1MONwc3AeecWb5mU8tG/iUX/0ERw/
	 8Y5XIyoaNweIA==
Message-ID: <sashiko-outbox-181008@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022044748.2303528-1-prashanth.k@oss.qualcomm.com>
References: <20261022044748.2303528-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 04:53:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: dwc3: qcom: uninitialized udev pointer in dwc3_qcom_read_usb2=
_speed()
--

commit 9364e775b526fa295084d32e8e9579d5847360c6
Author: Prashanth K <prashanth.k@oss.qualcomm.com>

usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed

This commit checks whether hcd is non-NULL in dwc3_qcom_read_usb2_speed()
before dereferencing it to avoid a NULL pointer dereference during system
suspend if xhci_plat_probe() failed.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..6ca51d37c35ac 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -241,7 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_spee=
d(struct dwc3_qcom *qcom, i
>  	hcd =3D platform_get_drvdata(dwc->xhci);
> =20
>  #ifdef CONFIG_USB
> -	udev =3D usb_hub_find_child(hcd->self.root_hub, port_index + 1);
> +	if (hcd)
> +		udev =3D usb_hub_find_child(hcd->self.root_hub, port_index + 1);
>  #else
>  	udev =3D NULL;
>  #endif

[Severity: High]
In drivers/usb/dwc3/dwc3-qcom.c, dwc3_qcom_read_usb2_speed() declares udev =
on
the stack without initializing it:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_read_usb2_speed() {
	struct usb_device *udev;
	struct usb_hcd __maybe_unused *hcd;
	struct dwc3 *dwc =3D &qcom->dwc;

	hcd =3D platform_get_drvdata(dwc->xhci);

#ifdef CONFIG_USB
	if (hcd)
		udev =3D usb_hub_find_child(hcd->self.root_hub, port_index + 1);
#else
	udev =3D NULL;
#endif
	if (!udev)
		return USB_SPEED_UNKNOWN;

	return udev->speed;
}

When CONFIG_USB is enabled and platform_get_drvdata(dwc->xhci) returns NULL
during dwc3_qcom_pm_suspend() -> dwc3_qcom_read_usb2_speed() (for example,
when xhci_plat_probe() failed), won't udev remain uninitialized and cause
if (!udev) and return udev->speed to read and dereference an uninitialized
pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022044748.2303=
528-1-prashanth.k@oss.qualcomm.com?part=3D1
