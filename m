Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E903E7BCA
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006414; cv=none; b=WSojYJKhzfayGllfRvNVwgNuG4Na/rYtDpa6p2/LSyPdRj1atYXl16VN327g4d/TI6HZBPeS4pAEpR2bNzUda2/g5Wau5iZI1zhjQt2fhmE8V+Cif1psYHaf3HiTsZswhvCLTBvOprEsXwFEtZdNEZSoEVCl0y50P/I7Im2gNsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006414; c=relaxed/simple;
	bh=t3hfI3vt/EVN9rJvF36LzJL52/0eOpYB71LQKs6WXUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8p74Dp0qRj8fg0pwDur15kmZS+bHzj0W+kgcnukeTjNLKOhrs5CBqawUsPcnBSfuk2HTHW9fse2s4DNE496HH9Tz9EP8k7k3jv/nAasgXpau5zROlYdeMagQGjJA4KEKKF7jVVhNgQDzFmXOabyVEWOKdidy1R4Ph2bNnrrzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtbbP0Ea; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtbbP0Ea"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1227908f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786006409; x=1786611209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5L9sRSU4M7dAv92Jk3PRfyBZXvNn6RHGjwcKX82Y5s=;
        b=BtbbP0Ea1iWg5P3+Me6GZe7g6LGv/NlOGB4wN7/qsCengcZzI/efpDQ+fXGmVDi4/A
         oXUmKmDtnuxyKPg9cFHbTwbmH7YCs6oHqB4gaG/f07rk2bW+4XgD1xeNvxhlZsvu9yR3
         dYUyEIhqGqhDaSl1A4KWAYcF2sZVNJ22nnZjzcQ7mkgDn3kensz7RwLGNRh+/SiXu/8J
         fvhgip1UoFC9SHULaLScZKKaWr/xjlVUDofLo60g/M12NFqCYcuUkrUVPG9tUTyVw5Nx
         K75sfvYFQtwGgoG4X0Yl2wKTwkuNsQVxHn6tR/Frrcpz1HedZWCrpqPixvSXmoQ4spcI
         lmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006409; x=1786611209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5L9sRSU4M7dAv92Jk3PRfyBZXvNn6RHGjwcKX82Y5s=;
        b=Idhjp26KMCpEya3gaRrCG0EMy42Dm7N7qMDZHZydcJ7SVrkqQaYmhS7IJrXM33zNRu
         XfMIv0EsOlodRpXvJqhjYhvC7L/MmqBS7ImbXWdm5rON75kecq5hG12bI0j4WDjbseS5
         In9Et9sQoxYlm3hRK6Rk9mZgAVFIoI+yKq5aD1BSCC5S1Q7oiskz1Z823TRp6HR6J/cl
         0EpH5Fbez2Sus7eXjZypnsysFO1mR/KntU8/GArfai1onMaonSwWPzhpLWcn8XAWmmwe
         pPtq1sVDHwnbM1OCCfKm1ZItJNAwYDQZu5YHh3j8rjMb995nBpq2jzlfvtfepUz1ElTG
         go5w==
X-Forwarded-Encrypted: i=1; AHgh+Rq0PgR+K+pRQoNzBrJCAChacoo7TJccSpjeJkkugxQ6P/3aEkX404qUn+PmII4y7VZ2i5mj0y4jOFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJrK2CjoKbHBjn4u0Aqxr5Igwe+DRUCRa6NHTL8GE0v9l4SH0
	BaQ3U7lJIPXCgkrSFxyqqqSvKO5B3fUdJ3rEmzUSLkYONKfr150GRNi0
X-Gm-Gg: AR+sD12FofyFMMz0XUeweo8juJSSm8wGkc3tuFJ7jBZmXwnYnkikhSS3+PL8yQVEK5x
	7n5WeGA06nADiKTrXofrVfgcmE3BWW66IOciVP72VQxH5vPxsz7Anc9ncbc9BNfUJe1ERwqrchq
	tjlA1jwqzV9bhd6nSjprk1B+kpF48Wog6HqJ2uVvd1nWA5Z2t/Om9hBDFhlx5/gIDkpZ6fyNWRN
	hZMvEiFBIISJ6vDQ2Gyjdf8chkhMuBZvcaR1k0gSppIx0WYUtm21DrX4M2rwURgSqh5Q+U+8HFS
	2a686ys7DUFz34NPvpRPq17u9/xvlphDCMBn6VaJDAmbT27uLHxNJizoWCtqG3TUNVlpdCXLqDv
	TGx/J+VDyTRhAOPTNfzoIoylFDvn/LcAKUDMiJU9kpoOUjMB4OY94rbuXKSASCZaoscncNUhGWC
	zg9OW1WOvcKdD4TpfvZETnVzD2LYG1YtDXOG/tClSz0+YBTD/IXJCCt6DxWA07nhOup9gtVd0Jx
	oYyA1Fj
X-Received: by 2002:a05:6000:29ce:b0:47f:7c4c:8144 with SMTP id ffacd0b85a97d-47fec523d1fmr15852949f8f.10.1786006408706;
        Thu, 06 Aug 2026 01:53:28 -0700 (PDT)
Received: from LW-1H861937ND ([82.77.119.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b285b1sm5142674f8f.31.2026.08.06.01.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:53:28 -0700 (PDT)
From: Marian Rotariu <marian.c.rotariu@gmail.com>
To: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	javier.carrasco@wolfvision.net,
	linux-kernel@vger.kernel.org,
	Marian Rotariu <marian.c.rotariu@gmail.com>
Subject: [PATCH] usb: typec: tipd: don't send GAID when probe fails in APP mode
Date: Thu,  6 Aug 2026 11:53:02 +0300
Message-ID: <20260806085302.1307606-1-marian.c.rotariu@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When probe fails after the chip was already in APP mode (booted from
EEPROM), the err_reset_controller path unconditionally calls
tps->data->reset(), which for tps25750 sends the GAID 4CC command.
GAID transitions the chip from APP back to PTCH, causing a second
probe attempt that sees PTCH mode and tries to load the firmware from
/lib/firmware, instead of reading the EEPROM as it should.

The err_reset_controller path can be triggered by -EPROBE_DEFER from
the probe sequence. GAID should only be sent when the controller
actually loaded firmware at probe time.

The abnormal behavior was seen on a tps25751d that has an EEPROM
connected to it.

Fixes: d49f90822015 ("usb: typec: tipd: add init and reset functions to tipd_data")
Signed-off-by: Marian Rotariu <marian.c.rotariu@gmail.com>
---
 drivers/usb/typec/tipd/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 522f56742aa9..c2b235f3c225 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1783,6 +1783,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	const struct tipd_data *data;
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
+	bool patch_loaded = false;
 	u32 status;
 	u32 vid = 0;
 	int ret;
@@ -1838,6 +1839,7 @@ static int tps6598x_probe(struct i2c_client *client)
 		return ret;
 
 	if (ret == TPS_MODE_PTCH) {
+		patch_loaded = true;
 		ret = tps->data->init(tps);
 		if (ret)
 			return ret;
@@ -1928,7 +1930,8 @@ static int tps6598x_probe(struct i2c_client *client)
 	tps6598x_write64(tps, TPS_REG_INT_MASK1, 0);
 err_reset_controller:
 	/* Reset PD controller to remove any applied patch */
-	tps->data->reset(tps);
+	if (patch_loaded)
+		tps->data->reset(tps);
 
 	return ret;
 }
-- 
2.53.0

