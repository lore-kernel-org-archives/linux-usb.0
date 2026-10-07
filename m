Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F074E5329
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400838; cv=none; b=p8HkBwIw5z9ncOkhHyR/ghmchLGkTs2ZptVHDK/S9tOuyquSnSpjFokE8IRO2nvsdtKrdIca/hYdjHT9xQpQB6P+cPjXdd4ETGk5h/35jLbShbllf8d1D3L33pWv3BGabLJr6eiDmxi8YaWc0Io3uTD2Mdwih1rKPEkPlI9Wy7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400838; c=relaxed/simple;
	bh=IxRY5wKGIJAouJlqIdnaOL8oKosqe4KZ4t6VTxeS/BU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nUsepj648N5a4MIBMDRgg9haUgJBQTk8YaaMzpWjRL8S2ZJZuBAuMmcqcSyvXtJ1DYDERbiurrUSxjxSIG7VlKQTPzOsT3dakVijsEH0jr8uMViIuZv7WRN1scXlW83z2T5knykuRw4rtrf7mpqKaybIqyl0YSIEYDZVJ++qd90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHNicjvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHNicjvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09D51F000FF;
	Wed,  7 Oct 2026 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791400833;
	bh=IxRY5wKGIJAouJlqIdnaOL8oKosqe4KZ4t6VTxeS/BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHNicjvfk8b0lND4sp++6ZSaIf8Rd0bHTb3sXN/gwRylf/gTWGQX9xlZs/RRDbMkU
	 YhdiJh6BD8mEYhaFLkFZwjzQtOLoHiDX2jkRHd4rgQzvI8Hp4yiBlWWcDcOtDLLnn0
	 jfqE/EV8ak3ahfq/cw6TVKUxLx6QJj1POq5R20kFBgxxQwoadI9FJKrNPvtvcC+E7m
	 UgCZn4DoY7cJrh2On0IU9e56nmnCesoXFC8NH5iZHFnL+CpYn50Y2T4vaRgN/xZt2B
	 YrMfybtj8qPaJtYXG7NzJtwPGOTRS8xdyC4f1EopfxNGtOUAmAslVSBkEioXccKV96
	 5c1mDKht//Ksg==
Message-ID: <sashiko-outbox-163309@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
Reply-To: sashiko-reviews@lists.linux.dev
To: "Giuseppe Piscitelli" <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261007191130.8652-1-ooonea@gmail.com>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
 <20261007191130.8652-1-ooonea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 19:20:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On the first insertion of an iPhone (05ac:12a8) after boot, an already
> running usbmuxd can select USB configuration 4 before the charging driver
> apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> driver that enables their higher charging current.
>=20
> USB device uevents have no MODALIAS. The charging module instead loads
> from an interface uevent. Its registration reprobes the device, unbinds
> the generic driver and calls usb_set_configuration(udev, -1), tearing down
> the interfaces and interrupting usbmuxd's transfers.
>=20
> Emit a modalias in the USB device uevent, using wildcards for interface
> fields because no particular interface is described by this event. This
> allows udev's kmod builtin to load matching device drivers while handling
> the device add event, before broadcasting that event to libudev listeners.
> libusb's udev hotplug backend listens for this broadcast, so usbmuxd sees
> the arrival after the charging module has finished loading and reprobed
> the device, rather than before a later interface event loads it.
>=20
> A slow udev worker delays both module loading and the broadcast; it does
> not reverse this ordering. This addresses hotplug through the udev
> backend, not clients reading raw kernel events or scanning devices before
> udev has finished, and does not synchronize later manual module loading.
>=20
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007191130.8652=
-1-ooonea@gmail.com?part=3D1

