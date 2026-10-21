Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593762;
	b=GHTRlCezDE/zHA8mOR19QHNLx1V899MyKGxAFO2pamVuaEHLNeWxea2t0oasV7LJyOTt
	 vkTeXNyGZw5B9wda9qKf3k+h4ViTIDA2hfL07h6hmcPDeSGqbiNSJSnODPmQhlUJ4SaQq
	 adXXTuT/s7uv2r4B5kDF3q+rpVlzwxGcEt89ui2FCGGYQiO5hVZvx9V7bGVwoHkYQTjB7
	 HdfW6uzj0IimvUtSfvDpRplbXCSfT/zNjlB4yBET6tfXc9nlAukmtesNuMDMsMxxWTnyy
	 K5HCto8/oc5Q9WYJ0W2vHCIAn+KzYTaOuiuYp9igU1bVLgpwU8f7uT/XDJiHlvY3V7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593762;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ucT94iKs2WvzPUayTGrWl/70gLVCFBsA+p0sZk3LsGQ=;
	b=rA4nfMHZat1AtOvOyWsuM+eY+Y/SJ4qcozDczcrtgfTJap5YL6vkQOBNw1CgNuttcXj5
	 m58TfJHwMPAfSXx056QdBFYBVgYpAIeuKIepzulP9/VWjcjEAVNyUe9WpZsLUwZLXnwsJ
	 Xm+TrF7/S/VhRS+IyCB8sfc2L3fA28iJSphBpQLuYNjD758yT4R8Z9b0vXAXr4nQ99HOn
	 K++3xdhAZtgqD1N03lInfX09mFD05TQQREnRRHJLO7ePDRjJicXPHToIRsF6zgwx6prJ2
	 ojohBwss8allJHOyf9rzr+9avGWOt6gX5PvtBL5XFalQaNlB1RyoiO0KwaHny6AC/rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVY+Si+g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58B606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVY+Si+g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B7A1F000C6;
	Wed, 21 Oct 2026 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593761;
	bh=ucT94iKs2WvzPUayTGrWl/70gLVCFBsA+p0sZk3LsGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PVY+Si+g17ZTCWLeXElSYSVDiFZExEIPn4lcJN8Z+rFwLb58L/Tug/d9WdfT6HQP1
	 yQWYEHPvEjLuM6891kXq8NdM6HeIgifib2YICeOppL18keoojkwJr+vM2U2QtIbRny
	 9N2fb5iAdm/JyInHOyj8SrsR7Dy8/hx0RO5R/ASDmYuyDTPe3BuMTXQs1cvhYch3Ao
	 ff24Qb6lsERVIlGHmkseD+HMgaj2J2VTD1z48x9gZgGCh8uHDrjScbWk96ZiFbGtwc
	 eQZnKPSm7MJc4iRzExdKWNKvTwcEP4pNHsubKS+KSqk/Sko9CBELboqg9FmXb2+/PG
	 1fULRnrbqWEew==
Message-ID: <sashiko-outbox-180394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] USB: serial: io_edgeport: drop redundant open
 sanity checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-8-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-8-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:42:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The throttle(), unthrottle() and set_termios() callbacks will not be
> called unless the port is open so drop the redundant sanity checks.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D7

