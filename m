Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F22882D7;
	Sun, 24 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628015; cv=none; b=R+SHbkKcVroiJNyTEeanlYx6xCWoURHGuRZKvaIxeVi8uFbJ/BETdN93sVKBPpZYhes/RD3LsmjQ0IJPLTeGj6nxK+9Y8B7F/ySAxUS+TiDoEQqOsCq0UoHqvDSmzwCiJNtatuQTgtmXhUA3jimD0kygPbh0U55NnpoQCfpSr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628015; c=relaxed/simple;
	bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPwZW8T4EhxfmUbXTVzGVoy3KnFjyFGi/A/jySfSZXO2/eQJUr9FpaDeZh/ZQTamdjg5rl41rHBzotDT7cT+56csRXBiYpwL4w65i9sPcaKjhTaQPhDK0RIo+OKx+RTVETR/TRU05V7SB/sVvz6Qkpt99SqXDBQIgKq8h4Ni1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LMnDuvJJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LMnDuvJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
	h=From:Subject:Date:To:Cc:From;
	b=LMnDuvJJn+BD90RANNEmZ8ylb4Oz9za3gxMPEmQp1EhD0lc/ms/q082wCb5cBBnyK
	 2KKMPaBm21/KaFYEzpCsAd9/BP5KY5YLsYQ1Z2E+S372FOoDTgW1taeimdpLat9Ci0
	 h8LN4Rq8zgjAblefHLnJTsHzD9JSBzU3ri1M3GKc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/6] thunderbolt: property: Fix property parsing on
 big-endian
Date: Sun, 24 May 2026 15:06:42 +0200
Message-Id: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFr1Jm7UAatKBXERdNMmlHZKqTpAild
 zetXT54//0FEilTgluzgNLMiSep0J4a8GMvAyGHymCN7czFnjGPRQKpm14ZHQ9IErgXvEbTWh+
 96ayDOn4rRf7u4fvjz6m4J/m81Q5D6VPqYz60df0BPpQtuY8AAAA=
X-Change-ID: 20260524-thunderbolt-big-endian-9f012cfc062b
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=1170;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
 b=N99IHWzqB/+gVIroVtVpb3EXOBRxqSeX1kRdxv0jKx+XW+qdaF/SzwZkc2hMj//YOHKaXqWZD
 t6EOft1dt7xCAzPD+GheJelo9A4DrOyzs120X/XQ6T4xdSwDn0RtW7f
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The parsing logic currently only works on little-endian.
Also make it work on big-endian.

The first four patches are necessary to make the parsing work on
big-endian machines. The remaining ones are some trivial cleanups.

Based on thunderbolt/fixes.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (6):
      thunderbolt: test: Make root_directory independent of host byte order
      thunderbolt: property: Unify format_dwdata()/parse_dwdata()
      thunderbolt: property: Make format_dwdata() work on big-endian systems
      thunderbolt: property: Convert byte order of numeric fields
      thunderbolt: property: Unify parse_dwdata()/format_dwdata()
      thunderbolt: property: Make entry key modifications more visible

 drivers/thunderbolt/property.c |  93 ++++++++++++++++++------------------
 drivers/thunderbolt/test.c     | 106 ++++++++++++++++++++---------------------
 2 files changed, 100 insertions(+), 99 deletions(-)
---
base-commit: 6ff00aaa856d16015e5bafbcf89e3998fd4a7c2b
change-id: 20260524-thunderbolt-big-endian-9f012cfc062b

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

