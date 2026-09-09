Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5A33DEC8
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925856; cv=none; b=djuVW+xy8P99H6PJHFSo3za8JQHPbPZbpcZ6V/LU8fZn1Hmq9Ha4aRcvrp9rKmamLrnhf1uDj5U06FTztjmPC8T+oZDW8ci3i2q0iknXYImBuQIdbCZSFt8ELneIMBkPtmZJQmvYVijPsjtIVoQBAhJpeNq1GrhCf6DkTvO/6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925856; c=relaxed/simple;
	bh=mA8QNiSNebhrBAwHld9iJw4fU7b6Oh96NKpPEH5RexM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj4DgXFFMDZARnkghL3yhPJcCg6lKCOYlA1xYa2VM31lZfi+Va6anY5odPHBt6kYEyWgDfk4NJTQtmMVnjMZGl1JaJulyVQKg+wa1TLifRyUoGSgpYN/KdBoXKRrImzoXWhALuf9en3xogOLIC/uqVTfBRG8tsb1mjP9uQGocz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cimDUMGA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cimDUMGA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d8f265cbe6so44118235ad.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925854; x=1789530654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kh0j6/HPW2y7XP5klwDPCpcxQirsHloNdqDgw57jpBc=;
        b=cimDUMGA5QzKb6FDbW6HTXvNvRbDU0ztUXrA9A5HoF5UllgMumpoIwZNObvdGQidj/
         FPSCdaIovnest+RCqzDK2UG+f/eCYeM7upXef984oIA0TRI3rs8Iy3MvEQ+cEDjvKdqc
         NnmM6YP68g4SUvEuEPmToY12ZslySY27W+6Sichs4r0tmVbaUJX0TOJpgVtDtlpH8bvR
         l+Gf/N2nqIWE34E1Ct2qrmN4NQ3NUnGqWKkaevino5ob6kFl69Fqbff7QDEbHuilFiak
         NYXqTeHCAJJyXwA1KR3CbQIoG7tZzEmSNa11gg8EKHCGf0NMXVIkqWbV3Xa5skBP4lgw
         PAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925854; x=1789530654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kh0j6/HPW2y7XP5klwDPCpcxQirsHloNdqDgw57jpBc=;
        b=HF0sUFgrZ2PV554XiTx0J/PydQ59GhXqmJO9850cat69kMqv7++Bt+p3nbR/TPwHgL
         pnIiL9uZm6kW25Oa0kW1sta+ssM/jMwkWC4C/MoSiKR0AgJa5w6aFHA0fIYkH+NLr8g7
         8UuCu46W8kEYxdXp87wi7Es1qMQ7W5/bpt1/aCpARwueZvnL302I5U94z0NbYSoAO7Bp
         DFYC3wt7nan71BAfzX8yHE07pxRLkN3k4uT8VTUF/6pCV6WEr2wJyyqXACyjUOkjmIaE
         Bxe0MFLo8eKJosDi6s+z47173n6UKUNEnFLLNx6wuyNpdLssygcs6Yqim1mQPy2Ei34Z
         C+Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwsEY7xswQGqGHHo2LBtuD1bTw1ELEMyFjoM1DmzgKDCCBOZVqtC4RuFjc3C5CPURJ3YQ050sGaO6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kCesL42D4qIvWE7nIJV64byuykbtxH4lnGP0ePbJk7toLOdLmn
	DrTWeC/HtrqUdI/TTwU7gWfNq0/s+fE4tr4AHQhmwvU0KdXlp+b+wZOH
