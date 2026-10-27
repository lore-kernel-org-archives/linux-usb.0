Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111894;
	b=aNkTa8qxzt6T6RZ91GKzt6vzlAY0aJFl30vZ2Sx1/3FKrVT97QSoqWUbBasK1nJk40JB
	 i7IAIYaJgkBPfTl6obyXJfzNx6xjnmMSyrEmQTwn+MgPZ3b0QVNQgDWR+99mo65MEsk+b
	 61xCr7D5upAkMgmM+y2V/NI3LtI+q6h74DvXVBr9S6CpeMp9J3+1K8Ju9kEKNhXWY/mTX
	 tT7wffJCEzJIFMYcJzsCkjADVA/0lNUzKg3Z4AfyIgHMqKQ/v9hi+T93USxh7HsJf7ETU
	 4VF+5hCLd+ql+0z6KoKL01YE7nh37PpJS4aW26ETJvrWbYEuKybIQJ5KenfFw1mdf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MGBz51PWmKFtfmNneY0+04YcXLU+55ipwIqy6eNYGls=;
	b=zuC6IUBKDG58u5O14/IQ/s5BRpBOczeusr6f6b5v/gwp/Vh7NNLEvSuMDleJFVjaLQUw
	 KEfmHxk5JsJP0ubd6F5m7WXxjDP/ZfNXVIhkiQek/0lKN5RrEag/tzpk97MvCB3k6MlXU
	 i2L6sm79MTwP6hCvO34F4bQVia4Y+jGTUuPBanHiZMBWo/64hzYt7bMybusDpwxkuibrU
	 cR6VO0xjF0Di65EEEyyAKx6usBwtbRVprIehRBL4MVfJ80ESX3ZIQcmMuVRWePp6CyUfb
	 y/quZXjLiTtL+m0M06vSIMQVVNbesHEUFDkmePkNz2zbSTdIrYJ9+BOVwb5Dl/+LSPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J0pIVN/1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5FE606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0pIVN/1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26DC1F01825;
	Tue, 27 Oct 2026 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111894;
	bh=MGBz51PWmKFtfmNneY0+04YcXLU+55ipwIqy6eNYGls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0pIVN/1t7vohkLrdTebFaWR8+IMSqZrk9HWCW+x8YLO2yvG/FWM4ESuptC7mT9Hc
	 MZuynQszWQZXmuuciJWxcY9s4V0fQQyT7XBHoYg3Sk8BldRRsC/BTlyZb5dZkFMdas
	 A8OEcBu3ytDHsV7fzxKvo/CFdq/cvkZy+ABBnA4kUasDqq1nS3xXN6ip42QFfNzeqY
	 U4gNRIAo+0pU+Dgn4U7M9CcLlddByi1ltWQgZD7VQeOStOnpGqbPQO5bQ2Wg1RzCo4
	 j8kyArIlGOfCxgw5qxH9nUqEHJX9bXL++C2V/fbbEWu605yS8Gr+WW3d8tnhL2FEC4
	 0HAWiU7/kgUbQ==
Message-ID: <sashiko-outbox-186739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: garmin_gps: queue the device reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <2026102733-prayer-drainer-56f3@gregkh>
References: <2026102733-prayer-drainer-56f3@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:38:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> A private packet with the ID PRIV_PKTID_RESET_REQ that is written to the
> port makes garmin_write() call usb_kill_urb() and usb_reset_device().
> Both sleep, but the write operation of a tty driver must not: a line
> discipline may call it in atomic context, synchronous PPP for one under
> a spinlock with bottom halves disabled.  In addition usb_reset_device()
> has to be called with the device locked, which it is not here.
>=20
> The reset also unbinds the driver inside the write: the disconnect hangs
> the tty up, ppp_sync_close() calls ppp_unregister_channel(), and that
> spins on pch->downl, which the writer holds.  The CPU is lost.
>=20
> Unlink the URB and use usb_queue_reset_device(), which locks the device
> and resets it from a work item.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026102733-prayer-d=
rainer-56f3@gregkh?part=3D1

