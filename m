Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108758;
	b=H9GYgbbFdjLVAPhmP/RBVpbnVgZ2Zy1XlrP5U0yvB5l2mDNQtPJmAzsspqLrvi4zlajV
	 Cv+UOZZIkj/kd38zBqWb3GTAa4E0zCWePoc/6YgZclPb8y3xH0knIkxsNOC4UAtRN9Tfv
	 D5W9QPGJfMsYjZ9GmWzId0O9PbDlvmQf/vaEn6+gMQb6pO0L2ka4zsykCYZMunM5P2z4B
	 U28uBKjGhc3m7EdviyqpZ80ChIzyjP0IjvRMUV7al7W/5xQS0B/XSWj7J4eQ5EuIWM/wm
	 qrh0In1VwxHmzIZ57ks4RJUx2DWrPlhoTN+Pd7KcXF0aXZarsO6jG0Aon7uhlRi57lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MeN4wzqEVIupuS1ohc+qda3wrIfT9vtNEY49oI/tgBw=;
	b=Ce4bpPXAvu7DSARONRlnuYAgMzeH4nsIvEEUQBbvp0dk1l+zKrYF51ufWy/6rzlDhaRQ
	 MgZ261CzavWvH9fgifOJV08RnQEe/Ji1x4QfhkqLmma4U+Q+27xUC4nNngrj6IZUJohHB
	 PDLxvRUq/cUQJMgktuS6JndtkNSYflmrbzNSHxWUarB8VpZ904ISZJe/FGRysKuyWd9oM
	 snnbiyASi6l7pcPvqAflZW3ajh9YxiKNbxEpwu1G9pAq1tJXY9nvkLOQbN7QSinPHCJLJ
	 m8Q7fFyS8NakHuDUm5wlwW57MyA6EXVw2GOhCBLs84hhtCljqbxsP46MpGG4mTudXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="E/UUj0IP";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B93606A33B
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B93606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/UUj0IP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108758; x=1826644758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTi2PAr/RyWHvCTvsuJZKveokjbCpCalLTOD+wT0vWk=;
  b=E/UUj0IPfgS9czG1cx2XJ/BXyMJkeyxcOlByANoyeQe7Nw2UX99t5VQD
   XEu1qKS0z0N1W6zIo+1dt3QOL4LScJC+74IHRz88n7gDRTj3+4NydCa43
   f5g5r5BhOz8wjtJfcGV0YGMsQXFsToSM6NMDUe/k+JzlomBJyOAQEmocl
   XmrYrd20X9jVu6n8u2qOzAyAcGgXQ0DOffYhO5SsJbpiNPBIivbzM7NM5
   R6XICuXczSWxyRibNq7tqTk0aEa+XNvyWijtDeUJx5bUrl0mejRM/vPwM
   97WEdQHFRiwzPVKNMBQsXVjD5oVvnW7gQnBYX2DV0SJqKLBWUDsmplbW/
   g==;
X-CSE-ConnectionGUID: jGQSZR9WRUOQZ3UUY2nZdQ==
X-CSE-MsgGUID: AiLDvMY5QWGfyVDKBTn6Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958995"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:39 -0800
X-CSE-ConnectionGUID: 4vDrtvy7QeSQBnSbS5r8QQ==
X-CSE-MsgGUID: XuJuWSYHS7ulOZehlSHPVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381733"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0DF1BA4; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/18] thunderbolt: Return -ESHUTDOWN when control channel is not running
Date: Thu, 19 Nov 2026 18:12:20 +0100
Message-ID: <20261119171232.1616316-7-mika.westerberg@linux.intel.com>
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

Use -ESHUTDOWN like the ring layer does when the control channel is not
running, and drop the WARN(). On buses like Thunderbolt/USB4 user can
unplug a device any time so it is expected that control channel reads
and writes fail and the callers are supposed to handle that.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/ctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..c8b07dd01bdf 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -140,7 +140,7 @@ static int tb_cfg_request_enqueue(struct tb_ctl *ctl,
 	guard(mutex)(&ctl->request_queue_lock);
 	if (!ctl->running) {
 		tb_cfg_request_put(req);
-		return -ENOTCONN;
+		return -ESHUTDOWN;
 	}
 	req->ctl = ctl;
 	list_add_tail(&req->list, &ctl->request_queue);
@@ -1127,7 +1127,6 @@ int tb_cfg_read(struct tb_ctl *ctl, void *buffer, u64 route, u32 port,
 		break;
 
 	default:
-		WARN(1, "tb_cfg_read: %d\n", res.err);
 		break;
 	}
 	return res.err;
@@ -1153,7 +1152,6 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 		break;
 
 	default:
-		WARN(1, "tb_cfg_write: %d\n", res.err);
 		break;
 	}
 	return res.err;
-- 
2.50.1

