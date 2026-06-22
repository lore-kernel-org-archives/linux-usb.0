Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F1375AC6;
	Mon, 22 Jun 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142053; cv=none; b=WtS8AZ7PbygL+PEOTviPeM+mrT685FW2PwJ/ONFg5N7dq6VkV1Ccpr4KtekP4yc/+52YQrUxrEsWehpCUNmfqUFsaDhL26vKI7MXJtcAKfak/GJhENSzBgluFU9EUXKjpqsENQZwJF89n0lcUUmn/swan4yJT+VXHnuzMaCShNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142053; c=relaxed/simple;
	bh=9OOR3lpQM4UlciQXXOKgwQcPfNuZMQMtzNOImnp/b98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7bHVnDC8sEueUSCL9V4WRsQfQYll3fhPyqTElyikHqWJTA4S+XV3C/t9+bAao8UKitfU3gonf6Pivw21265wmvjrxcwhREcNfjFLZ+ITJq5p9gzaBFV5jna8oDbB2xUFobVkUmtaWfYL4H5D2bnQeSZ+onomH2jqnEqPvV9lvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo/LSGWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo/LSGWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F011F00A3E;
	Mon, 22 Jun 2026 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782142051;
	bh=3dCq2hvGDoUAfO/Jku1GONZFJwol+sTEv/GtYHUHNfg=;
	h=From:To:Cc:Subject:Date;
	b=Uo/LSGWrmx9py4A3kHiRFlVkQwPv09WS5wmD1nCzSy/MCfpYssfDC1zb4pGK+LyXr
	 KH2iTiDxh5Zoh1sYJdkQo19uf46+rX/mwjWp3tvWpTGSTsfvCkZeIRHS+RTmWGkdC0
	 BHP9LvRFAFG88+aC67WxsLCeOokm2IM63BFSh02bYqPlGKjTSWkgkbHS3y9xBiXQJJ
	 SyTUFpxFdKVmDJBXMYmhN63LE6/1rBsHPE1Byz66ji5dj8ls3IVPIdX84FF7pDfn9T
	 XpF2xvHRr5us0HG8IiLRm+ZDWoIJHmjt6z9OWeIVwOoWzPPkKNiOm14GoeRq7HzlbI
	 qgUx02VyR2yyg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wbgYb-00000000UIv-11YY;
	Mon, 22 Jun 2026 17:27:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Stuber <starblue@users.sourceforge.net>,
	Yue Sun <samsun1006219@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: fix use-after-free on disconnect race
Date: Mon, 22 Jun 2026 17:26:08 +0200
Message-ID: <20260622152612.116422-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mutexes cannot be used to manage lifetime of objects directly as the
mutex structure is accessed by mutex_unlock() after releasing the lock.

Note that the reporter of the iowarrior issue sent a fix last Friday
that I had missed. That one requires a bit of work still, though. [1]

Johan


[1] https://lore.kernel.org/all/20260619150340.65058-1-samsun1006219@gmail.com/


Johan Hovold (4):
  USB: iowarrior: fix use-after-free on disconnect race
  USB: idmouse: fix use-after-free on disconnect race
  USB: ldusb: fix use-after-free on disconnect race
  USB: legousbtower: fix use-after-free on disconnect race

 drivers/usb/misc/idmouse.c      | 45 +++++++++++++-------------
 drivers/usb/misc/iowarrior.c    | 57 ++++++++++++++-------------------
 drivers/usb/misc/ldusb.c        | 38 +++++++++++-----------
 drivers/usb/misc/legousbtower.c | 37 ++++++++++-----------
 4 files changed, 83 insertions(+), 94 deletions(-)

-- 
2.53.0

