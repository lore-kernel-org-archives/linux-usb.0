Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90278363C64
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 05:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809085; cv=none; b=FqIsBZI+jGusNayz5fnI3WDqYInDhIe+RAxttbEGPUckbt+8g+AQLzZBjCG77Dj36T2+44tuHi2WE99cvogasHtjJDs8S2CUOX+zqzBT2sJsnn0YFNo8YYoW0pnmCsG0Kpcgz0vAao6dPYkOvDFjE7/vo5K6pQPwdfAHpDNSnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809085; c=relaxed/simple;
	bh=Fi9frtw8kMPt1GrRNX58s9IxyDACuZ8FrDv4qp2ewVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4detzzoSGLjhP8g1AGz/d2lJEaiFPYhbgo0Ac09TP7/vnO9yUjvXFi8xsx15ZgaKqmQPCAQd7tICJ11JqPSj6F6LJ+oahrhztPP+f3MAg1mq6EEMp9C3Hg2qnpo7jptTpTQHIB+Vvo3Uu2s7m9Ds238C+MM7oalYDqhkPkHbZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdZ3x/kD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdZ3x/kD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39652a6e963so587446a91.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787809084; x=1788413884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iswCVfsJzx7eQJFCwsKKR1zCuDmwXO4EX3JbVp3VQ/s=;
        b=qdZ3x/kD+wHKjqXl6vuSYxjWaJsxLEzTg0r0NhXFSz1srsGIQDZ0GkwDedGWG6WIvl
         r2drE0tIEZYUPWGmKYCySFcYxERnTJ24tScyQyTldjQe7OBEdC9tjVfuWwqucL44gTDb
         xKJrnoimk+jeOvcNjq00qWG/scFoWVu5anspOvJSTFymFNnooLRARQ8K/ZbmWOwaUFAl
         JM+MBvr/iCFQPgMZKTe0V6+L+dxsSAy0an08vuc7xgfVFbpl05DAORo7vaQOkLdk56yt
         J0DVmCbEegrDqXuMhnTdYbO8YQfj2wcSbW1eiVPnlr9Tp6qy5g/zXRRNY1Lx65HHCjCs
         azXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787809084; x=1788413884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iswCVfsJzx7eQJFCwsKKR1zCuDmwXO4EX3JbVp3VQ/s=;
        b=tABiOa4kHMY2/pJYlpeM69VSFXFcaYPFF0YAH/hedqAVOPLy10EaZFzv2+DPNobraH
         zqdFhObEtrxqUUe/z/W95shm/gwUNlU/kt4TXf0rj6vkjRBiam3Y/DZFLKDg+4NawoQY
         Woiexqii/ClK725XiOVbl9hD5/G7yoKtTNpDAEpIFqwc45AFpKb5DDMPErcS6y9Qukax
         A6HK7Ghg3TJtxy1fI9tkla2Zc3Ws6mF8hoiQsh4ikUZ0g9pKQ/SPiNiNaqtOjDRJPA8P
         GJGBrbHjikTCoOEwrTxkDScPnjyOecqEyloBRsWgqY2qgc89r4P0u+gVuB/0BP6EpXbW
         XMEQ==
X-Forwarded-Encrypted: i=1; AHgh+RonhsHuPH0LicGOC3+13tnKlDQ5P0BnCm+mumWXMmTtoIio1fptpLQB6V27BPCToOy+pA+SE/5vXNU=@vger.kernel.org
X-Gm-Message-State: AFuF++kxMkUrFOQ37gSm6mWa+QuW/wdf3RrMPPYf6j70pXM4nXAb6fQW
	7rb5B/sLhZdjTOreGDuuBKcGJ20OU7UHzlFupWQvKwRscH0fhvdi4pvc
X-Gm-Gg: AR+sD106SJNe+KISRE4ciiFlW+gACi5LSyi9C77yJLAEMQZZGLt6+66qyPNzzYyHJfa
	7KyY11iD1JBbR1uQcQ7RdxirfbGTPoPDwTxWZnM/jdBUddfN/ERP5k3cCKK5SN3J6TUGYm/qKZp
	4ssZEG7U0QyRcr/MiMBNk2tqq0mozphypoyx+VGCEutVaja6iXrwI9z5FzlPVL6j+YJouOS8a9A
	k7KcZH2GhSjKaKYhxOaf6EE3kj1FLDUBx9/Y+b0yQMoAiPLocVsxrmPs/uqCv+3ffYqtc66cTLq
	Hjs1XpmzRGhETBrDkIhdnvnQ9VjeAAI804dBZUBdgTISlI/bOu5SO8JkjTNwR+X7fbmJw/d6GNH
	0AY7zsIjBoXZxiufzbquxzz46r5fOSDau/HGn5IMmDzuvrtB2rCKoD6IHHJeWGQC+yRc6OLoDPK
	3ZMciVj9Tm5AOix4j8Rkb7xXmOJKHjSUjKaYqLOdHK2JMc87P0G7GT4e3i8QInOWmwUHaFcEoDb
	DvxaRhnezdBcjH+NFP1tgilPu5S6Zz5LypFf6V0bn6hTqVv2tmmMNITySrCwNZZ
X-Received: by 2002:a17:90b:2884:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-3969ba558eamr5029727a91.2.1787809083744;
        Wed, 26 Aug 2026 22:38:03 -0700 (PDT)
Received: from localhost.localdomain (KD059138194111.ppp-bb.dion.ne.jp. [59.138.194.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1123142sm1242134a91.15.2026.08.26.22.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:38:03 -0700 (PDT)
From: Youngjoon Lee <getfeus@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: fix ERST max field conversion
Date: Thu, 27 Aug 2026 05:37:48 +0000
Message-ID: <20260827053748.3755-1-getfeus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field
macros") converted the ERST maximum calculation from BIT() to a
left shift. These operations are not equivalent because the
HCS_ERST_MAX field contains an exponent.

On an MT8173 xHCI controller where HCS_ERST_MAX is zero, the new
calculation produces zero event ring segments. This reaches
dma_alloc_coherent() with a zero size, triggers a page allocator
warning, and prevents xHCI from probing with -ENOMEM.

Preserve the original calculation by applying BIT() to the value
extracted with FIELD_GET().

This restores the USB 2.0 and USB 3.0 root hubs on MT8173. A USB
webcam and both USB 2.0 and USB 3.0 hubs enumerate successfully,
and the previous ERST allocation failure is no longer present.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Signed-off-by: Youngjoon Lee <getfeus@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..af8d4b74c4ba 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2301,7 +2301,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!segs)
 		segs = ERST_DEFAULT_SEGS;
 
-	max_segs = FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2) << 2;
+	max_segs = BIT(FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2));
 	segs = min(segs, max_segs);
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
-- 
2.55.0

