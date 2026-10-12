Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00881E1A17
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 02:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771318; cv=none; b=TYa+d52ajMM1VluEZi9YDC6mpkJE0oWDLPyVberTWXGP8cdacFfo2MOovWd16utwJEqYIM7FDPBpmRvqA27qkmGW6oVhLKKxs4W+SNaYXD2E76qAarbOrAVTnDBO5pex5fdaM5BRPxT7e6YzDJrgHmnK4l6WyQmBdayS7ihDawI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771318; c=relaxed/simple;
	bh=hnwEEi5+jv5GvVp0EAD1gdpc/M2QZN5F5Off+kp65xo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=IeNqHZMDHV9MVJzLax0gGWBLqDuQKsaJQ8nsNtJ2EvfmiWsQKwzOw1WzIIzc+4xW8y3bTWE26JEt5V9es40zT9eFNnL5Or+6+M2HxyTtdz9XtwuVdcMNnoWeoep6Z9tVjq0hFg9J+STPIkWtrSys8WKWpjAdj27f3bZIOJrQc7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9qB1+zJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9qB1+zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718A91F0089B;
	Mon, 12 Oct 2026 02:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791771317;
	bh=wZAoQAYDJMLXknMP7/0pHOVPL2ub4n/FlHwaDTbut1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9qB1+zJJhsbtOCMDWuUHbROvrTKL3CyOjO6IT5XPOLsg5i+EXx7imvrmJshqEZ4S
	 95W0PJN7M+/A56yWsOztIXJCwLZ0S6nAvIh49/IkO7RVCHGqOU7YLbag8cAEl/NQFU
	 im8r+EkkkFpof3jo2Tpkt5v3yhFK4NBvoZOWwbzhatLfvB5yHwsVWo8j28QufgtMAs
	 TE/eo66n1I2V81+muMU9vK2y7HFNGfz1d2+Cic7c7Unlz/zwsCnGwetqfSq9sx0wXG
	 2xKNws840SFy2PYqPZTkjH1Pfm10SvoPgvYn+7+emGa2ajMxfdW/m/R01cM96QVOb6
	 0AhxyCEBL2fLg==
Message-ID: <sashiko-outbox-167553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: host: octeon-hcd: fix kernel-doc comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhijian Han" <hanzhijian1991@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012021320.3047735-1-hanzhijian1991@gmail.com>
References: <20261011133931.GA12345@kroah.com>
 <20261012021320.3047735-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 02:15:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The file has 31 comments that start with "/**" but are not valid
> kernel-doc comments because they lack the "function_name() -" summary
> line.  scripts/kernel-doc reports "isn't a kernel-doc comment" for each
> of them, and they are silently dropped from the generated kernel
> documentation.
>=20
> Add the missing function and enum name lines, and document the values
> of enum cvmx_usb_stage, so all these comments become valid kernel-doc
> and are included in the generated documentation.
>=20
> Found by running scripts/kernel-doc -none on the file.
>=20
> Assisted-by: LLM scripts/kernel-doc
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012021320.3047=
735-1-hanzhijian1991@gmail.com?part=3D1

