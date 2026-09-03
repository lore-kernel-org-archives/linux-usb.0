Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE244A3D45
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438902; cv=none; b=s7zj9HqHJtcu1iBmrfs8yj3Mk/lV8ISGi6fBrGvy8OowKRMDPVWF0ThC2MWbPaL/t+zVZiHZluUd7eU0qgxk73tH1sH52xN9Ovzubquvcng5Ui7KrCgn2MluwnrjqIyNPb3piQvxUxyGBdRVSGgcAWfxJ8e84JrDmBugidlSERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438902; c=relaxed/simple;
	bh=JrK1bAtN3bM9rzummElZ8+40mAnNqdJDFMTC31taoS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuYuVGJDYQbGozgPvhgy65ucznRJRjIVD8LQ+87Pu8DQuhSZEPoFlv+3QDGxytemUDALt8T5vtvkOEEILls0UBwbphwXLcaG97/8uQIBqOUYwcs0d4As1ee+XuEvAE70WhrCSMHSaYWCSiE1DXCxZV4VJ4HnG8y2BnNDEdYUh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAOzHkPa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAOzHkPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438901; x=1819974901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrK1bAtN3bM9rzummElZ8+40mAnNqdJDFMTC31taoS0=;
  b=PAOzHkPaL8xKSTKDdcx2yckfJwTaa0U8SYIKciFS57+KuPbJBGNP/pg9
   Qaf87NpApsuXBJiMWoWo4QU1JpLA0aoyzMWTLFzamWGI4r4344q4JFMqb
   HhBGQq7nucDQ+xJ1XMLMuJzV5HRNjzwmHjkVL4BM1OEFAozW7KP8ldT4d
   HqxqltwKEnzo/Dijkmuro98OIELJZYGUm30n9VEF4wS+sHMf44NGMQ6hd
   621BT4SSVXgF+L75ePZ8YJtFxHrZjwGcRJ5pDPOqo6yse93PhyjAzWjGL
   /e9DYmj2e1OleVAhcYGpIfr6D0tIrIi+wmpP7N2nfJ9QSzOREbtQwWacT
   g==;
X-CSE-ConnectionGUID: ImD/5XVcR0ijCbeuqwCycg==
X-CSE-MsgGUID: ufAqpngGSLeurGshlw3EVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99250162"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99250162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:34:58 -0700
X-CSE-ConnectionGUID: FiiAtzMYR7WDRaYADxc8Gg==
X-CSE-MsgGUID: /Ol0OTLhQSe0NVhc3KjKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267123218"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 05:34:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0CE619B; Thu, 03 Sep 2026 14:34:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] thunderbolt: Do not WARN about already disabled interrupt on polled rings
Date: Thu,  3 Sep 2026 14:34:51 +0200
Message-ID: <20260903123455.2048076-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
References: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With ->start_poll it is possible that the ring is actually already
disabled before tb_ring_stop() is called. This is expected behaviour so
there is no point warning about that.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index a5ecfcf127e9..985b53399561 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -139,10 +139,19 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		"%s interrupt at register %#x bit %d (%#x -> %#x)\n",
 		active ? "enabling" : "disabling", reg, interrupt_bit, old, new);
 
-	if (new == old)
-		dev_WARN(ring->nhi->dev, "interrupt for %s %d is already %s\n",
-			 RING_TYPE(ring), ring->hop,
-			 str_enabled_disabled(active));
+	if (new == old) {
+		/*
+		 * Rings that are polled mask the interrupt using while
+		 * the completions are being advanced (see
+		 * __ring_interrupt()) so for those it can already be
+		 * disabled by the time the ring is stopped.
+		 */
+		if (active || !ring->start_poll)
+			dev_WARN(ring->nhi->dev,
+				 "interrupt for %s %d is already %s\n",
+				 RING_TYPE(ring), ring->hop,
+				 str_enabled_disabled(active));
+	}
 
 	if (active)
 		iowrite32(new, ring->nhi->iobase + reg);
-- 
2.50.1

