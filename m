Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596143;
	b=1nFVoYmk62gXR70pvmbzQRetsnesmj/Gavd1YVfL8MKjD2KtFLIXmObd8YI19BwTjbw+
	 l5JJcHZoKztX6YqK8CmZXT+l29ny4cFzkCNsFMssdeDjR2O/IZ0Zb4GqhK3iyRdiXxyZr
	 hlWcnE3Jenx6zj3pD22AT/RRaW03tDj3AcJiNyhNAbFYzZaF6r7Kp7COUs/MSwWsHHN4F
	 tebOV2mius0qhd3xtrJlD3cFgcOwMD01Ty4Bav0/LyUjQNuvg2f/Gtj/uOvWOc0Vxa30v
	 PTQDJ5I1El9kNkIJmmPWteoH4ebp7JTpzO4aXxuA2Q0+UWzY75JjJ80uhTcKKQpF9vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bgr5S23eWkN15fZEYoQq8Dm4n2nKk9Yf5z78rp+Y1jQ=;
	b=5aXtRpD9zSRQFAz1cHkdfImlMrfrTvmz/fXUwu+IPZGaQbPQJaidEk+R4GXNEbOYfLoy
	 0LYhM/ZIkmS7ZI1Mrm/fdBjQ3PT2SAyOf9B+I2iej/RNG8WCPtLKXtvQk3pGVqmHJNMOp
	 OhqqYlqyMdex7l5PoWfv6j4rd94RXAxI+WcSFyVGXQVywFhdlWqqH30fEf6spJqGt+LFS
	 e3d3mjrlol+kdefHxkFXAmCOt3megkspsDB+bQ739W727G+BUZM2gwut3cfP2G7ss2vMV
	 e0Ewy3kxXEhdvTO9oNE8Ekzb+5nAvxEli/j1ed6u7yXx8LtyNpbZ+mYcgdcSgK3W2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ExDY2/Qu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4C606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExDY2/Qu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9AD1F000C1;
	Wed, 21 Oct 2026 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792596142;
	bh=bgr5S23eWkN15fZEYoQq8Dm4n2nKk9Yf5z78rp+Y1jQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExDY2/QuWHJf4BuyRfkYSRPDu/yqMpA+kQYQsxAOap69kfX0bbVhwW8LkVV7K8T8V
	 GHfJBmcLqKaipv3ejqW1GuQ2LmrCKzrPli5Ig4GyVC7npN+WJcg0ZbbGR7CeByqtg6
	 a3DdckNDOxhe+dt6dMl/ZAbr8ywCTwRavvLdKWRKh+XE/m5GZ60wg929ScnKOtFioj
	 wU88lyhIJygZsoJbDFP3AtYd3L4QiCO6npXhUC1NMjvSAgOtrbq3awfluwIMsGWxXU
	 qUiCKhR5QF26wVYBIUBLW+bIjoKhl+lI0+NNV7E2yXmeDn9vya5GTH15gImBe3aIE7
	 MU1/ZccGbzX2w==
Message-ID: <sashiko-outbox-180430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] usbip: vhci_hcd: stop enqueue and drain all pending
 URBs on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-4-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-4-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:22:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Even with vhci_urb_dequeue() completing unsent URBs locally when
> unlinked, several races in vhci_shutdown_connection() allow URBs to be
> enqueued after shutdown begins or remain stranded on vdev->priv_tx and
> vdev->priv_rx across disconnect and port reset:
>=20
> 1. vhci_urb_enqueue() only rejects URBs when vdev->ud.status is
>    VDEV_ST_NULL or VDEV_ST_ERROR. Because ud.status remains VDEV_ST_USED
>    after USBIP_EH_SHUTDOWN is set and until vhci_device_reset() runs
>    after vhci_shutdown_connection(), vhci_urb_enqueue() continues
>    accepting new URBs onto vdev->priv_tx even after tcp_tx has stopped.
>=20
> 2. vhci_shutdown_connection() clears vdev->ud.tcp_socket without holding
>    vhci->lock or vdev->ud.lock, racing with vhci_urb_enqueue() and
>    vhci_urb_dequeue().
>=20
> [ ... ]
> Fixes: 258c81b341c8 ("usbip: give back URBs for unsent unlink requests du=
ring cleanup")
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D3

