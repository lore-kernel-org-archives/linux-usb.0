Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5E50C2BD
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568163; cv=none; b=ohLAAEayp3gODwrmLYp+K9RcolF4JN5ldn/eCqL7Ah414plVOQ/WzAOv+pnDsr47gm540t0qIeN0CMEvvK29RFnGVKvwOORY+7rVxW3oddVnzDuFJDEcOaT1+nlK6rJ9oX5UBOK2Oh1FqsWo+cvbzqbE9U05z/yXPSXZ85DbiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568163; c=relaxed/simple;
	bh=G3zaE1eEUlkRWArBl0warJPq2LKaHtjYFYuX0XongBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6KbqD+5DeT76DlqtgpKS2q7J7fqRIq8Ip7mg0aHjUaK5bHYum315/Jte8TC0CJQGg5Eyx2nGTDFWITqYLitwWmhWhWr8YS3LIw4nAXu1CzRnidsS57Q3/gu74qhajJ7WMKPcSkHlExhAipmxAPNcJzcPG3fNWZ5ciqmt+hga74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwusN3E7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwusN3E7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568162; x=1821104162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3zaE1eEUlkRWArBl0warJPq2LKaHtjYFYuX0XongBI=;
  b=WwusN3E7ktA/o5zB6YzNjMcusEBQbYYueaZVj8sjnexqlymTYBF1eLCR
   3F/LMpbTcHamGjQOzGSoQNZ7nkaE2ILKWcjfrtlvH3KIVgFyDwvVSAiZ6
   4HsXoj5t2Ig2jR0JywEaf1E//QnQzOBmKYGip854Uc0CIoxz8/avj9Oc2
   Kq0ha9l6MGlvnK/g+qBOwqSrGldH96878NSCigoEtMoYyFzdMCnwU1Yc4
   H4H0aD00mh0mirVMcE8v/XzQuetLPJAy4y0YbaMROtuFwncg9MsnpmClQ
   qNOijpmyMKtNzYxLTwB6fJvjUmtH8HWufev5b75jPWL9gUru02HRtnDLU
   Q==;
X-CSE-ConnectionGUID: KvUnYEfhQP2uXRpKNi2JxA==
X-CSE-MsgGUID: Lyq2QBGURrOgmoR3f8Dnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967290"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967290"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:02 -0700
X-CSE-ConnectionGUID: cqy91TITRtuR2rjnuyNCFQ==
X-CSE-MsgGUID: 7fNmOMXwRiuiw3DNQKy86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720155"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id C89B79D; Wed, 16 Sep 2026 16:16:00 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 10/20] usb: xhci: document USB3 PORTHLPMC register layout
Date: Wed, 16 Sep 2026 16:13:59 +0200
Message-ID: <20260916141409.629621-11-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
References: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments describing the USB3 Port Hardware LPM Control
(PORTHLPMC) register fields as defined by the xHCI specification.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index f2194c84f9f2..070cf44f12ea 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -168,6 +168,10 @@
 #define PORT_TDR_MASK		GENMASK(7, 4)
 /* bits 31:8 - RsvdP */
 
+/* USB3 Port Hardware LPM Control Register (PORTHLPMC) 5.4.11.1 */
+/* bits 15:0 - Link Soft Error Count, if LSECC=1 else RsvdP */
+/* bits 31:16 - RsvdP */
+
 /* USB2 Protocol PORTHLPMC */
 #define PORT_HIRDM(p)((p) & 3)
 #define PORT_L1_TIMEOUT(p)(((p) & 0xff) << 2)
-- 
2.50.1

