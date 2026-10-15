Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C880346E51
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033201; cv=none; b=AL8QWOpYix1CEi++dhVHD5Sl7xo+Ue9CiGSD+pUJUWBwrwdUz2PuAL+qo0mAh/R/ut4jBx2obnqnmhbAqEUTg580OvR0kLmxr9WRvu2en8JeGl5GNYbGdV0BT3zkdgR3EdSaj7a6tpS1E1XCmEoMLdKrA3qSFvS0PLgu4BxzZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033201; c=relaxed/simple;
	bh=+q2acnAI+X0VNg5tah3ehq1nWN+BKW3oi7/2EoWSCaQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WHWvLZP+cehseUYBQl2BOjvQyMqmpmpXIHczVR3YPmF+FCnlMKW6+kL/3z6BLIFChUbJrLT0HFl3spKnuv6IRF+dIZe2tQgjIZUnRvKQhK2T6eOOkTW4Nt5eFtlv7d/yVGLoGHTZyO3XyzH+QhLOfPWbmZHoQMGb1v5owtEfvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmyDk7UR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmyDk7UR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C9A1F000C4;
	Thu, 15 Oct 2026 02:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033198;
	bh=+q2acnAI+X0VNg5tah3ehq1nWN+BKW3oi7/2EoWSCaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmyDk7URou4faodweXLT5U5FnFWKNOzumoxl9A9IO2EtmuHZ6QzY9p+6L1Mwca8gv
	 DMzq06XPcpHlnTvxABluDGdHY0Jmq4YWC6sUG2PBmP8N2mpGhRrWkk6xl/1t1/0ZAw
	 McAgH/Q8nz9ylwVR/9Q7yzSvHsadja9m7WceV24dza4B6NnLiiQaiusYbkfWbFpCZ5
	 kookl1cbpzhVX8oU3Sezx++dbygYLo95lVN5S2LUw1H97dr8rYyqPjgm+vNNQSdBn5
	 y4dn6NJf8/Aw3UHZOng2OOYCYk3Sr4jIWZsRp1zTC6b/zvBsT+YF/AkQSfOjXHyWaG
	 h3+tm44So7/Fg==
Message-ID: <sashiko-outbox-172188@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Reply-To: sashiko-reviews@lists.linux.dev
To: "Huang Wei" <huangwei@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015025456.3927808-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
 <20261015025456.3927808-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 02:59:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> A USB_DEVICE() match on VID:PID 0x5345:0x1234 was added to the
> owon_device entry in drivers/usb/serial/usb-serial-simple.c by
> commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
> oscilloscope support"). OWON uses this VID:PID across multiple device
> families (HDS, VDS, SDS, PDS), so the broad match makes the
> owon_device driver also claim devices such as the VDS1022.
>=20
> While the owon_device entry is equivalent to the generic usbserial
> driver for kernel-space users, the VDS1022 is a headless scope that
> is driven from userspace over libusb (e.g. the florentbr/Owon-VDS1022
> tool), which can no longer claim the interface once a kernel driver
> binds to it. Prior to that commit, no in-kernel driver claimed these
> interfaces.
>=20
> The two families can be told apart by their interface descriptors
> despite sharing interface class 5 (Physical): the HDS200 series
> reports subclass 0 and protocol 0, as documented by the HDS272S dump
> (firmware V5.7.1) in that commit's message, while the VDS1022 reports
> subclass 6 and protocol 0x50. Match the full HDS200 interface
> tuple so that the VDS1022 remains unclaimed and stays accessible to
> userspace tools.
>=20
> Reported-by: leStoppe <lestoppe@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220193
> Tested-by: leStoppe <lestoppe@gmail.com>
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015025456.3927=
808-1-huangwei@kylinos.cn?part=3D1

