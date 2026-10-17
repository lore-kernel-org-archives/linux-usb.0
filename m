Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316C490BE8
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239313; cv=none; b=r0Jg514ZnKD5fd9ytihys7lvkEkXRzbLnXoU/bF1PYGZryKasB/BQf3jB0BU8lagXvWI7ZP3j/9fsadD+qTbPNiTRxi0wIrO7Kkj5swNs10T9cHSmFm6zzEp/UhRAtWIakvOf3xrxFgiOxiElCwT9rax+zsYOEZrghhxDA4qvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239313; c=relaxed/simple;
	bh=Z8Fe0Llv5/JgdmUPm5M9V9lp3NkbjV5zebZVycCTkX0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gMAZz4nXTR4HwKhrWJSBkt4TI5Mw8Qd4alK4yNZchRQIWfwmju6WGOnRlEP+5WuaN4BPYvCvb3hrjRf07vMsU7ksZf8SNaTK5MpZdgrVNEERuPoOVWA/lQDJmbBegZmPD8GwZTEkvjUqpEDd6CicGol6iChNIob8nvukLC5fxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9J0NPuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9J0NPuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BBC1F000C4;
	Sat, 17 Oct 2026 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792239312;
	bh=Z8Fe0Llv5/JgdmUPm5M9V9lp3NkbjV5zebZVycCTkX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j9J0NPujr+Cx5Xuq4i24eqgfv4oxLHRrBLbcvyMTw9PiuTHynuAD/K/C6QMb3KBaQ
	 pZ22LagGgq6eSqWbQ+0YolFU41IeyrSIhro4lzyi5bQuByXTsV+krLltP4+PZBdrlq
	 dXuWmMNhPJtGua6rGm4ZnUwsmu2mhdgYIIbk+q8e5AkLXB4MInjTMQHibOsug3BC/s
	 qHe3EwZIJPqfsJbfgh0xIE+185Ev40kTZ79AU3liieC9Zpw22YRG8w97Lk840ssPdS
	 KxI/P3OQh81Ske31/y1+x0XUmxeCm2WvVn/Ctmfr3oSXyGrBL3leKcPuYNKTLAHp20
	 A5OXeuAsaxMfw==
Message-ID: <sashiko-outbox-175503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: garmin_gps: explicitly stop read urb on
 unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017121019.1777984-1-johan@kernel.org>
References: <20261017121019.1777984-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 12:15:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The garmin_gps read URB may be submitted from the interrupt URB
> completion handler and should therefore be stopped after stopping the
> interrupt URB and before freeing the port data during port unbind.
>=20
> When a USB serial device is disconnected (or unbound through sysfs),
> USB serial core stops and poisons the port URBs before unbinding the
> port however so there is no risk for a use-after-free in the read URB
> completion handler even if the driver does not stop it in its remove()
> callback.
>=20
> Stop the read URB explicitly for consistency, to avoid relying on core
> and to prevent false positive reports from LLMs.
>=20
> Note that this was erroneously flagged as a use-after-free by Sashiko.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017121019.1777=
984-1-johan@kernel.org?part=3D1

