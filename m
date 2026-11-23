Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426224;
	b=FdEVchBcgXfBute6mO387aec+ESC3r9Axt8YVfHfWsJOQCE5D66v9ptfoF8+2QLufZMH
	 5AH6ceggjaGYnq2ysFyM/yMe/B9TEnnHntLd7kpJ8AfNfefELqeaA8pT/Tps/U0zuELcG
	 hwL5uxvZxpjXzhW/dCagMf9R0f+/mifYgUMU5lOusT5FaqKsg0QYHHOvqm5/qMug3OpOe
	 n+pQLqqAfeAQrdrxnh9u19LgZd+3EAEQjyho6aDuBk8pd8cb+UPXnPW643b2uR1BvOUY2
	 GaLr4jeGeHLrpSTV4fC1ooy/2P/JnWvZ/11iPBOXahlRGi51baTM4SrVb0QwoNfEowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426224;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V/MUn+yNHE/X4XEeJyz5CVWZ0BoIpD3JJ8gOpW3qQVY=;
	b=1PwgxTqHq7SUIKI6zDHA/HM5ZPS25YQfzeOE5m8IdiVYBB3yuLRWyhghYnn02fQ5X9Rq
	 rscQwrls25QcgU9Bjjw2Y3/ejlikZsz/ogM0CcGyVx1IuEil4xrbPHtMLw7OUGCKWaGhg
	 nHMT4Km11JFHVEEkVfGLtqxqCHMcGHTXhdTtf5YjQQ5NlqtmDnZnybuTiUBmqpIvxqyVc
	 YOZfBAVNdRty3I/SCfBWr9pTsqTBJrBZfWoHBJs2SztcHMk1dQd8aXrlTCc3KUMjutCde
	 rUKUd3uXUCjCFSl7RTdX9UChKxQFk+zOfVkl3SiFnyKZlOsNvgAB5gqP1jgjTB9dQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTJwRE5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FC606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTJwRE5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBEB1F000CA;
	Mon, 23 Nov 2026 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426223;
	bh=V/MUn+yNHE/X4XEeJyz5CVWZ0BoIpD3JJ8gOpW3qQVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTJwRE5wHAQWUcyiA0Oxfe1RTGSLlDQemT6SgOVx/El7dOfdUKDzGDDrskvaAurKI
	 MNSpiOOVnmL4m+K8adJVy3lHc52NHmREmaCEK0bLAX2CcBpSL1+qmmA0NlmhvMJN3w
	 UmITqVJw5K2MFgg+p7nRlc+4QfuZhaMPN9QyPnprLHDk2rBZ+XVjXZ/8tz3mnpK7kf
	 ntamTAmduMIq42OC+AHbEY/2iLqyFwCSI3BzMd7kE6p3D8jbGfTdZPJIXyv18dlSjx
	 GvcN3tGA/Yrab2DOfAtuFyHtjXBwzuRo2KiJt8qvarCOAI1xMF/FME9eiVOclwSJjy
	 K/xQJLec4YE4w==
Message-ID: <sashiko-outbox-228977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/5] Add USB support to Exynos7885
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Virag" <virag.david003@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:30:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 5-patch series:

- Patches 1-4: no issues found.
- Patch 5 ("arm64: dts: exynos: exynos7885-jackpotlte: Enable US..."): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 5.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123092244.1792=
040-1-virag.david003@gmail.com
