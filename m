Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026542;
	b=3L7d2Fj9s/lOwQEfxdjAMIKgrCvaV1ZQCDXRxJnkeVZ1G49zxeV1Do7C+mkpB4eDmQeg
	 p9HT5w3G6+nkVzbefMdL2z4lLBB1qa+3Q0VHZSiTev4wmXKnZK2Fqsn5JFq9lySXeO8WZ
	 4O1ma+Bh4DM+PHOx6rVBKKTfRNkpFrLUukcspffz7j1bCXMmx1IchF5lhwEQjxZNre0mD
	 gZV0jB4qs9kMOjNrznaCYJ8h9SjdDOvMFL2l9dFmR/Moq57Bd4Due+yDAZV/nMGq7XSn6
	 PPPLgmuFDRUp6N2o7Pom5xiOoWjyv7fc9/ue9oPE/gg69fk5B5rYttLCAFwWFC1rHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sQ13LWPmIU8273zVLPNisbi901ai/pwd6JT8Kb3ruuY=;
	b=tUrhpABLaqLqkR7A1LODn5QqoHd5lU5yOi27O4bechneV3YBTOU95KYewQc+7hWdGUdU
	 HVEjojMKSLce+eUgcoYnYgdBNpcMk77AQ85gkOYSCZPpWZuYMCfaGsp25XEyTIbSOb1bw
	 yKYtzCVmbMTON4QYBW0CNumrys1zUqw1juvHysji0bLN4SmcY/E4XZad0LvuO91DIMibj
	 dm/svo7u4rPE+bONM2QwNGpYe9mapv5gHeJt8wzqe4iHIm7mNOAxVuPja8hvnZEtYz9xD
	 vuxgRdvxGBv//ec/VIoWM9cjaS4u1la4u+5uyGtN7gXA9UTKj/P6d8bTY2G6DROPjZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LauhVIst;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62359606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LauhVIst
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA7B1F000C4;
	Wed, 18 Nov 2026 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026542;
	bh=sQ13LWPmIU8273zVLPNisbi901ai/pwd6JT8Kb3ruuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LauhVIstZsezhj26+KLxSjEMZqixH6UxA87dzLnX4dLIQcUpLed24RE64iUIUi4RZ
	 8iiawXF3u6O0DVKMo8yRdiQ/iU7QmCy37GlKRAk/8YD4luhg6TD3nCgd2G7PDuTQ2R
	 97Qp1M1+dlY1tx33f/uHU5ZSOOKwCCUWmUfnfQmcgOPx7TgBiOoHLBhki4S9HBEb8E
	 WkOzlm4fB11C+yly22PQ3BAl9/wkh8F1AiDjI1jbwk+Gw9gmywjfbL3O5Lev5MQqox
	 Tx2WLdKYvZTcgT9q8+svX2P7z/CxeEO16rYmggSPOgklA+EADoqrUdUsZpa5VTTTuc
	 MyYfRiwr/k4kg==
Message-ID: <sashiko-outbox-221761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 18:29:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: usb: aqc111: missing Fixes trailers for rx/tx_fixup bugs
--

commit 3ac1508f147f366e674a4d0f2714eb425e64838d
Author: Birger Koblitz <mail@birger-koblitz.de>

> aqc111: Correct endianness handling in rx/tx_fixup
>
> The MAC supported by the aqc111 driver is very similar
> to the AX88179A. During the development of the driver for
> the AX88179A, the following issues in endianness-handling
> were found, which are also present in the aqc111 driver:
>  CHECK   drivers/net/usb/aqc111.c
> drivers/net/usb/aqc111.c:1094:34: warning: incorrect type in argument 1 (=
different base types)
> drivers/net/usb/aqc111.c:1094:34:    expected restricted __le64 const [us=
ertype] *p
> drivers/net/usb/aqc111.c:1094:34:    got unsigned long long [usertype] *
> drivers/net/usb/aqc111.c:1122:45: warning: incorrect type in argument 1 (=
different base types)
> drivers/net/usb/aqc111.c:1122:45:    expected restricted __le64 const [us=
ertype] *p
> drivers/net/usb/aqc111.c:1122:45:    got unsigned long long [usertype] *[=
assigned] pkt_desc_ptr
> drivers/net/usb/aqc111.c:1235:22: warning: incorrect type in assignment (=
different base types)
> drivers/net/usb/aqc111.c:1235:22:    expected unsigned long long [usertyp=
e]
> drivers/net/usb/aqc111.c:1235:22:    got restricted __le64 [usertype]
>
> Fix these problems and additionally also make sure that cloned
> skbs are always copied for expansion.
>
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

[Severity: Low]
This fixes bugs in aqc111_rx_fixup() and aqc111_tx_fixup().  Should the
commit message include Fixes: tags for the commits that introduced them:

  Fixes: 361459cd9642 ("net: usb: aqc111: Implement RX data path")
  Fixes: 4a3576d2bcc7 ("net: usb: aqc111: Implement TX data path")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-aqc111-v1-=
1-27a54c4b54ca@birger-koblitz.de?part=3D1
