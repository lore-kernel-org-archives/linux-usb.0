Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B339C00B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517915; cv=none; b=gDDqlrtGXoqt/vsjqdPo8oL8F2YlzLp0+ibQoDCwo81gIGUSyV//1fUEMldaKf3TTl/MdKKhziU7rQAmAHvVyZDd7+lKuDDVPOZ+DVb3HhN6e/sWjH/JjVFwGYvvWmf1wLn24TRuR0DUWIDEZqvnKiJf/FBiCmr0fwsh3y0oUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517915; c=relaxed/simple;
	bh=dXEmaot3piRZ+T+8Sc/6K1ExwgG+7lIIa95kKiFPEt8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ljwFIIpgEiNI3xe/ghntjl8rCXeapH3bGPIEnpTt2XKujgbbgRFLEqUuJmAWsrQYz5kTal34eqUvTXxOIlioT5mCVzI69RYc1x14ziJpP0L3T0p8fRKmOQ0Pn9XJtCkQmsWMaUI8h7zekS8F6RAf6Vva83uORiqyaSDUk+/9fGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEQRlbxh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEQRlbxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AEA1F0089D;
	Fri,  9 Oct 2026 03:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517905;
	bh=dXEmaot3piRZ+T+8Sc/6K1ExwgG+7lIIa95kKiFPEt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lEQRlbxhpdqciifaqv4j8VC+85TqKoNbE+dqpoGgdVskBgrEb4ZNV4KlI+VvsXgQh
	 v4/x7TtIFrAxwLc8Wv2XGO3PqCtT062Hg/+864byBFNurgrUHwkoVKoPE0m7CS714c
	 v0HnbLCcpAptMgl3Eypflk25ObY1wGqbhsYKdBG6xGgWqc+9XdS94etoADZjJfTG2q
	 gKHDly3Nq1ysCYrIE8wO03Qz6qZ6v4df56sBJTQmF3iroFPTaVIDc2w45RjnUkM+Ku
	 Bf53/VvIhljcWPPYltZ7X1Lmbgb+1YUAileC0F+HnOtzstPdzw9Wl8YtRxo96la5If
	 4ukPGdtV7f7VA==
Message-ID: <sashiko-outbox-164799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 10/13] ax88179_178a: Add ethtool
 get_drvinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-10-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-10-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
> to provide information about the device firmware.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D10

