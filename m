Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451887;
	b=OEuxuD3j6nRlam07uaZAuEFxK/mPEcr3CZSDnN/HpTYyEiSocuwlGWx+L5XDHy5zkNBP
	 DMpUbW31V3FgA3unk0pQQAOO8lfob55Yw4WfVuiZ/OqvOtvDmjMCCkKepJ5u20ZDwrStM
	 WRPfiP1ZPzwFiSwMr0SCE3Bqeog9PnS3xa+7P6Vj2EvOvY01NLcEsM8S9YznvoJ4+DK1d
	 oONLP1P7PEj660k785qxrpTdFF+a8EKNKr1+iFdxKEqV76DkM8KdMBL9Zrx1xdSS6J9ZU
	 9NlnmpHEYoxcvti7VNeOFxixhZ8qo8zYXS4+Ec14PEtuykle2j01Ic/eb1V2EmLJgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451887;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QbDj8CVq1XoX9HrTDtPMFHC8VS5g3rN5jBPWYg5NtJo=;
	b=bFTOgaHqnI69P9vgfYBO7Ill1urfVOXBEXOZQYnk2TdE/5HkwpluIy88bclWMXsYIlmD
	 rlr9CceDOj3dRosrSIJSbr8+u+3aw0zI1m7nRgc5/nBK1O2zicQIm2iGeI49m+aQjRctc
	 /5KWWcuHUBvQuYQqQuYmaoaflgDekX/vzdIhuQfIBJ/OZbLp9j7wsVl57lmIqM1Nb3Osi
	 tvlcKXtnZNymmZuMnaavjIq6vN854zrrtMDb1YEkRRaOloOYQffpeUBJr26JmYLvOU9Qf
	 tbVr4eVOhvsD+C3lSzkwipEf9gUujejfc4ioFVukdBYZ4v+hG3xw6KZE6clK9M5ABMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZLNL/xzP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076EB606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLNL/xzP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700351F00A05;
	Thu, 12 Nov 2026 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794451886;
	bh=QbDj8CVq1XoX9HrTDtPMFHC8VS5g3rN5jBPWYg5NtJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLNL/xzPF0PGCNgzl9h/8zrJrSBEqut/o/P3OJTy/jxHOum75Vko6wKARoNcGnUlv
	 TFHixlinFNwX4NoJ78PDsy+zDk3w782+wTnzR0ANtv1hE5QBZz4Gj0F62Zd6B2sKh5
	 XVG3ieebcmaNelVQXeyWDLk8ugZBYaWq5q3OHtrNAVwIk4wCLmgsyn7bgeT+/jEzp8
	 TOKReB87ri7om/bim4EOburjC6vKlVikljEtGFnLbt/5r1jw3BozbtMIm3+RjNCcjF
	 Sd7u3LNIrqTMBIj8+SOA3mltieLyWl9REMTbjCeBpcrPvJjREkWGvNjTCpRddUxOCZ
	 nj+qWgGdc6YCw==
Message-ID: <sashiko-outbox-210226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: roles: wait for role callbacks on unregister
Reply-To: sashiko-reviews@lists.linux.dev
To: "Keisuke Tsukuda" <tkdkei@outlook.jp>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261112024101.83321-1-tkdkei@outlook.jp>
References: <20261112024101.83321-1-tkdkei@outlook.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:51:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
>=20
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared.
>=20
> The Apple DWC3 remove path currently holds its private mutex around
> unregister. Its role callbacks take that mutex under the switch lock, so
> waiting on the switch lock in unregister would reverse the lock order.
> Unregister before taking the Apple mutex.
>=20
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112024101.8332=
1-1-tkdkei@outlook.jp?part=3D1

