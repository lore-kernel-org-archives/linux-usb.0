Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3444DEC0E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559003; cv=none; b=BAz+z4w1qz7EIKk3xKyeLp+V6c+1eifJ+EOPWPLQzWZv2yCSuDtNO/Y2/Ycu0GJameLHJlpa6X8urY17a2hS6+FhM2nKAMhv2Vu9CmQk/moL5zfpTdySr1jHCczMGSJ4wSodod5IdeOyjEayzQ5tnDbzc/0Wqk/RN5Xvtb7OwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559003; c=relaxed/simple;
	bh=m09aL//Y3gYDcQGnFg2Fn4Wl9JMgoCVrS/itjeSyeY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTzV2oAaoKohkwFSt0zueVS3dGQCFGKf61rgi2Q4VJPn7S9EtjGTZOnfkKptJQBSx2cIkTlnf9rl+KhXy8btNDpXSBNszROFLjFyI1BbVV7+eo0t13M/5GuUaLdZZcZX7NwU+iUAf+ho4Y6pcX6+GkelMUSAMkGdLx3gK3QJbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ5d+mkc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ5d+mkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559001; x=1823095001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m09aL//Y3gYDcQGnFg2Fn4Wl9JMgoCVrS/itjeSyeY8=;
  b=MQ5d+mkcRpKcwAu2M+jNrrWEeLn+UwqHXZ79J9ZqsivMQEls6SlSyKIc
   nfxLeTjNDOFMgDirUIfFAcqSvX6vUpF/sd0H0E16GB6QGO4lOEDdr4Yd9
   9xNOkUnZBb1FXWgvSM194V3Z34WBXp1BizkeBzukwjq+e3v5kTENxD2i9
   5+s1LnUjd0+vhr9qkZQYlVWXL27+WAUTEXbgtvZf4aCJpxbO2uGNiyd+5
   cKfAXQ53sXdTnLdZSv78dpiTy0iVdz1q+Itb9VqoFcq3fN5A/QLUvlIiL
   DtfiRL9ymE5WhBOB+DjMJcpJRz0kfpBabI2D5DXkI8ChO4GdJOgcSpXAh
   w==;
X-CSE-ConnectionGUID: /voMEzjuTqSBAn3fl8W3dA==
X-CSE-MsgGUID: 3wf8Ke6uR36cEyWVykDaCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351678"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:41 -0700
X-CSE-ConnectionGUID: 5lR1OV1hTr2pRf3LnT+olg==
X-CSE-MsgGUID: nCigMMBCTW6WyuiZmn9h8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650043"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:40 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Sang-Hoon Choi <csh0052@gmail.com>,
	Changyul Lee <lcy8047@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 05/11] xhci: dbc: lock the minor IDR on registration failure
Date: Fri,  9 Oct 2026 18:16:18 +0300
Message-ID: <20261009151624.618967-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sang-Hoon Choi <csh0052@gmail.com>

dbc_tty_minors is protected by dbc_tty_minors_lock when entries are
allocated and during normal device removal. The registration error path
removes an entry without taking that lock. Different DbC instances have
separate event work items, so this removal can race with an IDR update
for another instance.

Take the same mutex around the error-path removal.

Fixes: e1ec140f273e ("xhci: dbgtty: use IDR to support several dbc instances.")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgtty.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3d51e8d82659..2249cc16800c 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 err_free_fifo:
 	kfifo_free(&port->port.xmit_fifo);
 err_exit_port:
+	mutex_lock(&dbc_tty_minors_lock);
 	idr_remove(&dbc_tty_minors, port->minor);
+	mutex_unlock(&dbc_tty_minors_lock);
 err_idr:
 	xhci_dbc_tty_exit_port(port);
 
-- 
2.43.0

