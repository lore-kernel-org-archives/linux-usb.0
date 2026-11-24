Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503063;
	b=soXx2+0QWWy6Kg9QuYLomb8TZMz7gP8Cx1uK5aGo6IeFNhaxHM80/JSjap2f/sjhAzNK
	 jIEnKcw/M7mq6C5JTczlJjQ2Rur1aWRLSRXGvfBRku2otWkeqg/iQMXIjqp8/cZRAEwGM
	 FTjvwvAw7g9DRbYN5+x59/LxpKRsIiLA/HBqAdS5JZeFuSL8+22DLNBdHCOux4RhoF2f/
	 az4DExYVffKsxHbx8TKulbQIqf/JdxxUu1NKngDkhPuGFYqmKLFqRUbT2HUZHy/4N0B3e
	 vZlxzxkuKbKifEDnX70Cb5PgCqNNvxffQ5hsxloYpcIjvAcEUfmC7Yg4ZD/t2O6Ldmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=QwH1rrHFFZL4xCjmLU8q+g6U7i1LX5aG+LxuSIDdYxQ=;
	b=FNH0eFdrzacIrn0fH7H95yRo4UCiTuVhxeGkhCNCsurTEn9Nfg+ozwb0QmC6pr3wOGTK
	 6GWaLEebURpycdWUP9L0iZMMFMk9eBEsAiVPUzOSyHepQGjHsXTaPnQcY0THXwXxOZOlZ
	 5LxExJQqeT5rpiopSqNuyHmT3eQtK9RrX5lKhY8iauOrhZfzI639ewePPFe5XmHG7lggz
	 qe5dxf1NSwQIZysT0QAyBAMRYSYRqT38DTjeKb6MWSrcaeDlh8ka537WVcJ1f4S1GWgCK
	 ktDj4vMFAE3yxlWAej17qLjCeqgVK49eFETfYu1keqX5I6N6TBIz81AGZjOVDxjHhEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cI4NKa+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC5606A322
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cI4NKa+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BB31F000C0;
	Tue, 24 Nov 2026 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795503062;
	bh=QwH1rrHFFZL4xCjmLU8q+g6U7i1LX5aG+LxuSIDdYxQ=;
	h=Date:From:To:Cc:Subject;
	b=cI4NKa+Vn7EZK8lLSEpFYZFPWW320oqYPkzTukEHhYdcl6SWHkRJ0LlP9W0vg3DfM
	 pwNbHNuh0VoqI5Tdb1EcEDja7OfdzgYxlkYB1dF9FrWIuQfAJKhB46NAHodOLunwr+
	 432/KBFsGeHa6YekUnCkdAez0niZzFQ2C6geXO3mok1ChhRcD1CEJoFjiUk+3SZH6o
	 xpcehVsAmoZ1X5eH6lfSwSg7iNjP0iVlHdC6iLiFnQ4r1h+7VD295TiMJ2YOwZoc1r
	 Wu5kWg1IMBp5K1fngKh7fmWEA4iF1e+Jwo4oHFAGN9TvKGU5lE/xtGpszKMt7OlisT
	 efCQj10nxcVvg==
Date: Tue, 24 Nov 2026 08:50:57 +0200
From: Mika Westerberg <westeri@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org, Mika Westerberg <westeri@kernel.org>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.4-rc5
Message-ID: <20261124065057.GA953598@thinkpad>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.4-rc5

for you to fetch changes up to 65f634533c8eacd6e6e8acb38cd905ce11e765ef:

  thunderbolt: Keep the USB4 port when component_add() fails (2026-11-16 14:57:06 +0100)

----------------------------------------------------------------
thunderbolt: Fixes for v7.4-rc5

This includes the following USB4/Thunderbolt fixes:

  - Fix XDomain properties change response.
  - Fix infinite XDomain retry loop in case of ERROR_NOT_READY reply.
  - Do not remove USB4 port if componend_add() fails.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
JaeGwon Go (1):
      thunderbolt: Send header-only XDomain properties changed response

Mika Westerberg (1):
      thunderbolt: Return -ETIMEDOUT if XDomain peer returns ERROR_NOT_READY

Suyuan Wang (1):
      thunderbolt: Keep the USB4 port when component_add() fails

 drivers/thunderbolt/tb.h        |  2 ++
 drivers/thunderbolt/usb4_port.c | 12 +++++++-----
 drivers/thunderbolt/xdomain.c   | 12 ++++++------
 3 files changed, 15 insertions(+), 11 deletions(-)
