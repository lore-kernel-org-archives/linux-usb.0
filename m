Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108758;
	b=PLwwNvhbKjZ+bNtG6rll+Arhy/LMtu+L5mhd4hhR5Brw7IasOhJI4CzX6o3bhl+aQTEv
	 EqfP7H3N7crHjBlFhWPmyMUXpBC/FO3Tne+WFmnWywE8W2741hnJUUOlolOLxBWiBKpg1
	 Y27nZiUlJFszWpZaRVlNtzLti0PT3UupFwv/c43ml17tfunC6BSyZmvHBYtCsuyeZ9zP0
	 eC/JFcx9uQgUH5IvFetX+pe1a3+g+1ODJQEOlx4+/+cKqdqB6muJSTTberI4pEN2cn1e9
	 8A11V3sotmN12J7lDs7zXIx7eNsTs3DnGsNLkFsEA3j1yszAgJlxxPJNKWTk5H3b2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+JuiS29AHYV7ec78JglCG3eGOPICeAmon+spTh5c9g0=;
	b=Ff/ga7aoV+k83aD+L+hufKL3ep1mKP0/8HqaNfCcn2pu5PLQE9fsYOQ6tkAMdmJzYIVJ
	 TjCXuVg+q1ZPM3a+/JVs0cmTNFzyHD5Mef6LX/0CtceJk7IUYBaAarpAzrU78VRbIAboB
	 kS5ndqJZ47E0ZFL5HqAaostjQOUmZBa5Sv7kWRO1C7MsuDdexXVenXxhzxU0qY0fFB2lG
	 kqMXAtYCvgUvuv2e2WS8yEEc6hsCcIWi1UtiZPz8fEPjM5NzUcBLIzor6ZFxsGubRDEkh
	 DBUlcOFqibX10+Yd/TcF6xU58SyxV2rtXEgpW5QFLZyPL8HFt36ygIzuv7Bt31gKIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcxDgi3Q;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4E606A338
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC4E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcxDgi3Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108757; x=1826644757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ZzxvhVhHu7BPW0wlH7rlC7V+Dvqj7xGOrq4zRpyA2s=;
  b=UcxDgi3QlVxzI2N+ULRbaPhKqHCLYohjywaU7R2/NPvIoqYeeJpv8utx
   u+BRUyZBv0bBnGZ/8pGy4iXdQdL5h82u1fjTCf4mlSzkWoaFaYz3x/sU7
   WD/nhaofguHNKO+7Djx0e1/wCzBlJ5NWuVhIRq1LRIWWqFvakzA5SNbbb
   ywc5+JQ34ULkxbH1SW3uL6lizh7mFlzbGjjMQRlUSCCDpEm15oMeK4f2c
   n452tgZOJtNNYdtIFdxfoO6flSz6yyYANnSBCIT4FjTpLeTnxl2qgrVVP
   f3pxgJsP3OgwK9R+CmeQw/lipv8/M1Tv2nVmoDEvHidzXOgYtLRYhC1N3
   Q==;
X-CSE-ConnectionGUID: KJC7urpMQ+OtuovYSiY8Cg==
X-CSE-MsgGUID: r2Zzlm1ASoiK9EstnGq/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958991"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:38 -0800
X-CSE-ConnectionGUID: deFGGf3HRuSEBQBZMnclRQ==
X-CSE-MsgGUID: X7/3BZjTRZqnN7RnXAeDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381732"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 172A5A7; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/18] thunderbolt: Add tb_port_state_is_up()
Date: Thu, 19 Nov 2026 18:12:23 +0100
Message-ID: <20261119171232.1616316-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
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

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

Move the check whether the link of a lane adapter is up from
tb_wait_for_port() into a helper function. We are going to use it in
subsequent patches. No functional changes.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/switch.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c748158a7044..26a4363f94f8 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -481,6 +481,20 @@ int tb_port_state(struct tb_port *port)
 	return phy.state;
 }
 
+static bool tb_port_state_is_up(enum tb_port_state state)
+{
+	switch (state) {
+	case TB_PORT_UP:
+	case TB_PORT_TX_CL0S:
+	case TB_PORT_RX_CL0S:
+	case TB_PORT_CL1:
+	case TB_PORT_CL2:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * tb_wait_for_port() - wait for a port to become ready
  * @port: Port to wait
@@ -529,15 +543,12 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 			tb_port_dbg(port, "is unplugged (state: 7)\n");
 			return 0;
 
-		case TB_PORT_UP:
-		case TB_PORT_TX_CL0S:
-		case TB_PORT_RX_CL0S:
-		case TB_PORT_CL1:
-		case TB_PORT_CL2:
-			tb_port_dbg(port, "is connected, link is up (state: %d)\n", state);
-			return 1;
-
 		default:
+			if (tb_port_state_is_up(state)) {
+				tb_port_dbg(port, "is connected, link is up (state: %d)\n",
+					    state);
+				return 1;
+			}
 			if (state < 0)
 				return state;
 
-- 
2.50.1

