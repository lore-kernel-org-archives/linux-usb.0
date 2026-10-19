Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C8C4E020C
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413936; cv=none; b=kNwyADQMjN39FNlU84o8zaQCdK0ZX+F7PWwkqbaPiRvY0OUFLHSVNv3jTtHMTxEc1f9BzkKcLL+KkbiKD8zAIq4PQzOTP+Y9w9ZCieHXhNG9wNaTUWUxPSjMvTqC7VeAdVV4uEb4DYLAk73Jd0qvkp+2Bbr/tqZrzxZhd7DwH1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413936; c=relaxed/simple;
	bh=P8OXpb4FdDidl/F79JYHw1GRCWlxLqJlZb6WB7bJ6co=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=l8Kmee1ZxsaMxL/tVHIwtWZttE+w5mLy+144tX6eRz824SKcuqalGesDLHKhT4BoCejL7xsoWeXBVHU/4WJ/ravmV1VIv/ktSiNeP2/MXbEgngzRxjG7d+afB6Zawcpu8ml34U9TdtfSfYGINEDlLXZ7YWX0kZSRGzP3TC49uUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHIer/1Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHIer/1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4845E1F000C4;
	Mon, 19 Oct 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413935;
	bh=P8OXpb4FdDidl/F79JYHw1GRCWlxLqJlZb6WB7bJ6co=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CHIer/1Z1B9qhSFpdKKHlIEItfvA3uRSv7UoCey6aLOFV0gvNH6tIO5rV3Md6rHSz
	 fA0HdLiwdiKPZs5uSTuPpoJxPlTLRRdcV1+eYHNXKbBZeg//9xEsXHSMv8RZLmEjBX
	 Ra8peHYFgdruPcOjU75tVa3EGJOJj1K6l9KQScfMzWx1nBs5jzD6oQ83oMLhwyJLXM
	 CdzQES7VkQ/vJv6vydxVWQf+mawUKx/SqCnLbgyytsiSSJRCsdweaa2nWjF+mPgkx7
	 blD49H5rlN3d72t+HGppA4DIDl9jeYqZyOW3BA1uleprTUJJrbdyls0qEDl1+lec52
	 edGijLw3lFNOQ==
Message-ID: <sashiko-outbox-177081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: dvb-usb-v2: ec168: Reject zero-length I2C reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andi Shyti" <andi.shyti@kernel.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261019123542.4040472-1-andi.shyti@kernel.org>
References: <20261019123542.4040472-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 12:45:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> ec168_i2c_xfer() checks the length of the register-address
> message in a combined demodulator read, but does not validate the
> read message length. Userspace can supply a zero-length read
> through I2C_RDWR.
>=20
> This reaches ec168_ctrl_msg(), which selects an IN control pipe
> for READ_DEMOD with wLength set to zero. The USB core treats
> control requests without a data stage as OUT(*), triggering the
> "BOGUS control dir" warning in usb_submit_urb().
>=20
> Reject zero-length read messages with -EOPNOTSUPP before issuing
> the USB request, using the existing exit path to release the I2C
> mutex.
>=20
> (*) is_out =3D ... || !setup->wLength;
>=20
> Fixes: 2bf290be4f3e ("V4L/DVB (13364): ec168: add new driver for E3C EC16=
8 DVB USB")
> Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ded3ada41c4eb1c4ab78e
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019123542.4040=
472-1-andi.shyti@kernel.org?part=3D1

