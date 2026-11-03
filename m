Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713848;
	b=nIRvCSD7qKNlPxgDgR4cHsam/jJsY8SaxyC4jmMUtE825m7rWTuv17Bl8xiOtB5Ni+Ka
	 V0nZaw903nTRyTSZzqIGu8W5xfleBR/69qOf/JjLsMWuAMeM0gVLQTqODfSdN/ysuc+SQ
	 E4MaRy22RiUirGDcRvMlFHcKy0Jy86LjgL+TK8zZvhAqCKHIVEINy7WKbF4hc7B0e+ImF
	 +jE2xDLaSHWmcQxQpFBrrRZOZlwHcRBwBPb52VmcHp2+hyYOylBO6dXb5qD3ciKgAqKh4
	 aKBKUjDCcED0LEcBIhBFLiBmUsq2mOiYhzW/D7sJIhQ3xtFH9Pod07mgMkJCfKD1Nng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
	b=OcqLpAi6O/l974hJpaTPQFLHxPcejqnofFaNpI1GTXSDDrr8skG7r1nrTuaKxNBwdplS
	 DvnLXpCmy4uNo3lAORUAsPxQZsos57KNg8Cxe7oAzu4pNvvrNd83UQezv/shK/+gHq/6V
	 3Y8Eck1dH7H2IQiMdsPWF/Ab40qgr0C+2pER6X/2hdeq6MaG43A29HDy0Aosce8kO3LX4
	 Gde60UogG7jBG9VYFOjZHqZEXnp1jEO/oU1wsr0fzkRV0Wec5GzSlECtwbnb52TfkdIm+
	 onslS53hchNMTo+KmOxLYnuthFHlQCnp8WDqsKhv+e3mn2MgU6PeAkxo0ZqZmRqLQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6C8606D819
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6C8606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso3308051c88.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713847; x=1794318647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=m+cGWw8HKJ8o6/4u8Q6E0ZLb/I3Bj5h5DWw7ICnAPKp4/EwJAuPzCkuy23H8DCc+dY
         +ND+UCXf6Isyw+r9M4VIyJd0A5TIxxqKpl5jqd7fHPQEa91T1xMUiSPei87Zz7ootcdQ
         lG9gX376h8ayU9xs+y0y9pq5tA6m824QkSwLuKCHYVAXxbjDHkpPFDX/Z5OZkFef4fUW
         GEyIa/KesY/b2Ohn15JyLZQdVnjWGaDWS2METlbt/acCnqqCGhZdAshzTbkNqTVCWiLK
         v+2b2rxqZiWPFWNMRMzUxzqEmT8lBACT2/nkzmcrejuwEcHIoV/92SB3+Bn0oQZ4JQIw
         XQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713847; x=1794318647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=pj2Qh7mikrsMYzD5WyKVCx3s/tyW8d8bZbO4NK6946sOZzaZhNdEtMNGdPZqHsdajF
         UYOgSVkwGKU6P5xoV0rLf/xYDyIm3KXS0ACuPKrHQio0RA2IvWBfJUF+v/7OkUfKTcUI
         atwWRIX/Aw0Q54OShbWLzYnjZaKQgy5M91NP/ML3wd+UVReseRk39i4q8Y41t9CwRxAc
         PAmDQhTpQEGSK+lxg/jEOFZXEzaBJ/Qx59JXYi6vOO7Gw7AsshKkUXwh+1nK3PQ3ueDt
         hesCaKq4fAC+FC7gpI0wM/bQatKCR4bHjsjNe+JEMdC1xgomjqMKaffYGn+gbwjFRWVf
         CeAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwML6tBvjWasPu2WufF1ouh1LnaZishy1/jGGCm6At+LN5oPVsvTFl54mNeukzSJKPCIK0pZfSj6+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z86pEVamNUOAaJb729xzD0Ft50vHoJLztCCo0GgntoI/DnmmvSd
	/dIvwc1WGWfGrIumOALwDrBfPfVd4gJ5clNp1Qq39pblcYgeSKOf7eJ7
X-Gm-Gg: AYBFou0gR8T/HxxdYHoOV0L1BtlDbGOru9sRnBBH9IHqM6TrHF4201xgHN6etdTN6nf
	p/TH+7YAByVu/exbQgoovgG51TR/Nsa3zNgv0/prMKjdmFJcQ/pABE/62xkw3nKpoD1pwW4XWBs
	tuprJ8l5QkRMQ/v5uIUlPB2e+JP3+uebjy00//33at+erWc5ns+YoJrQNmSFugDxOiZe457I22E
	l2XnMu632LK7vAcIWtONmOAIXCPnt33gSYR6H3RGJhids3iJ294exVuIxanvyu5ei2Wrhgx6QAz
	c4Mkd/CiOcAzFrwKufT8+ONQ2Q5EEu59pqFreOCCzfZT19MFG7GaMmwN/t9vAnEiSSMVV1T+H/U
	kBbV00nvbwloCbMhs/c5TOW3yqiMOKj4j78ddbujMuTARAyLiajEDl/k8IDLKQK/bMZJEw0GLog
	kcZmA2By8mZwm3Ho1dABbgh8qwMkKZEkTGGSo0lMly+5fjCHO9QWbn6czQucHysSeEYGmL2B/rg
	MyLjmvRV7IelHgz+mtyUuesM8s7qr2fk9Wwi2/Er8ZVFL7BgQDd1lv+9OgG+LuI4/As1LCEaEqf
	42QVt4pkMZ75LNDv/G1w+k6ap8urw5ByY9KOgsE3x10LULObd0CyccnOj/nr5yYHKg==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr21734399c88.45.1793713846762;
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm44055965c88.0.2026.11.03.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Leave the mux to the altmode driver for alt mode partners
Date: Tue,  3 Nov 2026 22:50:46 +0900
Message-ID: <20261103135046.1654-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

Commit 25a2bc21c863 ("usb: typec: ucsi: call typec_set_mode on
non-altmode partner change") set TYPEC_STATE_USB only when the partner
flags were exactly USB, so that the altmode drivers set up the
switches, muxes and retimers for alt mode partners. Commit 226ff2e681d0
("usb: typec: ucsi: Convert connector specific commands to bitmaps")
turned that into a test of the USB bit alone, so a partner that
reports both USB and alt mode now gets TYPEC_STATE_USB as well.

On pmic_glink platforms the altmode driver programs the same mux chain,
and the two notifications are not ordered. When the UCSI connector
change comes last, an FSA4480 switches the SBU lines off, the
DisplayPort AUX channel stops working and the sink is never detected.
On the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this happens when a
DisplayPort sink is plugged in during system suspend.

Set TYPEC_STATE_USB only when the partner does not report alt mode.
USB4 partners keep TYPEC_STATE_USB, as they do now.

Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2f9adf4f8bde..395554ba0312 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1356,7 +1356,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			typec_set_mode(con->port, TYPEC_MODE_AUDIO);
 			break;
 		default:
-			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
+			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB) &&
+			    !UCSI_CONSTAT(con, PARTNER_FLAG_ALT_MODE))
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
 

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

