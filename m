Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653914;
	b=rKOSchi24P1KdmTYSWECJitX8HpFyOHapcrt7YLcakTpgbPHxu18hTyJauw9ApDiHnf7
	 SVlaisr+qUykcRkCyDVOdCSWktrtGMtGNtO27o9VVpG1SlWF9ErJd+5Bb/i75bYHc8yI0
	 QNkTPSifAeAUH/jpDWtATL6iT5J9BhMkgNWyOm5KfMPqrWGqyhGlcY1/XOsnWpZRYLilE
	 WliCkJWYt6vHp1ZvfWV+6V5zAzjBZ2loIQAaLk6Sw1Rob/gKGWjWLbmMYru2f7G9AwP/s
	 /06sa280xcF7y+CjmliZQtQhRFpqpF7HG+uYhO6ggZIL/JGD6m/lk43QPhVu8VaZWxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
	b=atQFFO7kheKpoqgtdvnN25kFU5cO6gDGA1bXxz/0vKeUXBIEeEJ9Ge+43Q6eHpczq945
	 7BJFFc0+NI0OYd+awr7ATMk8ia3ZKiYwCzpP6jEnrbKXUEP2/WZceXQTAFeNT6GjRymhU
	 1IFFrWkfUk7ztWlQt7azy6PKy3V29fi4KGgMQZ/CAeZjSor4O929VNWxrJHJH5o2ZrYRP
	 6snJQ0edo5imVm1uEr7/YZ2O5idOWkdMCijD9TjEwCI2GRyRioyqWuuakP6VLB2niIXUZ
	 46YH0Is0Oel1mZ2Hul4g2gRow2RzYlFvUzhklCHzxeb7d8m0FwLoLWwN0Bo+fv4q9Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw7n9TV3;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B47606A33F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 21:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B47606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw7n9TV3
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so47842f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 13:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793653912; x=1794258712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
        b=pw7n9TV3hXbr93+QK6KCZ4NiaMlSC9VR2NTKxZ2G0KbF5cf0GwPv6+wTsD2HFv5pVF
         41/qrKMfz9jKsmJZ8B6zEoboqIokpkDk4hzu+vBELk2zJJ+itarOLBYTqepkoemmJL6Y
         +s3X6mqVytQDAU3hRx4MntWocJJazcWWDfg1ze9l8hGMJhPRDsb9ghwED4Tqp47s4Yvl
         5q+5uXdv+U2UtaXe5/+l3LWdkvL+on2ieWX92QKKxz0PGib0vx5UxbXbc/kOtIg/2NZf
         r05xepgHxRbEPNpzHdkgCorevDEHFHAZbZlqVZ5Y50/PKFcyBOVIggBydWpyBRWzYQ/c
         lWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653912; x=1794258712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
        b=1WOiRuHbjlaifdzHRWEePLRlOuuJfHIb2U6JZ6erqAPcLDXiR+9uMiUZKwySE5NTXn
         fGq86xOGnygeir40lLWfQPyQwfK3wDFzbfKc9dsfLF2K+sqJKT556zenqZ1XMwuGqLHQ
         Yst7OPP8e0LPL/GPFG5MJGjzmn9uxzmytJNXnKDy6HuZEmQG7/NQ1qBhmRAjUKMD86tO
         7JIgoZ5DQpPXUFySc2K1DAkrMneqD4O9U7aBnssvq6gK/fHp24PgrBHqzRsVLHdCWBSv
         y1zuZMrWuiKp+ccilkGsrSMlnM78D8AMst0u8Vs6K1BOQutUiP3Z9atSaueep7C2HIhU
         7MaA==
X-Forwarded-Encrypted: i=1; AKwUvBwouujc2r7I+57Yj2BtTPZaEUe7Vzhy+JjM4j+rItKZV0ynVa0ZkEN59GARXY6F2tl+Dhj7spNO/cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gMmFHQA2QMOzh7mIhTftqUDNuatLET6gwc1LFKa4cFk/4/+SV
	1KQKB+R/VSjv+FdOaH64YG6zvFq7ku0ySVbZdnMkpRAUOmRRD9MMZFUd
X-Gm-Gg: AYBFou1Q1G2RSp70v5mSTg93OIcWOMlnErLY5yM+apSsUisAyz1NyRGhHQWnAFa8gaj
	Wv9t2yEBL2LL3DOmI08gwUZtIZaPi7MOzG1ajn0W4wzvfhhGEs8DzTV0e8P4RwnuCXMPM/xIlC3
	NIhbo2eTFTW9f5qZFRvDR+br4f+KVjRsMi1aqjJHASkmDmGzJ3jbgMABraEzu7Sk80pEPoQouCG
	zECCemTNZPiq1Pz7Jvy0ZdWIfQkdDnuF6+sHrbfqQF0Hpc4KakZ/nomAVhoyu3a1fEwtB+rIcrQ
	fKMk+rj6zeDuyKBZY3NlEV1Xd56fJULASjYKDTYHSHCDTXREKC8pOAKbBALVTVSj7tA6pNKPdJE
	NtvyLtQooDV0D8YQWYMGouKoIH8giiInwnGrqapcg0aUzYw5xKNNeszZKF6YWAitImQnSct21wb
	TXTCJ7Xh+2EhmpTkIIlp84rXgG/IgZZlVAoGSN1gdSeZc2ODxVX47fuc8lRBAB/H1bgjF8GQngq
	8ySfjyh+QwO3LL/FFnoWxUzezimz74PWHJS2se20cFvo2P7X6YpAxcg1SPLaucXGDEBa4kI4qwy
	FYWV7vsmlWSCrjz/7txED+2eKqy+nbci42Mj6f/UUUNv0SkawzN511h4I4eeymfzDkjCsewaJw=
	=
X-Received: by 2002:a5d:584e:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-48e6e2e2369mr26875294f8f.22.1793653912530;
        Mon, 02 Nov 2026 13:11:52 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm21535520f8f.9.2026.11.02.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:11:52 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Mon,  2 Nov 2026 22:11:19 +0100
Message-ID: <20261102211119.8738-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
set. A subsequent open enables NAPI again, triggering BUG_ON() in
napi_enable().

Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.

Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
With the fix, the injected allocation failure returns -ENOMEM and a
subsequent open succeeds. Verified connectivity with ping and SSH.

Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
v3:
- Target net-next and drop the Fixes tag as requested by Andrew.
v2: https://lore.kernel.org/netdev/20261020202614.30277-1-stefanomunari.sm@gmail.com
- Move cleanup code to err_napi unwind label as suggested by Nicolai.
- Add Nicolai's Reviewed-by tag.
v1: https://lore.kernel.org/netdev/20261016000521.92868-1-stefanomunari.sm@gmail.com
---
 drivers/net/usb/lan78xx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 181e8c087..d73002b2c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3497,17 +3497,20 @@ static int lan78xx_open(struct net_device *net)
 		if (ret < 0) {
 			netif_err(dev, ifup, dev->net,
 				  "intr submit %d\n", ret);
-			goto done;
+			goto err_napi;
 		}
 	}
 
 	phylink_start(dev->phylink);
-
-done:
 	mutex_unlock(&dev->dev_mutex);
 
-	if (ret < 0)
-		usb_autopm_put_interface(dev->intf);
+	return 0;
+
+err_napi:
+	clear_bit(EVENT_DEV_OPEN, &dev->flags);
+	napi_disable(&dev->napi);
+	mutex_unlock(&dev->dev_mutex);
+	usb_autopm_put_interface(dev->intf);
 
 	return ret;
 }
-- 
2.55.0

