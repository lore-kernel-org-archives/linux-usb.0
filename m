Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108536;
	b=Un321SeJZMmcdqvV8r1wGu1844ZCs6ho4g3nQwkYrUDm8tBOvaKgtUyyvquxEWbIFwMj
	 7Ntx/UgP0icR5gYtAqCfoObo6gGkVAYdP1ijms0IwLQKrXp1I4luS8pFZp94IwJqGi4jr
	 Kv18OdzkGCRJRATBYdziwSfjl+Irr5MWIXFemkqoJ7TOYGbblUOO/1X+fFD/vBOLEGiZh
	 +uog1AucxHlaa0fOJX1uHDf6/PdYB93OsHrVJDxnko7a2HUyYWjv0qeGgZYM7/LZHrmTQ
	 glsL81fo1ykGxQXLiqJrfg6cGSVQvq3QE6aZb8NSRXnLqFXn12DSF9FIeUMEG6F9TVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hGJGzDRTw2+ef0CowjMiBSjTPrjBHTE/OXYRA3gtt7I=;
	b=srydZ27tp2Tu8eCPaDDgpBGWv0Ha4j8St7IEQzRqNlK8IJfJSDosWyftx9M5MrEY4yuX
	 XAQf0F1988VmluI475vb0M9f8iZlOwifVELLpcjQ7tzmmYorlgXpOAd7o9mFl/vYtXaoM
	 ZXFngdeB2Zi6/s+1aEBGJvYSLNdh8hH1Cln6j7m4h/G9tnEMmqiBtGw9jyULy/gB1ZLCN
	 YWT4+Y4xXkypn9x/6pJa+JSI9nInv23+zRfu3Yv7VqbQ+PNpnEaYG969Bp1izZnr9NZno
	 zIhdqZHiDerXRJwuK7mqs4Po0ju/GWp2k1pfX5T3j0ztsSyclkMXdUZPlSswwzkz3vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqqXCKDY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D61606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqqXCKDY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5838C1F000C5;
	Thu, 19 Nov 2026 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108536;
	bh=hGJGzDRTw2+ef0CowjMiBSjTPrjBHTE/OXYRA3gtt7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqqXCKDYktBSUc/NC7jXSBpo3D/F6Us1N3hE9YbwZ6aUsy9FofP4thCcdj3fIf/Le
	 pSdJkw4NgHljqUhtQNi+jMzgeuhanig8E630Jq0Fx8EdoQu+ku9o/szadOnWR9+DmW
	 VNVCdznbxDEvCj0ibBwVl+N4jc4CNfAnAl6H1tP6NcZ9PghvXO/aKV0egfGol2r/tO
	 wt5Phq81oJXRytdCtekfP/Jf8yqsJ7U409ok4gJ7clikqrp/Mh68BfRr5+UmF1lRCE
	 Xmn6pEiVmU/5n0xgVHK8gc6j4VAc/pc22eFRwfSWx/xueLeNtCHVnSEBoN2gox5PMq
	 qgSO7246yP1hg==
Message-ID: <sashiko-outbox-223671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading
 uninitialized state on error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ian Rogers" <irogers@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119170853.1529676-1-irogers@google.com>
References: <20261119170853.1529676-1-irogers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:15:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and the
> default switch branch jump to 'done:', which logs 'currsrc', 'mode', and
> 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic debug
> is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc()
> jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> initialized.
>=20
> Return early on error paths in both functions instead of jumping to the
> post-success dev_dbg() trace.
>=20
> Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardware.
>=20
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Ian Rogers <irogers@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119170853.1529=
676-1-irogers@google.com?part=3D1

