Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC871302176
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464956; cv=none; b=tkTjYhDlnwdfMJHW3ljrJMiquV+sE9T/KeoErvp+93KFhTKW+uUEbnWXN/PMDvVC058iNeozBePvZnXUMovDpw0Z2kKcZg296uJkWsIFzc2b0oM0Fmcnu3ZMZtN9u48436L3WA9XR8Z4FNnF3cv9nw5UaSxjZfrtzrnwAHA4Tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464956; c=relaxed/simple;
	bh=HNUwaWNBQPGXrkRKq3txV0VielZhrGn2pQPdwjatJiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRUFPCshTVHqwbvQztz5jjc+0oX0AfmGpShXL2UbrXi+/1kXjoUauvFlDPniAIG8ioDHCLVSxx5A1/RAO2efSUD5B1EwjucVFg9RnktqapzfJrRcaDocnaHzfH47i3dE1ArvyRSuiCVSnAnlplEWnBgB6cZgX95leVuDL2LbEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INASfVRU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INASfVRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464954; x=1801000954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNUwaWNBQPGXrkRKq3txV0VielZhrGn2pQPdwjatJiw=;
  b=INASfVRUzrqCQim2ae/l9RMsbBryid1taeLQLzyj8z8AUMT5HwhNPsTs
   6nUqusgdZGr0lv/SFS+AuUltrke52JkACcabmpHCXScqx18w2cz0+7MD+
   RZS/prU2vz168wimySBb0a3JcckacdxFZFcJMx7zigv67sBsiGs6x6xli
   XUsPTZoD2x8WImV4PgyIDNrRqA12cDKaY9Xj4A2/k03kxBH+OmVycrpr1
   Jj9sxQ6x5t/QsX544akymvyFWpdFfAyu6HlbjOMf8i5GJLwQpYmXbMbHe
   6HuAMBip1q8usolLl+U2ZPGrCzQENKgm4VC1KRTEPa0r9X5jlKp8ae17N
   w==;
X-CSE-ConnectionGUID: XF6qolv1SKWDq1NvBBOJaQ==
X-CSE-MsgGUID: /tNNRv/eRbOyhB+TNRQb3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019775"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:33 -0800
X-CSE-ConnectionGUID: 0gZxCt8cSda/D7r9McncgA==
X-CSE-MsgGUID: ruuztGiOTESFlLgArxtpuA==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:31 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: Increase timeout to wait for Configuration Ready bit
Date: Tue, 27 Jan 2026 00:06:05 +0200
Message-ID: <20260126220606.3476657-5-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126220606.3476657-1-gil.fine@linux.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After setting the Configuration Valid bit (ROUTER_CS_5.CV), the USB4
Connection Manager guide recommends waiting for the router to set the
Configuration Ready bit (ROUTER_CS_6.CR), with a timeout of 500 ms.

Increase the timeout to comply with the specification.

While there, fix the kernel-doc typo.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 706c9bc796e2..c1d1c98d4ab1 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -304,7 +304,7 @@ int usb4_switch_setup(struct tb_switch *sw)
  * Sets configuration valid bit for the router. Must be called before
  * any tunnels can be set through the router and after
  * usb4_switch_setup() has been called. Can be called to host and device
- * routers (does nothing for the latter).
+ * routers (does nothing for the former).
  *
  * Return: %0 on success, negative errno otherwise.
  */
@@ -327,7 +327,7 @@ int usb4_switch_configuration_valid(struct tb_switch *sw)
 		return ret;
 
 	return tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_CR,
-				      ROUTER_CS_6_CR, 50);
+				      ROUTER_CS_6_CR, 500);
 }
 
 /**
-- 
2.43.0

