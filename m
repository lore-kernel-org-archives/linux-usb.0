Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD210396B70;
	Fri, 19 Jun 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879621; cv=none; b=he1edo4ELEM2booQUa39BIRHmDASuriMFHJfvBFQRIeRjg5ULlD3s6Ht808D+w951vNbkjjl1zJ6yK2SfO6rdVHbbmp2p2AMqjZN2cgJpeGyynGMKCrmFISQDMUlzde4RkDSnTytljxJsZg48pmPBAtTCpttkaBjcT8/7V6rB6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879621; c=relaxed/simple;
	bh=0DyBzwwmAkmFZoVVCYHsFu0T+eLfFb6QVIQAh9D23L8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=itbtQnQDN0JkHWkaEOdPkIVt6wcFNc2d0CoU+u3VGsiyoaA6Jsj6wHqy7fkfSa72CIXK/DvnKVDNw05BrB6svY7NpoNLtwzJdeKvYMC+2L5F37wK+cXeGOGMTAp3x6Q0kqMUBFXThbKPzg5K27YDen8iLTnVKum+GUAx5CvkfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu8obw8e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu8obw8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781879620; x=1813415620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0DyBzwwmAkmFZoVVCYHsFu0T+eLfFb6QVIQAh9D23L8=;
  b=hu8obw8eTcLH9dqnnHPOmMx3h0WO9+ozgrFFfdXH54Zfog8vxnxARrdv
   /aG3LYHQhA2TwMfYtsIbsYbUJBVStdWyG2YxUqNywSOk85eYXH+DYBbKd
   yKlVEAmGRQRbin/ZAcEsMquzXH/ytHFPJ5okZaoIVV5RLqXpQQK16Q9nh
   oVhvX8RVR6QZmw86yWJsAV+PclVGRcIzdRN+eUBgiwG5NeybLUlGqBX09
   uroLLu+kijshbmEoHYdft8RpOZJfPkkp0x8sENNPOTUbVCYDIvXZaNzi1
   pRKu/iQCUMcx29M9/8mHvu59K1oF70HLBb6FP5d+n0FqHiSSmFkPQINKq
   A==;
X-CSE-ConnectionGUID: XtIqZpTTSYSLNYjU6W8uCw==
X-CSE-MsgGUID: xaAvbT9jSH2t9q0uavWi1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82728707"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="82728707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 07:33:39 -0700
X-CSE-ConnectionGUID: 3Z4HnI86Re2Q4jXOfXgQiw==
X-CSE-MsgGUID: IfTl7tCCR56hjzCgznnI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="244488520"
Received: from madhum (HELO madhum..) ([10.223.131.52])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2026 07:33:36 -0700
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com,
	akuchynski@chromium.org,
	jthies@google.com,
	johan@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v1] usb: typec: ucsi: Pass full DP config payload in SET_NEW_CAM for DP alt mode
Date: Fri, 19 Jun 2026 20:33:29 +0530
Message-Id: <20260619150329.3524162-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

In the UCSI Specification Revision 3.1 RC1, bits 32-63 of the SET_NEW_CAM
command hold the 32-bit Alternate Mode Specific (AMSpecific) field.

For DisplayPort Alternate Mode, this field must contain the full
32-bit DisplayPort configuration VDO payload that the OPM wants the
connector to operate in, rather than just the pin assignment value.
This AMSpecific value follows the DisplayPort Configurations defined
in the DisplayPort Alt Mode on USB Type-C Specification v2.1a,
Table 5-13: SOP DisplayPort Configurations.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Jameson Thies <jthies@google.com>
Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/displayport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 67a0991a7b76..2e3d7c734d9f 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -185,13 +185,12 @@ static int ucsi_displayport_status_update(struct ucsi_dp *dp)
 
 static int ucsi_displayport_configure(struct ucsi_dp *dp)
 {
-	u32 pins = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
 	u64 command;
 
 	if (!dp->override)
 		return 0;
 
-	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
+	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, dp->data.conf);
 
 	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
 }
-- 
2.34.1

