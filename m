Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617840DFDE;
	Tue, 30 Jun 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824088; cv=none; b=uqFVsxXfxNJErTGsaU7Ty3dYfSsneAlW9njWebqkUtRe8WksLaHSJGq1XvQBScohSTzy3WCs39IdSYzbhMzHwrfEISNp3mDYInUO4PaPM3zuZGjjZ7BLIk3FQmSi2VrkHYMKoDgGnrgQfJDBZh0smdouJeme7cOV2GHajUqfOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824088; c=relaxed/simple;
	bh=nRv7PUpgR4CF8dKJnr0T4PZ5kRtI57Xfx3UDH9ztS88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mjmjRbodmPZAdIJHLoBJHx9d1lzdaR+ewvTi9lSx6+BZwFize7atpZNTSGyH6uN1M3mj3xrlThC45YVFlQTw40EbSLPxrlBo3SrOEgR5L8V7FjtdP1j3HRJS1Yofsym1gIVFiVMumi90gxTNsW1RVB6cpn16gmIB0k/68Q8DwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQjEiJE+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQjEiJE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782824086; x=1814360086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nRv7PUpgR4CF8dKJnr0T4PZ5kRtI57Xfx3UDH9ztS88=;
  b=QQjEiJE+mu9N1sy7FEYFWbTwGVXC+exdDSJlD078k9ELAtMQlmYBaoCu
   I0q1SRNR4hu9wSSwvRXBhCG6nkCdXanmDiX27tATbS5GmJUDjvNMfQO3T
   LqyxdaFAB3sadG6gCPEYtYcQ+vR4s41mCsy0sjVtP+CloMh7flc5/cEnl
   Y4+MYstmMdM6Rh+X5Uu0L6NEWgvmGoXN+mHzY6gR2f2zDhk6QVNIgNJ3X
   tFSMPY8rl4ohuU+8/fj312VtaVqhftx786oG3ENuWAMld3KyBEABeVINi
   2UY2CHEfpFrkIHpm8STQ0Qm7bbLZtqc8w6Ng4asreBzl+ZyvdOqOWb75A
   A==;
X-CSE-ConnectionGUID: KXg8lja0Q6+/BxGHrM3ndw==
X-CSE-MsgGUID: nn2E0LjzQUmiprgK+NVivg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83562661"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83562661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:54:46 -0700
X-CSE-ConnectionGUID: B2+bMuz+SomScgbp9+UkrQ==
X-CSE-MsgGUID: 4/H58KRRQfiU3l5FOLMS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="275483782"
Received: from madhum (HELO madhum..) ([10.223.131.52])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2026 05:54:43 -0700
From: madhu.m@intel.com
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v1] usb: typec: ucsi: Fix debugfs response truncation beyond 16 bytes
Date: Tue, 30 Jun 2026 18:54:35 +0530
Message-Id: <20260630132435.458563-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

The current ucsi_data structure inside ucsi_debugfs_entry caps the
response payload layout to exactly 16 bytes via low and high 64-bit
fields. However, standard UCSI specifications define core data
structures that require messages larger than this 16-byte boundary.

Without this expansion, vital telemetry metrics cannot be captured. For
example, the GET_CONNECTOR_STATUS -> Voltage Reading fields, and the
GET_LPM_PPM_INFO -> HW Version fields reside starting at or beyond byte
offset 16. Under the current implementation, reading the debugfs
'response' attribute truncates this extra data, rendering these
extended operational metrics unreadable.

Fix this by expanding the ucsi_data structure with an 'ext' field to
provide structural capacity for payloads extending beyond 16 bytes.
Update ucsi_resp_show() to print the extended field block directly
prepended to the high/low data stream to ensure readability while
maintaining structural continuity.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 4 ++--
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index ff33a5e7c6b0..989154ac8f23 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -82,8 +82,8 @@ static int ucsi_resp_show(struct seq_file *s, void *not_used)
 	if (ucsi->debugfs->status)
 		return ucsi->debugfs->status;
 
-	seq_printf(s, "0x%016llx%016llx\n", ucsi->debugfs->response.high,
-		   ucsi->debugfs->response.low);
+	seq_printf(s, "0x%016llx%016llx%016llx\n", ucsi->debugfs->response.ext,
+		   ucsi->debugfs->response.high, ucsi->debugfs->response.low);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_resp);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 325ed1e5ca80..97bb8892e489 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -466,6 +466,7 @@ struct ucsi_debugfs_entry {
 	struct ucsi_data {
 		u64 low;
 		u64 high;
+		u64 ext;
 	} response;
 	int status;
 	u8 message_out[MESSAGE_OUT_MAX_LEN];
-- 
2.34.1

