Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AB3CA4AD
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694499; cv=none; b=U2KXrjvcvRbzG7sSDrZPaYsOfOd2XorQNP/YTWBJcEmAJleXGsOwJGvckFaqqXlmMtadHlYmE0n0va8f0qYtqR9JsnR22Ts8fdImb/4Az0jqMv2LgwEsUJSrW3EY5iKg/khHLw2GcQD1jvX2dXX4psLSOe1WtCgpvMLgZpjT/Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694499; c=relaxed/simple;
	bh=yDV7GeWqfrkFkvK2PUGq8HFiJNaJOxG7RYg+ZIbR048=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tTSOQeYWF4m5tP9PUBA36yiLamyhtf20MzCBSF+aEKqx8LZeHrlLrBQ7/85XjATi+TbCwNl6x6sQDieS8U0qsDZqNnvFvXz8qgGkO5SXyhm0NQIBJ9d2YLvKqib60R67uhYVPLhDo1Kk4XUfpbk5ziKu9LAj4vMmxCSKY1IGDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP69PYV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP69PYV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999EC1F0089D;
	Sun, 11 Oct 2026 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694498;
	bh=yDV7GeWqfrkFkvK2PUGq8HFiJNaJOxG7RYg+ZIbR048=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PP69PYV8dTCwtbL93LKswx/pmbqLys+G3U8Qyh5nY65L/XhNJkytMVFpJUXqqQOCn
	 5ZunNudGHocYTw70goKTzbd+Z6ZcNoMl4HK7qT94d9/E47CzknGCckIUZJO7XpQ7cN
	 F2VJsHHtcyJfxc4dkDF6fhUARKjcwyzCvuK/FgHWtOn9vppqNLm65F1B3y69QMzZuR
	 zuJ5b/u9mDLkz1TsaetB6gS3a+EBaw2DOxdTI5BLUN1fgThjT98y45bgVTahTJVzYg
	 jGpxeuBEletMu4l6iTXZZNljtSSa8GC9nq9WOLIcfrfdk+dADM0DU2hasEYe8xBB0X
	 KpaZQCthDD0Cg==
Message-ID: <sashiko-outbox-167016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-5-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-5-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A uses a simple HW configuration for EEE
> via a single EEE configuration register without LPI timer support
> Add support for setting this EEE enable/disable register in implementatio=
ns
> of mac_enable_tx_lpi/mac_disable_tx_lpi.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D5

