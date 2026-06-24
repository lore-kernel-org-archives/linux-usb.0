Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D173128D5
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782263511; cv=none; b=ESkYWaEKnqlFu+UTMTfcRbIMcM43wEM4NO1aHZJavCGifr3xdXNFBJPqNxMAqoPF6/5OnTn3roTBuUtqIaKrbMWAeyOWP6GgvbQPQkNeoJV3luhFEpCUtdsS6pSvUNnYOss/svPya0JdLax7cy0WAiv4wfd3IrvzrqnEXky9VJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782263511; c=relaxed/simple;
	bh=9lMmsWiogmot6jiscVecPkAhRPPcUkLd9+xtnHuo1Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ys9rAHHfDKNrs1gEYQWqRvmTomMpq20Q/wCxnRRwoNqgLkKen1y2JPfXtxNG9KkPM8eo3vhTYHaZWhrsHLoetEPg7HrlgG710qAE5nzd9/2T09W4wWkgyeNx74rQMCdGDLc17TSFvQVW0GEOHkyOsLUlJG4fxPaVlesFBIBkmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYrgqx/G; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYrgqx/G"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6be9cd89bso1876995ad.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 18:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782263510; x=1782868310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LELhUskhXuiKsC4THrExyFjSznZ6BkV2hrOLEnNm1A=;
        b=DYrgqx/GS4epd68j7YXYhavWA9Hz5MElvQmr0QZ1KvYJc55l/ZoUj1MmLJmNXjghIe
         NWNhjYaR5RQCAHbczYNf5kIN4MjHr1V9Acmq/znbjVWSnB4Xv5CdD13pPgGaS6aQoFGY
         G51f0Z6yTYBGo7BRobU76u83eK2bRsQ4IJi/aI0zeRZZ3Pr96uINYb9t8ow7EsFyYjdj
         as6FNbl7sYut6tLnd8nT0yHnMh5Zv+FhiNZnBzdDBg8h/dZFSE6DiiVc5mblhMsaD9sH
         rt29l7a89Dk/YD/o+bzV+S6RwYazfmq8cR4S1GUpcij2+lKOHB/XFb1x+K9qkyYqHUnG
         L8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782263510; x=1782868310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LELhUskhXuiKsC4THrExyFjSznZ6BkV2hrOLEnNm1A=;
        b=Vis5lk9owqaWLMniDiqBcFv1KcE3ooa9t9J0d2cPipMbOppp2AwafJDeT5wRt4Iwko
         qxk2tCOjSA2EaR4IbWlG+nUlvofXOksU3M0tsZg2/oY48RmoYPQFPU5E/LcKtq8wvROh
         HOoUzuMPulXnb5zwQdbKQrIzmylRDXmQEy7Eexs8LxWIIFBzEXg0nD8WCvohxxRglqbN
         S7VsS98f+jWkKSdzaP4GHfnfPjuerwQVrsjLoffOUcO9MTdNLr/teiNQw5k9nDsA+yRn
         erTjyYEKgCpbRJ+DzV4XWvwBmA7v6RNCijpGuBRaxeMM2EYHkfwAfl51g0yjSTTAQ2LN
         yFCA==
X-Forwarded-Encrypted: i=1; AHgh+RpLwvcBF5mnSTA82wytNS2bAtCCcj51qMLh08enHN83UzBI7q0DrvBf6PgpriBsXU04iOccKr9eGlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywpGC22gQJzCzrGUcPOacW7nuqj5cy6jYCYAe/RHj0PvE29bRX
	nvnXd2+3tls7op1fq1d4fI75JM7Xpnxu+7nea/E6MUu65pUjkgmDTcbR
X-Gm-Gg: AfdE7cmHrDs6XEKIC6kryrjMV8uXNeHO9NDKiQB9EPS7Duxy6oIKJTGlByAS32VzS7C
	ugsx2ogrffmEAGPjPaUJwYnCYG013QMbamcvS7+AeX7qogj+mtSdKRfqcFmfymeVYZAeiIzC6/I
	iGbS4I0GfivzL/e8Hro1UdUu83g842qNxicqYgUFMTe990hdeQskLBUVCbDW26r0/NDEahbQK81
	NB7DaOXC7owsx6VmeFvR1pD0tbYnyszasilCuUShbin0TH2wI6iN/C/DWNcLhZdlsdAaqlKVdGm
	bwrzeBlFRVkyGQDJcvnvixoH5PhJTbC6njG0QlSKCJQ2P4tOgsPYqi//jzn2uHKXqRIN0ur5bz7
	XkN9VMQbwXziWXESSwUrWpvKH9cRr7YHirI3BURfqibuCtyyujNI+lX+qCUSdQ2MdV18YrMI5qL
	aJIh3X/C8=
X-Received: by 2002:a17:903:2c8:b0:2c7:d071:3ef1 with SMTP id d9443c01a7336-2c7e14af370mr13590745ad.19.1782263509403;
        Tue, 23 Jun 2026 18:11:49 -0700 (PDT)
Received: from gmail.com ([113.90.157.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cfbsm116825115ad.45.2026.06.23.18.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:11:49 -0700 (PDT)
From: Rqirus <cmh79479@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rqirus <cmh79479@gmail.com>
Subject: [PATCH] thunderbolt: xdomain: notify peers after enumeration
Date: Wed, 24 Jun 2026 09:11:31 +0800
Message-ID: <20260624011131.2532004-1-cmh79479@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Service drivers may register local XDomain properties while discovery is
still in progress. This can cause the properties changed notification to be
sent before the peer is ready to act on it.

If the peer has already read the local property block before the service
was registered, it may keep using the old property generation and miss the
newly registered service. With ThunderboltIP this can leave the network
service half-discovered after a warm reboot and the login request
eventually times out.

Queue another properties changed notification after the XDomain reaches
ENUMERATED so the peer can re-read the final local properties.

Signed-off-by: Rqirus <cmh79479@gmail.com>
---
 drivers/thunderbolt/xdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 86b2f7474..9c068d073 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1811,6 +1811,7 @@ static void tb_xdomain_state_work(struct work_struct *work)
 			tb_xdomain_failed(xd);
 		} else {
 			xd->state = XDOMAIN_STATE_ENUMERATED;
+			tb_xdomain_queue_properties_changed(xd);
 		}
 		break;
 

base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
-- 
2.47.3

