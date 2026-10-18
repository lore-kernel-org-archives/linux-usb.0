Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2874CF490
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 03:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293658; cv=none; b=kybBhAJsGEQh1f0wXFNRLBX8UQ3fZEXa8s3SXBlWyO4SategQ/ps+ifgcLGFnWwEY1TOOhL/eg7TeMPIZOcuq/7ZWUS5+UckGL+21Q7EDhkSHcEW/zsl5BNU7lhGrdKkRqkgdm4Igipz6Iu7EqDcJGXR1V7lr6QN1e31kXRCxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293658; c=relaxed/simple;
	bh=s2IgfqxSYylt5h37Us5diMb7GyCkgTVRuktHEs437kk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aaVX93WkwRjDlU7Xjm6hWh4mIku8enLk8TGNvhEcP0QhNVrQlAYWCDzMz/X2pXgP5bfE6yvRHcffmfFTSaW3O0ezZhPnCrYx7G8y4qWNTViVK2MNggBY/ubBiPg8juLYAujJV95s02cBTwT/oYD+bfr1XsLVtAh35Au8iZdP32M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9NcNFQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9NcNFQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832DB1F000C4;
	Sun, 18 Oct 2026 03:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792293657;
	bh=s2IgfqxSYylt5h37Us5diMb7GyCkgTVRuktHEs437kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c9NcNFQOh/zlbA9GP+poolidVMlNnHqu8mbcGJRGlLvAA8dca9hDe7bjHiykqWibK
	 at1rSkPr6Yhf3QAAzp8HqmU3vM0PkQIeq4Uq4ylN8dN/tqKPIS4GWALTl0e+tm+aEY
	 dUobKvXo32Z+5BsIKbwElI92OKXR9W+cpcllZyw/nJm0qSOs/6d6mCiFBOgmPIwi87
	 ZNXPyEnt0JvYHA7jcde9ul1rnB9pOJYGG8n0ha3h076mpfZlUUsFZU1zIJYZEPtvhB
	 Xzb9l5PNH/Y3dTyttu4wYldfE8gvNU5ytWZdTcKzb1B7Ug2DsrwFyvfvT3vCM1+FSY
	 KIMPYBhlhpaeA==
Message-ID: <sashiko-outbox-175904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: gpio-vbus: disable VBUS work during removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179229341073.3942822.17212567068599854952.gpio-vbus@gmail.com>
References: <179229341073.3942822.17212567068599854952.gpio-vbus@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 03:20:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Legacy users such as PXA UDC obtain this PHY through usb_get_phy(),
> which does not create a supplier device link. A sysfs unbind of the PHY
> can therefore run while the gadget consumer remains bound.
>=20
> The VBUS IRQ remains registered until devres cleanup, after
> gpio_vbus_remove() returns. With the gadget still registered, an IRQ
> after cancel_delayed_work_sync() returns can queue another instance of
> the delayed work. The 100 ms delay lets devres release the GPIO, OTG and
> driver state before that instance runs.
>=20
> Disable and drain the delayed work during removal so late IRQs cannot
> queue it again. This also rejects work queued by set_peripheral(), which
> calls the IRQ handler directly. The managed IRQ is released before the
> GPIO and driver state accessed by its handler are freed.
>=20
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>=20
> Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179229341073.394282=
2.17212567068599854952.gpio-vbus@gmail.com?part=3D1

