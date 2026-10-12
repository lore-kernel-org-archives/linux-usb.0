Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6D4BD78D
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826100; cv=none; b=TDB1gV6bFpdZPUs1HGsskBFlIBwiOQcKuCbU9GGXbZFxJkbW3/32Eu4R8mxIrDmn0cmC2dw5fdXOLtlnXLkui1cQrQsvvEJFvtjM41RiogrWBXIo/FyfeDMZoC12bgR3uHc+5+JUB/1ljkz1BuZrbUzhjtGBihlJlG4A2TlGeeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826100; c=relaxed/simple;
	bh=OPUmrK8e4h1KRBA1vWMaF/XyoyGc8zLR0RJaK+04Bvk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aw80b5uGpwdcUkAtJRXYFmqMEsLPZgqFp5/BtcH8vZA26sVA6LM1NaO9LhN5N++iYMW0C6/dCytKT/G0HQ2FhYPx9Fid/FGiAJ4y1e4RZg5FZuHrJZLfcXS6ge5zPilKe+nAp9b1sc6CxAfSRwlfEcV1ab/qoCZpdwHHYxhnn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZpE2a+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZpE2a+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6159A1F0089B;
	Mon, 12 Oct 2026 17:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826091;
	bh=OPUmrK8e4h1KRBA1vWMaF/XyoyGc8zLR0RJaK+04Bvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZpE2a+1U+jXFBt5wzTc+8aB8igdbIPZY+91sTvgspJZVydXnTPmeVgfc54sWh3UF
	 /HHNtdwsAkDvm/SnUhJbBBOy5C2prPDGEUtkBQCa1fJlBXBI5d4mD3dOW7VutoSBBF
	 Y7BW3AHYdzbEctp2hTbbT0eOvvRzRzRXRQrnBpu1Ob5CYTiKNg/uvMNzuAlCoWqhqc
	 C+Ff7htRuENgLG6+8x7PynPc105oN6Gqn+sN8+MFo6chbUiHN6XFiFf6b1by3Nmish
	 TMDkzM0+wS1g+3pY2hkx/SGmAdqVjSO2D4Yx4BkSls2FgKXGQsKwlVHsEDFbPp1S4Z
	 NJ0OhkMFNiA3A==
Message-ID: <sashiko-outbox-168454@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabien Sanglard" <sanglardf@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012171609.88273-1-sanglardf@google.com>
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:28:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> When an interface driver is forcibly unbound before a device reset,
> usb_rebind_intf() attempts to re-attach a driver once the reset
> completes in-place. Normal kernel drivers rebind and emit UNBIND
> followed by BIND. However, usbfs only binds on explicit userspace
> requests (e.g., USBDEVFS_CLAIMINTERFACE), so device_attach() returns 0
> and no uevent is emitted.
>=20
> As a result, userspace clients like adb only see UNBIND and must poll
> /dev/bus/usb to detect when the interface is ready again. Emit a
> KOBJ_CHANGE uevent when device_attach() finds no matching driver so
> userspace is notified that the interface can be reclaimed.
>=20
> Link: https://lore.kernel.org/linux-usb/CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_=
BXqhXeWqQyFx2D4_Mg@mail.gmail.com/
> Signed-off-by: Fabien Sanglard <sanglardf@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012171609.8827=
3-1-sanglardf@google.com?part=3D1

