Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E983655F0;
	Fri, 21 Aug 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327175; cv=none; b=JfsAuE40wwSSgFLdsYrHrs006/c+aaToZ7nVA7zB/cvVU0AF8C+lbcqDm8ualJguT/znzN/3TGASw/Ak5nQcE3Y6woRJ+J2zMkcBdmbN7wLHCygxVefg8V6jjmodQZvXUkwlqT6mnTOMEY81aXx6ATW378sEAmGKa/lIiGJDTuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327175; c=relaxed/simple;
	bh=zqKS6U6AKb37UJpPR0Hy1HY+fKC7OWaYiUa8xqB0gHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4OqzRh8AMSz2IQKJWnTD1fPdtHNWCFe6014aEICAMk1Z5i1IoJFfD2VhilFSZiZn/BZp95w+FjKfr/GzF7kjBmk65SSSLPpRfMkIOVv3qs+rtdKAaisDsiwh1WcppEuB6py8bIZLF9Vk6pVMm1pdVV53/iI9nfnp6U927U669c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwnyAENF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwnyAENF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24DD1F00AC4;
	Fri, 21 Aug 2026 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787327172;
	bh=DnCtZow5PXzezPmTvKQdwB3d3iUxgXb5hGNpOHP27J0=;
	h=From:To:Cc:Subject:Date;
	b=XwnyAENF3dVZiiEDfkbaWJY7kDCAtFABovnVP0euqcXP1YA5zUn/Ba+YOOwAbPyc5
	 Q3GfkAKPLAASA3kmkclGTDzZoEQd2VrltP+p+sfjk4min/SoL/YlyrGvg5HDRDbvYO
	 MfmmQQcP+wgkSC3cO7ZxZkLCs/l8ZAJlSM4rVRUHSWzYuWLzdFRRNKoGL8C4h1Yhre
	 YrUcFTtjF5H42lIjD7McPnx1DM8qakuzuz08iq0Ve5qnEH7tb/8TmAL/7ko7P0muJf
	 6JA/Hj+NOSzr7cxsuoCQvGdFfw3CyvpxLFsDt4GudfYhY1CcYlM8L6VEx1I8cuAID5
	 fKJb1/WlBpzvA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wxRRa-00000000UvU-1xwe;
	Fri, 21 Aug 2026 17:46:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] USB: serial: fix port tear down use-after-free
Date: Fri, 21 Aug 2026 17:45:42 +0200
Message-ID: <20260821154546.118809-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When addressing a port probe ordering issue in digi_acceleport recently
I realised that we have a corresponding general problem during
disconnect, but I didn't have time to address it straight away.

Now syzbot has managed to trigger one of its symptoms and people have
already started submitting incomplete band-aids so here is a proper
fix.

When testing the fix I also noticed that we have an ordering issue when
deregistering drivers that can result in similar use-after-free.

Johan


Changes in v2:
 - fix dynamic id driver deregistration race (new)
 - remove "new_id" attributes before deregistering USB driver
 - use iterator for driver deregistration (new)


Johan Hovold (4):
  USB: serial: fix port tear down use-after-free
  USB: serial: fix dynamic id driver deregistration race
  USB: serial: fix driver deregistration order
  USB: serial: use iterator for driver deregistration

 drivers/usb/serial/bus.c        |  6 +++++-
 drivers/usb/serial/usb-serial.c | 32 ++++++++++++++++++++++++++------
 include/linux/usb/serial.h      |  1 +
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.54.0

