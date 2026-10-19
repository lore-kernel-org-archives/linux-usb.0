Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD894A5C3C
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401323; cv=none; b=T4zRbB2q7IeITC2VQ6x/HWH83+8KtPBZK1kzMOeDRL+H9iMxaVlRUvHPHQXCwEarsjHWU1amI7HAgBHRjO5OHXphpp3jzjv1xz1o6u/gmRz7BFJPa7PKaJEZHYm5LVFJfe6hOpLQUBpV4fl3XevchwpCzrH0SeVsIs0/rueitF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401323; c=relaxed/simple;
	bh=8QzVpGOxY7RsSTHfVDIeRHiKOZoscJKXYDI5drYJvnY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=baiqLQSlni1bZ1BpUtI+3SvK7A570nVZFWO5V7oWqNQ6CIH0opgaXwSPUUEToHcv88p+o7OJB0s5Xe6yR3BT3kfKr+yLklw+dsfV4i32YeeeTN7zf/xIfgQCL8pdUKDo+eGsZDII8cAsCBKTb8XVHQDazSZBFNLd2qirOZ40OfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqoLs7ZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqoLs7ZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8982A1F000C4;
	Mon, 19 Oct 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401322;
	bh=8QzVpGOxY7RsSTHfVDIeRHiKOZoscJKXYDI5drYJvnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqoLs7ZUQkYHc9DqI4frDoiJ/maoFbphtVx+DR1o+KmE/RE/Q6cSTKpiatrO9RYho
	 wQzQGh7qy9X4lAmlfDgJE7IZS2XlVRpowTe/UduPXxjQkWBHwr+vwlPc4w3nPTyZRc
	 PONTY25gOW6BUwxTcA8bIMVPnjRusizGqA4choGTJKpCdLc5VGT9adVVWDFLuz+ugo
	 nb9seApkYDKC1nOCdL44QXhMphg/l2h0Y1bKI6sU53wPx2Hll8l5potWbJEIjvASjU
	 2TgjmBYVrfc8hQ467wQDHOmx8Zu3P4WyNPwir4cQBXuBSODzPz7+8Y024WXqNSkZ4x
	 x8IqJdymJASUA==
Message-ID: <sashiko-outbox-176883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: u_serial: implement flush_buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019090904.3264978-2-mehmet.fide@gmail.com>
References: <20261019085855.3259716-1-mehmet.fide@gmail.com>
 <20261019090904.3264978-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 09:15:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> gs_close() waits up to GS_CLOSE_TIMEOUT (15 s) for the write buffer
> to drain while the gadget is connected. When the host does not read
> the port, for example because no application on the host has it open,
> the last close blocks for the full timeout. tcflush(TCOFLUSH) cannot
> avoid that: u_serial has no flush_buffer operation, so the request is
> a no-op.
>=20
> Implement flush_buffer: discard the buffered output under the port
> lock and wake up the close and write waiters. As on other tty drivers,
> a hangup and an interrupt character (ISIG without NOFLSH) now discard
> the pending output as well.
>=20
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019085855.3259=
716-1-mehmet.fide@gmail.com?part=3D2

