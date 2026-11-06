Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957812;
	b=GDufT+RToQpLG1XJ5wUQd8KAmzADBwVMo38eiykPG/5KT4SMd3SRfWVA3+E6xggZRcJ1
	 MR/dvGmi3wjdwvD9J1svWV/JMnEHxO+U5PhUFlEGlo6NQYVPAcy18H+5kCCClapgexEg9
	 JVPpc7BNVHQC63fN88KFJ0MiY3Gokha7kI/ouFZu3Q1TmGz/Y5kug+zw6+7EAPXAY2mBn
	 WMXUkeuhs3S6bPDIznu6DPoP3AyiMZRT2vcyqRWyRxiNB7VdHa9NqW8mAhFfzWzg05x5G
	 NYktWrB39RmxBbacpK0mDu//cVMQKyiYPoifKmyXc3zvzVUq35tWgbwLdkuuXCkG5JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957812;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U9XBAPossMh7ZmHe/3/n8+8rqkcYu+HCHduQBOUJDCk=;
	b=u8tXJn6jtoyLDyB+OkL896BGJMNBNfyRiQOpGvsYcgwfqp2wkY44+ZkjCz9oCFZ3/RDc
	 jfkBS36gwHKFjSV5prLGlDMcZdG1Ku7X3NpzVDyU10snl71X7Q8zodhloNJHtpD90xdUq
	 RTX2oa3TQdBtW9CfW9r/7bxDwVp4Daovhiq5dgEXNLVhIz8TSqaJTxjICM/X+lnCj34+6
	 WlpIgUnMaw9iqrzWgXhHtKKM72A7wsvts1tlnLzQ+NEtFG6cd/e5VKMD3thrMvXYk0Z7L
	 5pmr7FN/Q8TT8vcYzCAbuWLOXxFRYxNzvNfmraoLgfTvsY9q2xcPTUCUzUgO1Ppt0BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0AUN+zu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853FD6077CCF
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0AUN+zu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08501F0089F;
	Fri,  6 Nov 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957812;
	bh=U9XBAPossMh7ZmHe/3/n8+8rqkcYu+HCHduQBOUJDCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0AUN+zuogx0Rhrw/mRARqa/2V0q+jhlpCDG6hqqDtFcWDp0I2H/WedSv/f0+wbNz
	 Vw9Hvhn6xNG4Gllt8VzxL0tTTVgZ10hazJi1PVj4E0CLoaGMv+h4leYenLprhWbwDZ
	 01s1KaJq4Ze3i1+sAXBDyDBWWzPTdyYiSqILxwFBPfwrcyqoJxorMw4hxxRaWmjYYV
	 fdeU1dg7rAkJd1mJoAJU7YrMBUEGH6NJ1fsz1pm0UPBIKrarWqC2nrVBqRMU1+fjkA
	 S8MVSnwQO5KPimrM40GF1Mbp9AgsVWuiP9UpkCqNjAyekzeCAIOKBonACmhep3omIU
	 Mh6n+Hz3SyEkQ==
Message-ID: <sashiko-outbox-201131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/25] dt-bindings: watchdog: andestech,ae350-wdt: add
 Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-14-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-14-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:36:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 SoC integrates the Andes ATCWDT200 watchdog. Add its
> compatible string, with andestech,ae350-wdt as a fallback.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D14

