Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438814A3D45
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539943; cv=none; b=cJz8XiXCT4cx539KkvV5zYKGdbb7QWOihOyy4P3YSmHh2VF7hNpy4xWumq0S7R5G/dep2+IBR/lkS8fjByry4IRNtb/DqZviuObwrXM9QKzEz/k7g3VuE2341siSbGBUnNwfFKaPoPtwZgQ73GDjLiFzE71bUPfENRxwMCiH73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539943; c=relaxed/simple;
	bh=ktJt6HMQNZDy2H6CGy4aEu6p5QlCH+AkYOpRJYgDOwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2KEAJ3beVD/u01bhlChWD0krFF7KdR39uooom0guU0oKvf4wHxjuiI7oL7kUJvSkYI0IlEv+FyUTw4vCx6oLcuwRrfQBZijMrw3fhwQWgtEZT2vIo0luUdBXLkg3s9BLg20Sgt9MQCqTb4RnFhrOiRUMOvw5ET9hd7INFmv4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5A5Ei7J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5A5Ei7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539942; x=1823075942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktJt6HMQNZDy2H6CGy4aEu6p5QlCH+AkYOpRJYgDOwY=;
  b=k5A5Ei7JrUZrwKePFyXTP1wIOtsoeRSyF/bKOuP5rEMiDs7tvh/WTyYL
   upux3BoVE2eLEPfayY1ih4U75TUWjBljJBohABb+BJSfbVcG36njq7Gvd
   XXzHPQM75SzGf62JrdsL7LjQYhEOeZkACwY1YI6DLfcEONkUsnphNjT9M
   JKqfzxLGMtgTI1ZKhLoe4+sFdJaWoXrtzTXoNBmvk9bEruu5wnNz5+qkZ
   TReddLZs8q+jmJjD70Kvaap/cHX1NLwcDJNR0to0VCUpTsxt0r5QezHll
   3UmkGfmzBGAhSVu6FrX95lqDYmlekIc1wsDTP9hfey0FugO2yT6WA2NLI
   Q==;
X-CSE-ConnectionGUID: mFGC8KfgSKWHp9K+ArV4iw==
X-CSE-MsgGUID: 5Ymgas5eR4CcId31ksi0Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224113"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:02 -0700
X-CSE-ConnectionGUID: j5mWSxVKQPe2g/S2FQQPNw==
X-CSE-MsgGUID: f6KBioYJQmm08PMW2INAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613382"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:00 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Sang-Hoon Choi <csh0052@gmail.com>,
	Changyul Lee <lcy8047@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration failure
Date: Fri,  9 Oct 2026 12:58:26 +0300
Message-ID: <20261009095834.561578-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
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

