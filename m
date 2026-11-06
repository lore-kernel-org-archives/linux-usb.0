Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955924;
	b=K7cixYTP/41oJXofX/Z+qLuMASYOpOaIjO+6Ef5WKgKAIDhtds1mXLOYx6L3819ykDFz
	 GlIUtGQ2nEAf35ebvISoE65vvi/61btUa5PBv6hs8vL31hd8AqVrUo8PaxbhuYI2Qv4na
	 EB1rRZkqeK64556tyER1Ukju4UNpH6dam40VYzJRR/TkPnwnfaxNtd54OJE0nnC71NLfF
	 Chix2MGs2jYvkd484p9p8TvuNJ79JmweoyAeyVnrqzIzhc6x8XaBiEnGkhtrfFgfabj6k
	 RbzP0GJT575z2iHQj0IbcQsUcOZcLJmaPgvkESpztC+wHBIn9y7l7BtJdJLekBFIeOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c90CdGUrN6Bf330Dk/KZXZ8enzqIapXIbJtQEozVyp8=;
	b=d1nQ8auHKCUZC3fK0dlUThlLQso6qDQZ3TryRE3TiHK1hD1h+NkmpSu4DI4LkDc957Kt
	 dL8bB+AGgqWqDbTyo1DpE1eIwS6BZEAQSLOJZxOL7gXidNC7RfUXj9Yq/STzGk6jCB7wi
	 ryqq/0Cq9jGvwa0hWAj+DGnuge+DZsuzGxoOeW6mxrzqbf6byJryPZGPWpB3fWRWL3d9L
	 iZUrDi41B1F0cmi4fmGBlqfYWjux8X3ydN+C1H4NQgUnkSSsdgsJGxnamMQVWDCDukvZQ
	 4KSw8bp+ObZ4PJ/a9AtI4Ag8hJP6JlRF0PiC/Q/OvhnK2js6YJ5tJTb2TfBdZRg+kMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4LWH4GW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F1606A32F
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4LWH4GW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905F41F008A2;
	Fri,  6 Nov 2026 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955923;
	bh=c90CdGUrN6Bf330Dk/KZXZ8enzqIapXIbJtQEozVyp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4LWH4GWNZWW+w2KKMgWfapzX7NPwftmaiesOGK36B/BBhNnR6ZcCMgIgxDlWpi8u
	 DJ+AMUm2th2HQX57IUazprJGgja4sNd8pUblIZu5VZOlRr/NY6wHrfahc8LlcGW50S
	 h48rS2rmHORfRArvxmFUYtDffoWfDXUPp/AxVJXwcyH9KK5QoaHC0oNxtj9P+qNfJy
	 67x/HiP9en2wba0r2wa+PypSXVypErJ+92WqBcKgWkfNdCm5/FRx2uzgofvHoM4265
	 Z7mGPNrUgm+cqoKgiOZ4QSKHtlvTxfFMaFvkTrqe2ZTzkitaAYTEtnlu/mRRTCAjhA
	 sbmMgEHrTWxCg==
Message-ID: <sashiko-outbox-201099@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: console: use isdigit() in
 usb_console_setup()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thorsten Blum" <blum@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106090304.2410-2-blum@kernel.org>
References: <20261106090304.2410-2-blum@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:05:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Use isdigit() to replace the open-coded implementation.
>=20
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106090304.2410=
-2-blum@kernel.org?part=3D1

