Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F039DBF4
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012151; cv=none; b=AwGJPUWARQt7IVBxWOyo8DSpw/EQavkjYE4R63af429/yw+u17aXBXEEUUx3NfxDM5lKJeRyqjSvTszxKGQ3nepudTDVCJTc8LdYJnnUUc2+mnnABse7T9dv8EEa5BTE2YuJMUqIvx52SA1w8czhR5uC1gwE9kVwt5fSzjTz2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012151; c=relaxed/simple;
	bh=FLo61c/RF3vVLjPzHbo/QsqKls5/lxm5pjrTMOhfWp8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hg0VQOt59//7Pl1FDkWyPysriisx3NsRj25ioKPZYBdsL+/8QSdd7KzMfRTREaoEJgfK7tHs7kN4AegJkAGQPfbJxfgM3QpsMKOXjY2dmzSGS/20OGroMI9LObEzVxT1gHZMswRxNuhZe8nE2Z4JDwkVxyMHvDLIKWO+6kjKmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck5s8YMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck5s8YMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129E41F000C4;
	Wed, 14 Oct 2026 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792012150;
	bh=IgsYY96SqkZlu5ffWpdKVfTZHwd10aNshePDnul9bhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ck5s8YMCmWYWuAzIu9QOMjr+xwA3QQyTehrOkLUOl0btUzD52i8Y6WDUIzPhnUokU
	 i6MhvK/7Vd/4XkipAYe/CDz3zzeZzqsfRx9CFZtuMOP7NMimclacsUVzbN3MeK+xgD
	 SzQJ7BT3vra6ig7CvJP1Obhh03ws8ZYuXOyhuh6OiTgU+NmaAGJ5yVgokwiQoBYhGV
	 cXIz3Kvcya6jEX2D8WhARJxyq4lk8TQIA19bdYshT1Ai2iL9ABnIvTSIiRt8BKjNHn
	 kYFLgnR32bGPeOWECVtEgotWwwOww1tvBRiv/YnZjbdir8SQH6m8aMaAZox9RfJgAo
	 Gut1Ml4Z3K3Tg==
Message-ID: <sashiko-outbox-171920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: sysfs: show product, manufacturer and
 serial without the device lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joe Finzel" <joe@sudmix.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-usb-string-attrs-v2-1-c5cacdad7094@sudmix.de>
References: <20261014-usb-string-attrs-v2-1-c5cacdad7094@sudmix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:09:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Joe Finzel <joe@sudmix.de>
>=20
> Reading the product, manufacturer or serial attribute of a USB device
> takes the device lock. A hub holds its lock in hub_event() while it
> enumerates all of its ports, including the debounce and reset delays of
> every child, so a reader of the hub's strings waits until the last port
> is done -- seconds on a hub with several devices.
>=20
> udev reads these strings for every USB device (the usb_id builtin, run
> from 50-udev-default.rules). Its worker blocks SIGTERM, so when systemd
> stops udevd in the initrd before switching root, it waits for that
> worker. On a desktop with a few hubs this delays every boot:
>=20
>   i7-13700K, ASUS ROG STRIX Z790-F, four hubs with HID devices behind
>   them: udevd took 1.7 s to stop, while the hubs were still enumerating.
> [ ... ]
> USB product/manufacturer/serial handling to RCU"); back then the strings
> could still change under Wireless USB.
>=20
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Joe Finzel <joe@sudmix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-usb-string=
-attrs-v2-1-c5cacdad7094@sudmix.de?part=3D1

