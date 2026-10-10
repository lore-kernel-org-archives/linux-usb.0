Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F037205D
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668481; cv=none; b=GYIscSyUQR4brFPlCYuY5aA+Dk3nhCVsEhyEUYbpP4qkYUid064vOYjZx5sNw/aNLqGGREOn8TaON/XtlVeQmWHQee+cZ4PEdE73UeyJ9pjBH7tpHd4eLmW7pYAuEQo84AzAIO3MDnMhO0KSpA8XivvohVDZKwXxrortVZ93bWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668481; c=relaxed/simple;
	bh=arbVmwG347tqU3Op8/X8Q73DA8FSXul8MdnNyvqaGdk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i6FvpRA1oR8JbPD3bdJRTeUeCJAb9yiXtM/hqihU3gYTCG7S6lqeCauWZlhvYzH+0CQhuNLTQJeHQFcCK/ZoWm//tZCuTlnB02QPXWsNskoc6xbrV/Cux/e+41WgsTOaqB9+lF0GN/yofRErKgv3ZLlxJ7a57ol6bElgPRBKzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atX375Pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atX375Pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42481F000FF;
	Sat, 10 Oct 2026 21:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668479;
	bh=arbVmwG347tqU3Op8/X8Q73DA8FSXul8MdnNyvqaGdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=atX375PklATmPWdlY9OHfHToicwdg/0KyH4AiZ+InOItH2eL5J/TU86zcKCEUzDS0
	 Afiokqs0nPnWtZPInJmxlUW95QrXdNq9eF9K8hoKj4Y2Uhb8wIzSBBE+UjVRratn9D
	 Zj8lShWvtrmrjnF0awkJIHhdihmgwYDB4CyoJ2911/Y4T8tQm3AYXb6pb6n8SBaWHH
	 sSgEQkyJO8p7xw9pMNcwpUgbYtvDFHV3kcmuHJTbaM9/d0ZHGdWAJp8y+E3EswjjWo
	 Sf1eInLF7OsyBvU5xzBaXmHG48MOCwXpXH6O47tjcsrTY/5E2ODupyt2wHhuIyctGg
	 XAlmbmV+V1whw==
Message-ID: <sashiko-outbox-166894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: lan78xx: reject invalid EEPROM write
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Munari" <stefanomunari.sm@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010213248.15938-1-stefanomunari.sm@gmail.com>
References: <20261010213248.15938-1-stefanomunari.sm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 21:41:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The runtime PM handling removed the -EINVAL return for invalid
> EEPROM/OTP write requests. These requests now return zero from a
> successful usb_autopm_get_interface() call, even though no data is
> written.
>=20
> Set ret to -EINVAL for invalid requests while preserving the runtime
> PM reference release.
>=20
> Fixes: 8a7ffeb795f8 ("lan78xx: Fix for eeprom read/write when device auto=
 suspend")
> Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010213248.1593=
8-1-stefanomunari.sm@gmail.com?part=3D1

