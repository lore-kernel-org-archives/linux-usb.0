Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786430;
	b=P6hOtkUmRZViPK+HbtKcJBfL1GFz4SDBP5S3nNTBmD2hQCevZMlRJjR74RFq+V0ly8NN
	 xH1noL/7so0NVqIbEQOjamgZFwKoFKRismZu0SJCkcB3NC2njBMxARmm4nePX5J9l3s5w
	 0PmrTl+Ftwv1TxBejKH1CxU4uT2ia3CBz9dEiBMpNP5byFReesIlvEAokYc4sU7O0X8EE
	 YK/QOIYFXcn/dNs41zjsy2xsK3gqo2OOZorvzeo8QV2kYkClOnMDg8iRCRaDrymeYHGNP
	 5z/1Oz6QHbPh3t+FsZi7nLldHIOaxBuQP2YyIWJUBbe3afs8+9AN6kHLttir0IfK2Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b9isGZrTK4b04tXco1Mc9QsD0T6hc2R0nLUOLEuv3pE=;
	b=OWtYXbWgiFJ3caMvGNvKaqkjcjx8lrEXSGgEUnND7vf7jgH1qM1NlR8cC5BVgRb/Tgid
	 nqfn7fssp+RqVkx1azZVgDyJEZUAk4/ixT1KbHjVOCnrIdPwWLo0C9HjXJSRkp3CtK4ui
	 veBmcR/ggxWVanExAjnOhwAOqu56I/0pNxEeelAPUeDphFjmxuxV1J8/YSmMGsxmtZlQj
	 T/I9m5CY/qtQQozrd55EuFb64OPBuX9md3Z+BcUSnv7AjxhjjW8xW1HC6W1Bm0a6BfSE5
	 M3m6A4DfYK8G/7Eic9bI2PPm99Ksq8z32OMkki58Z/p7PdPPIQ24Y2YxgJExVDDLcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAl2rcXu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D75606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAl2rcXu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840AD1F00897;
	Fri, 27 Nov 2026 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786429;
	bh=b9isGZrTK4b04tXco1Mc9QsD0T6hc2R0nLUOLEuv3pE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAl2rcXuniKIwaH++VKb63bh9FljUurN5lYOG0fJEi8dPPUslQ2BbSntLahJJ+VKF
	 BID7NOmhhxT4jjA/lDHJzk8ttcPmyd0nKO9wX0iJaDvrxeSaLSE4UMubcebKxNjEjE
	 BoQig7+k41t8MJRvbXveaH65N1MefG/+EhqE0zn3SGA42PZ8icuQkfVihI9lhRMnfO
	 dbAjynoyx9zb22DNx2eK73hFz8POraLD/vjsdp7JHo3LH1Pr44IyGDiANOp3ZOx6Ez
	 RjwrSNR3blmM4EIsJJH6FHDDTHDVdBxxyzayq90Iva4gJESu2fLDhCLhhcJPyzbPzS
	 5gLY41PEZJU/A==
Message-ID: <sashiko-outbox-237493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: mux: tusb1046: Support no-hpd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:33:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127132449.8908=
1-1-blfizzyy@gmail.com
