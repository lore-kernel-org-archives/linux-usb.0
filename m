Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678285;
	b=0C30tNwWLK9PCtn6nFqAYZr8VslzS76YlgTW1ONc/82n/ssVC4LPefK4G+klUU1pCmc4
	 +RPkZw4X6H/6hQbX9kAmoQvJ+SGNoPK0HvCLNhujoBP5aKORyJjxjAMH1QMNF0YnXD0/w
	 fPpUeIzwfN45wMqZcwWMj+TdyDutex9RDTm72NePF2XKvWHi5OO2CJRUBS1zL1BTdEdvK
	 0JS7WZV2VYeUpLSUWvwDVHHXCQqfHAyEYpfWD6f3AScIfx3tbHGIWvqiEX2vfDFvuV6NU
	 IZ8hEnEmesShxxlgCYii8sganXQkVYovJB8jpgd+6NZ0SdKJI0PcOrfdyjpKHSNMXiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JdVF4J/xeDJ+vm0XSq2zM5G4AMpcnfbtHxSgyklQHT0=;
	b=Z/bXDOXR73fEWxVJcpa0aoGsxE9TO1kpdi3zMH4+hJ1YF/A7PE++WE5zHKwCbYGb12QQ
	 dEk4KDPovowZfg+E4kausY4pDH9xfIkLufXoxytKsd6z04AM0WlEgae+2KfXjkyA30MO0
	 CFjI+P95IbN8+XbLQGU2vpONcfqdoMSjR6nGZzDskDrrD+x9LIFPH7Sh7OPPBKEfKGIBQ
	 oTOvgyXyvYbGEW3zD4d956rDDgxb+vTtOy5wIV3sF9iTIL4OaNkk30xqyNjDq8erlgTu8
	 NYGwf3xtMU5mGiVkNRRSwXVNYkNvGN+elFqSAFg/fmiEMFFc4geWv1SGqdtcv9BE+nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4VvD6p+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB01606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4VvD6p+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102FF1F00A02;
	Tue,  3 Nov 2026 03:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793678285;
	bh=JdVF4J/xeDJ+vm0XSq2zM5G4AMpcnfbtHxSgyklQHT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4VvD6p+6O7A7j1v3Pf0E90e9Y07T66TCVGr9z/XFGFGlqmDL8QtCbYg3Q8cxrmx+
	 8zwgTRksb4hhMXb4EOlX3e6ZWYEzq1cONp2QWgPwZwo+u69H42HMpqPXG2yc2S+Ets
	 Z7IZQ8PrtCjokTrWDarxgO5XHdFNQusrRM2tWw4U6mA8IVPD7YBBDi3cLn+3LbL1zI
	 A1QMtVBGW7j0PP+TVahvW3aoqftZ1wbNlGpOBsF+kNiJ5181S4O6RIgwhobB0CgfIT
	 L0yLsrRbh1XrAlEKQZCqfy6SCN47Pac7aP9IfJXgKrnLn0rBAVViCeydS65NO4DxpV
	 dnF4xeXHwOH2Q==
Message-ID: <sashiko-outbox-194553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: core: clean up before handing a device to
 the generic driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
 <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 03:58:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When a USB device driver's probe returns -ENODEV, usb_probe_device()
> hands the device to the generic driver. It does not first undo what it
> did before calling the probe. This causes two problems.
>=20
> First, if the driver sets generic_subclass, the generic probe has
> already run. It configured the device and sent a USB_DEVICE_ADD
> notification. The generic driver then does both again. Notifier users
> such as the usbport LED trigger see two USB_DEVICE_ADDs with no
> USB_DEVICE_REMOVE in between.
>=20
> Second, if the driver does not set supports_autosuspend, a runtime PM
> reference was taken before the probe. Nothing drops it, so the device
> can never be runtime suspended.
>=20
> Clean up before handing the device over, in the same way as
> [ ... ]
> driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
> sending USB_DEVICE_REMOVE would mean unconfiguring the device.
>=20
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when availa=
ble")
> Signed-off-by: James Clark <jjc@jclark.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793669297.gi=
t.jjc@jclark.com?part=3D1

