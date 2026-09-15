Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD53361943
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462978; cv=none; b=NogRy6EQy1NNJeiuf/O8sEg1PaadDkmfeYqvqUnyS3G+9taze7WBbx3lx9pAekge8bsWtOMjT8GOYncCZ/Yd8yW4vNeGCbN8ZYz5hUd4q+PE+k0S5JmF7NLc5mvgYFlprG21okEOcIUrd8RXlA1NCj/yAMGJ0X0cUrtlZfLk52U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462978; c=relaxed/simple;
	bh=hdpFg9SHPm4pLXSthsNOoQDr+dHPDTlVqvx0jP1DcUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUx7kTgf5r895nzges9rrl75cXSXkVKtBb3FHoWJ/RSFdvryRctpiTls83uHBt82u1siYu4C/vWhx/GIaCWblacC7XeR2XFfLoUf7p20p/trfjuDh6c+ZVFa2bDfjxsGznsyyNBl1t0xSU9pgW9vQNvfTAAjgA68Q/EYxO+4Omo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfk9/W59; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfk9/W59"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso450946166b.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462974; x=1790067774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=Dfk9/W59UHwGmvzrhGTkZYPzYV87gwqijYUparkVqlOqnrxW7GI55WCIqKOwbP9Tp4
         5Op9pYKfYEfqzctOOjPhrmAAZ1gZfAgpdYoCJMIxnvZIPYh2XRhbi7f86UGwxhOhK9h4
         fnD+WL2nj9PliGGQ0lt5g1Atl8OzwhmbFhHCx4PjtTlZtwvzN9Z1TICj8PgILlvZN4OE
         tXxd3N0SdoSmQ6dSVEth/Hv7vIzwHzzelDpP8V1i5v3/sx+V4ngPwyUHEzWvCUv8ZMDP
         g4st8kUOXdvzKtixJQ7nePs5XlsmHT1qfmpp/WxYVc8yL9TiNqdNc+nN2Y7nw2uA9AJR
         fHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462974; x=1790067774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=jFmZdQ3gVelXTt60/OL7h6WDje5zqdPDr89vluSELB1tA7sx2QnTwc21KUWqpnSpnY
         VeWMSagflQ0k0w12mWms8hbRmiGdvgY8y1nxasBezsgansi6Teduwj8TIDYixm/kXLfU
         wTkTDL3iJZvTlMU/OLSQTERCPXwgL/Tdbw0pbTsoJc0o8Vw7nBAG5HrRY41I2phGRr3u
         TGofGySUa5yFhaoop9KnGrai416YycHrXLqnxQKqvc4zRLSu01+DdrTWi/V4Um8/AIZ+
         KU8WKYETHeLRDQouaOtXR7/gMekBYYIb3GeZ1j4c4w5TZAW+TYAvH/Rch6fWlUVsdXji
         /MLw==
X-Gm-Message-State: AFuF++kUv3CwJkGuq0h0wcRBs1FD2B4h/LqoEgybVCE/3seO5PjAodz3
	lj4bHVWuW5W8r0oJUOBYe9r+xSglY/bMRBEZ5Og62VfFU9ekF06stBon
X-Gm-Gg: AYBFou0ZREKzsXyMEAz6T5L6s8KJWSXClbQCNW3sKPCHzzlONQHEP8Bn+7p6R0qmUhL
	qGNyzFv637CQ2y8+/GroVAXbMZENc7+RRGBdOmsC1swNxU7DVkx0OjdRjPJ9mGfzvrl9kKsWRsa
	FRdpk4UBOOwO6NKSFszOPt9Th+cZnhKBhWKLEULUyoBEQwCLci7TkoBkqF0G64liDAqeOgzLbqN
	Twd4hqdH7C9bpdmBsdaHakkY0TlBr56CFXD4kY8GwMUIni8+hUkoibQ2u1AQAMrPk+MuBUa6mNO
	xpJ6FEma4rMVWFjdMzCpw4/9E1WXNcyzc3+N04ZhBpA1Wg7GBiOYX6uLCneFtRwua17+qDTeFlX
	8Yyvwdlu0EzBF05Xl0/zJULHktYJYKJdWLlCTG+H3iNA/TLvdxE/FJ+kBRXBKCdGCWU/BQ1fwdj
	iaCTyPNMngeEoGBSiKUb/8U6q6xMP6HebyQpde67scIgOdkwS1HDABiuJAajOO3Z2+/Yixi6EZR
	mN5cyMe8fDjzvV5BfdVNKaVPTmrDHpaJqXh4B0oUpoqRBuLpMN/S2fcCFua96b7h2PnuM4B+0Tm
	FP6mz0hfrzkE90vMwanBj9VFm8OjPCGkluopfux0sooUT9SXRE0ge3IVmKQHGmSiSZecd7qFOLt
	hcBwvhTyFZJCHco148eMq/RWNAjnt2CurxWPzx49+WCXwRMl+YSgk94/2DEV6wLAzUT9yGs44sK
	eh0W0qX3noqQIcjjsRWS6RsGt7OpHFl8/O9M8XQ2jGyXq6/WUviC1JikmkD4u7dseAIGSoqKl9u
	OzMoP0Fu9c=
X-Received: by 2002:a05:6938:a084:20b0:c29:d525:72a9 with SMTP id a640c23a62f3a-c29d5259cf5mr42196166b.49.1789462973844;
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/6] usb: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:17 +0000
Message-ID: <20260915090223.1346-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers in the USB subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (6):
  usb: core: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
  usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend()
    call
  usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
  usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call

 drivers/usb/cdns3/cdns3-plat.c    | 1 +
 drivers/usb/core/hub.c            | 1 +
 drivers/usb/host/xhci-mtk.c       | 2 ++
 drivers/usb/host/xhci-plat.c      | 2 ++
 drivers/usb/mtu3/mtu3_plat.c      | 2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 6 files changed, 9 insertions(+)

-- 
2.47.3

