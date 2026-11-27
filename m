Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772343;
	b=kgWYPK23MEQgo/XeAY2fo6DGYF7WtAkL19953yF//GVxeO+uA6j6xGL5IKryaOTYUbPs
	 sutY1N1Z1gl/sgWV/FC/p/zzhhaDZZj83EbFPifMLmtPWzSHDKlj2V1UScwCDCxKzf4Nb
	 XBBiGXVRaO4OCuOAM1VjE0DIVnlcuZGZGVBMzZCWqz7dxKcVjybGnXiael2DNBynoqv2k
	 uwXG1NRW25RwmuKVjV6vIl9efENcfjxui7dY6Qh1QWKARlnD3UH+zsTJWImduhoyfFHbH
	 +E9F+4nYD9Jhocidh+nCIA6uubU1ngFdm0xn73EZO92WVLwxX7xK9W748M3cnQNOeiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772343;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=mfJqk98mJdcmdV025H5HNC/7B5mh3WsSXVf02Dyg9eE=;
	b=Pmd8w66u7EQChiZA50mGAgae5+4avjtpjD0qF5LPLylZAn/aaLQOV00EplEIaZgON//t
	 NHa+U1mNUycGt9ghzjU/MK6Bqi4/3nfV6TeFwQiPCywd61gik+CGN0QeKt/5DKQKoO4qj
	 QSzhty4i9SfmdisUH5P363N49u4hX6mnGwkK9+Vt67tT7yx60y1VNA+HhePgiVD7PoCzk
	 nf2j6t8mot7gAjHwPOewmc6+h1fANiDGaETVNvCmn6SXyVn9W0Cy9bs5kw+c/7dd8rzOl
	 c6X1ml3Q+1D8Tun8+sijUdELynC48PC++FKYV9RUlKJt13XYxjWRBCcvZcStdpK7i0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZH05icf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC404606A31C;
	Fri, 27 Nov 2026 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZH05icf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E8A1F00897;
	Fri, 27 Nov 2026 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772343;
	bh=mfJqk98mJdcmdV025H5HNC/7B5mh3WsSXVf02Dyg9eE=;
	h=Date:From:To:Cc:Subject;
	b=fZH05icfdHa5AtsNECAIl41e360zqCv2UpE09GpN+8S3I5cZCXPEOtyCSAC5xwGHj
	 ImRUS+yPZS+V92OqZTdULAIJS4X6LfYQvmdSAwljcYsIUTMQ0U9ibQzg+10S1ODu65
	 dY71gfb7YFfwuhljRyy1z3vfNx6aUiCmvSxwll9B3l7qU4IuZ3cu4BaW++fXbqqGjS
	 MuL7VOqVk0vh8OviinV8/BF3ByHhxwZuyWw+7ukU/4tEXdu7b4HTS7UHwrQZlea1PY
	 8Q9N+8ue/KCp03XFa14vducrgtkR61fe4g6EfeLzMm7eyCNU6tMYMUyAsHul60QCaq
	 9CZY1fWO1yNqw==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWsQ0-00000001yjk-3KWq;
	Fri, 27 Nov 2026 10:39:00 +0100
Date: Fri, 27 Nov 2026 10:39:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.4-rc5
Message-ID: <awlPtNqbTB-dyXBI@hovoldconsulting.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f11fe7603df07fbb9fa02b0d385c1696c87a6dab:

  Merge tag 'usb-7.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb (2026-11-16 07:55:02 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc5

for you to fetch changes up to d091d9a05f78af9332785f1767467a0a88d24233:

  USB: serial: f81232: drain work on failed open (2026-11-17 13:34:10 +0100)

----------------------------------------------------------------
USB serial fixes for 7.4-rc5

Here are couple of fixes for long-standing issues that could cause
trouble, for example, when open() races with disconnect.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Haowen Tu (1):
      USB: serial: f81232: drain work on failed open

Johan Hovold (1):
      USB: serial: mct_u232: fix NULL-deref on open() failure

 drivers/usb/serial/f81232.c   | 3 +++
 drivers/usb/serial/mct_u232.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
