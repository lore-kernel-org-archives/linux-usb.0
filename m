Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9D3EBF16
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777715; cv=none; b=l36sA2I4j+zoGM8S0DSWcUW8GwQwIN+n6sS499qfBlQZhAZ/fS4td1hD1QSxbuCrxIOXq0KrTsw0bhNq0oMWJ7cN4qMUM6UuEvKl+SYguwuoteWqgm/+ymXckEAUtigsCVKUKgpMpYYDW0d9Sp4etWjurvrCvtfSP1z9hYrDf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777715; c=relaxed/simple;
	bh=1Pk+ay6yU++Vt771lsD3x/881ULnMf1UUk6bSMRDqb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aPVOC7PoAenV/j78krjX1GwqBSyNpsWA69AVcRi9R0kfMPHaayePskRsztMWHxlB4aG2zamCCn6zvKksc3i8D0HQvgwFiW8LPq6FdbBok8iVUkws+Yt7lph9xN61E9lIhgVwqcVlx4fT4ADt1nkU4YIBzouHI9Jzp2O1gpV4HKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AgmwK+1W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AgmwK+1W"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so460307f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781777705; x=1782382505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ekg7H/2XArtMw/8kbK2+ZwTBpxjVhy5IaU3nSg0eAI=;
        b=AgmwK+1W3eZEGfZ4xvOhviKpNoRCbWMSEeBFNICDmG4WqdJf2TuwgyvKjzRUBs0Wnn
         uUihI7+BOdS171CehnwkUKR0GzxInlajtu4TpmaDLGne988eJzKO0f+BDE52QcLExtY5
         s3TRSviVpNB4aCFEpepmrmyJKYtcbGoIhvBPnOSdxyialAknn1cpHCAAdwoyYcLXq0R6
         Tb0ayryDWAQ1C5jZFGBMPrpYoehw6y7p828JE0OH3M5p5L+1TdnhNhZZTpA4hD3y6cbB
         JyxsuejPUf7gyDMi3HYWY1gfq0bp5/1f6Ym+Dzzoj6qV5UPgQxdVlDwSKrp0hMebj2rr
         OLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777705; x=1782382505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ekg7H/2XArtMw/8kbK2+ZwTBpxjVhy5IaU3nSg0eAI=;
        b=pmiHsQHF8e5KwWgcmZA9Y2LQ0pPlgRkJt70qwsYZRO+YuzADjPLFgONYSKleVxJYP0
         0VBR9dBsSrtJKprtwWug6Dcqec6wGmg4bx/387l02epg+CSTgwLiJrgqvcBt97tV++yV
         3Zqemn7YDnqeffGpiTDTw8Ryo3tF9v9Yh/uxN4gcsxjrgsUkpzXPWgEmOjahu7+qFqVF
         y9xCs1gGa8uv01YLLThlQIFpK7hCZ6D4Q9h6d+N5JWJkSxDiCBxhfIgkoPVKbSXluwHq
         SjrOieb0z2o1mV9iiFK8b3SXucHyVTNjNoFQnRRyPy5/ICBqd+NL8W7LXuJRQ2tlyi4u
         Nxwg==
X-Forwarded-Encrypted: i=1; AFNElJ9L3ReSwK199/hv8GLyyqGGGcwxcV7cZ4bA9FcpoOH0qIcWlTxovWe5hkWV/lqASFWUoCyEZ9jKYEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FRmC2nLMmW6eAyMH51xVe0z7C9D0yn6g24UCie+prUXNdZNq
	kdmkCN/B4hLqbd09CGojW8eHxm2UeYVaHthlPlcjlrhecHQosFkmhCgS8Omjve7D3dc=