X-Gm-Gg: AYBFou0N9XCgcnljLKHI2BJvQqOlLK0058g0HZNzWQ5ArDRLeHm+fsZo5C/0G+yY2Ch
	AuARGOeFDJswLItFBki1OEGW7zfkj3PSRONI+jgSNgIu0vjJQXMp4kEgLsl+D5vmVIhFOlm1ujC
	ssoefndY7I82qOXMohOPxACeARV7kuLU8ygilxlpZPnKAq1rwjQ2YVvboca2x+q1CC+EFA1Ylxe
	vYzgyxI9HFnOlBK8GxIbOz8Simbe7z3AIaYjkyMqFFtq7j6w6uYQ+rizxyCF5ckGMM6VDeT6FLI
	aOKcm81poLwxCrOpwHChjqY51dOLKBJxjtGUNshvyumx7wU3NgEdaTDSpSkYdncQxIlKW2l5X/v
	4BsryQ0MqOcu8jVJpoOAdiRaVWFsg3yiezkRoFdXsd5kuQax/z0h0B0isgsuvxxidhhj/RmWe0d
	+fLckfoWR5i2xIU5Hkfd/g4pEtRp1Ouu3f0rAGSD8UOa6ya+R1SW0JF6mdemdvo7hFPPQP/3DjB
	drcjWc6+1Q=
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id d9443c01a7336-2db1258c686mr453229855ad.8.1788925853728;
        Tue, 08 Sep 2026 20:50:53 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm65891705ad.79.2026.09.08.20.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:50:52 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] thunderbolt: Validate output ports while discovering paths
Date: Wed,  9 Sep 2026 12:50:40 +0900
Message-ID: <20260909035040.2929285-3-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909035040.2929285-1-4ncienth@gmail.com>
References: <20260909035040.2929285-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Path discovery reads the six-bit output port number from router HOPS
configuration space and uses it to index sw->ports at three sites. A
router can return a number larger than max_port_number and make the
connection manager read an out-of-bounds tb_port, retain the invalid
pointer in a path, or pass its embedded HopID allocator to IDA.

Resolve each output port through a bounded helper. In the construction
pass, validate the output port before allocating the input HopID so a
rejected entry needs no additional unwind.

Fixes: 0414bec5f39a ("thunderbolt: Discover preboot PCIe paths the boot firmware established")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 drivers/thunderbolt/path.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index b2c322e76b8ad..ea72153690dd3 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -31,6 +31,17 @@ static void tb_dump_hop(const struct tb_path_hop *hop, const struct tb_regs_hop
 		    regs->unknown1, regs->unknown2, regs->unknown3);
 }
 
+static struct tb_port *tb_path_hop_out_port(struct tb_switch *sw,
+					    const struct tb_regs_hop *hop)
+{
+	if (hop->out_port > sw->config.max_port_number) {
+		tb_sw_warn(sw, "hop refers to non-existent port %u\n",
+			   hop->out_port);
+		return NULL;
+	}
+	return &sw->ports[hop->out_port];
+}
+
 static struct tb_port *tb_path_find_dst_port(struct tb_port *src, int src_hopid,
 					     int dst_hopid)
 {
@@ -54,7 +65,9 @@ static struct tb_port *tb_path_find_dst_port(struct tb_port *src, int src_hopid,
 		if (!hop.enable)
 			return NULL;
 
-		out_port = &sw->ports[hop.out_port];
+		out_port = tb_path_hop_out_port(sw, &hop);
+		if (!out_port)
+			return NULL;
 		hopid = hop.next_hop;
 		port = out_port->remote;
 	}
@@ -141,7 +154,9 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 		if (!hop.enable)
 			break;
 
-		out_port = &sw->ports[hop.out_port];
+		out_port = tb_path_hop_out_port(sw, &hop);
+		if (!out_port)
+			return NULL;
 		if (last)
 			*last = out_port;
 
@@ -178,12 +193,14 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 			goto err;
 		}
 
-		if (alloc_hopid && tb_port_alloc_in_hopid(p, h, h) < 0)
+		out_port = tb_path_hop_out_port(sw, &hop);
+		if (!out_port)
 			goto err;
-
-		out_port = &sw->ports[hop.out_port];
 		next_hop = hop.next_hop;
 
+		if (alloc_hopid && tb_port_alloc_in_hopid(p, h, h) < 0)
+			goto err;
+
 		if (alloc_hopid &&
 		    tb_port_alloc_out_hopid(out_port, next_hop, next_hop) < 0) {
 			tb_port_release_in_hopid(p, h);
-- 
2.55.0

