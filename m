Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87BC3D45C1;
	Wed,  3 Jun 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499835; cv=none; b=Ll8GqCNjB648SiMpRMp1zEAwbbB6IIiK6UO+E93+RyTvBGhS95rR/f3kmmnulU/itlZAicnSpG6n5TpNfGRMTYv/BSa2ls4LkovMPPK5SPY/z05jXDLJTO5sPb6oOQVDBZMfIL3r+mVBsZSJZIBpZk+P4XS0+7gCNdV6ulMX990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499835; c=relaxed/simple;
	bh=+3I8wOy+75gvvBtz6c8y77At198hB9zAdvxpQGyGrno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btgFqRKyAAFFevYY5n3HqBsGnnHSLfFxXkvJZXZmdjbFP+aCHo/rVl2cd8mXZHFhXu9PHJIHsF6vePeYkocyQq7SVpHvSkg48d7fjndCUsNXQ4T9dsVsCLFjUaZT9tfWXknzJc8A6NgXkuwj/1GMmMR+b09nfn4/UqQ3bQ6eAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002D51F0089D;
	Wed,  3 Jun 2026 15:17:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] usb: host: xhci-rcar: Avoid repeated matching
Date: Wed,  3 Jun 2026 17:17:08 +0200
Message-ID: <cover.1780499433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

On R-Car Gen2 and Gen3, the .plat_start() callback checks the XHCI's
controller compatible value on each call, which happens multiple
times during the lifetime of the device.  This series fixes that by
using separate .plat_start() callbacks, reducing source and binary size
in the process.

This has been tested on R-Car H2 (Lager, disable pci2 first), and R-Car
H3 ES2.0 (Salvator-XS).

Thanks for your comments

Geert Uytterhoeven (2):
  usb: host: xhci-rcar: Remove SET_XHCI_PLAT_PRIV_FOR_RCAR() macro
  usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling

 drivers/usb/host/xhci-rcar.c | 70 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