X-Gm-Gg: AfdE7cmCwuqGY5GoUngt4bdZq9XKGRYJKvaphiXkoxqrO8Bv3e84LpVbpsktoZPeN7m
	yA/M4hY+wx0dNLqCkIrWpc5nyg5SXoNbVNIbKxjx9HMESp6Jo2p2sl0D6nE1Na4SGYVp3dg7i9q
	DGo9W5WYaTIidnXVRWGW1OvW5e/z27KYBI506DPQQ6QrPaWI32DmLICjjTYKL0cQESsvltS0ykp
	83IIToP1Bukux0Va2nRWGywi9BBxv1ADolUgp3TmeV3Y+4cDf0LURFydmkdJ/GOvVgjLFXoGDrk
	2iqmakrd3J+wdlqZolsRjN2iZbC/i+YNybp/9Sb1gnd5Ud1L9s04PN5LgXEVu2VjwPqUMIzTGga
	CkzbhVfBDEUXf4QEFAcd+0vNWv9TZLbKSAbMuhZvltk1m9duQj3jPpOGDe68W268NcAKOBiV8PR
	0/ppL5ugzCzOi2xngThTaAXurBBCi4WnVsY+5QqgD1Cs/vaTPRLbAZyNhAbBJCkBKXCtHATJC6M
	RqC
X-Received: by 2002:a05:6000:1869:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-463ad6ca6efmr5164409f8f.34.1781777705484;
        Thu, 18 Jun 2026 03:15:05 -0700 (PDT)
Received: from localhost (p200300f65f47db048595530b320b6c5c.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8595:530b:320b:6c5c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2b0d70sm62313771f8f.19.2026.06.18.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:15:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 0/3] thunderbold: A few cleanups
Date: Thu, 18 Jun 2026 12:14:49 +0200
Message-ID: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1Pk+ay6yU++Vt771lsD3x/881ULnMf1UUk6bSMRDqb0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqM8UasF+6Bo1y6lFzE9g1UVds6rVHrzDi0jehW NiZ2GrAUXGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajPFGgAKCRCPgPtYfRL+ TnYJCACPUCMkUE/rTzhYUhoiVMd246EVg8RCAy5wgNvgNSSVUwEKjujh6GwcrU4QOgqiXd1WayI uI9P9v4OBNfEDfcF8/wDivE2hiWxhxs08vb+b7uXlMjVyxKt0qT7rLFOhRGE6FVAn+VmttF9tyo zWfyMRFFguDni/aSkghI9R+tVMw/XFmwmdq+l6zs6agTIDHZgvWdR4IK2nzwgaYbZ60KorJAtI6 8AaZHgsx8Lj8eNnW0af70A2etoJ3zdexC6jIVFkCLXTuB4GgTloMJQlq+ZcMtWC9ibI9NsoCs4A 0mtx6QMSrU0WqKtz3clb+26hq3Qi8gKilHLbhJ/qim+zXL67
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

I'm currently working on a project that includes looking at all device
ID structures from <linux/mod_devicetable.h>. While doing that for
tb_service_id, I spotted these patch opportunities.

These are all non-critical and also my quest doesn't depend on this, so
there is no urge to apply these patches. My suggestion is to apply them
via the thunderbold tree during the next merge window with an ack from
the network guys.

The first patch touches drivers/net and drivers/thunderbold. It could
theretically be split, but then this results in at least 3 commits which
seems excessive to handle three drivers, so I kept it as a single patch.

The third patch is a style change and so is subjective. Drop it, if you
don't like it. Here splitting would be easy, but given that patch #1
already touches the same files, letting these go in together without
splitting seems to be sensible.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  thunderbold: Stop passing matched device ID to .probe()
  thunderbold: Assert that a service driver has a probe callback
  thunderbold: Drop comma after device id array terminator

 drivers/net/thunderbolt/main.c | 4 ++--
 drivers/thunderbolt/dma_test.c | 4 ++--
 drivers/thunderbolt/domain.c   | 4 +---
 drivers/thunderbolt/stream.c   | 4 ++--
 drivers/thunderbolt/xdomain.c  | 3 +++
 include/linux/thunderbolt.h    | 2 +-
 6 files changed, 11 insertions(+), 10 deletions(-)


base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
-- 
2.47.3

