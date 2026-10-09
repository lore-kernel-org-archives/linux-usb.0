Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1B3A168B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517915; cv=none; b=gQtvZiVp/fJNS3BFjC74xbfH/KZd19P7IBgNwhROnlUNn3a9tLZRhMlM+4F0nNyfV8YS0J8yjFIIoR2rXbMi4vdUNFmV4WjL1q0j+Ezme2gJPPsmBbcfmB0yb+dPakiwnh+yuwWYoacvnzKeiekTU87TTMWZpwJpvJH5I/nCWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517915; c=relaxed/simple;
	bh=KnJvvx3+buJ73FQzf8tPJNzcqPttdD8mbkWQW+HpCzY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Dvozl5JwsYpfcs4xkn50OHz8z0SIX0tAysUzRiPihVSaaTjbjHuhxKoUNb+ijV52XuwVuFz4f3140Z+VMAAVV1gTQPaIrmx5MOk/XaB5fA6BDNXfCCN2+5HsVj3pf1A57CveBKhVmvszcpA89OrGkHauJ6i2clUCrzJX+nWBJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCQ0VYnq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCQ0VYnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1771F0089A;
	Fri,  9 Oct 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517902;
	bh=KnJvvx3+buJ73FQzf8tPJNzcqPttdD8mbkWQW+HpCzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCQ0VYnq5j1yiuuL8KEXeFDvz5Apwxul5QlLY4mmZSvKt12JTivCXvjtGTlMtO3cK
	 855LjPzKIsKUWppmOr41bxYg9MWQ5MmBeYg+KkJUMcd9hdFciR9A8Vn8iNNMxWA0A4
	 t1B8MGttcFIoRpe5ubOpY1s6yALyRdzmxJVMZ1h3bEc2W20FvAlDZxgoX2KSsDB48U
	 K+t3UcC4iz4ojGzSV2d9Wg/ISLvI2Ske2I7fWH9ZazBP72op7S7/BM501bc0yOODBy
	 SNe9977A76EqOfDIxQ4Qhla1513wI7JRal8JGJNvJqJPYqnfjh9gqbiSGpcb/5bL+P
	 a60TLDY07sxiQ==
Message-ID: <sashiko-outbox-164795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-6-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-6-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Configure phylink to work with the PHYs in the AX88179A controllers
> and provide ethtool get/set eee operations calling into phylink.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D6

