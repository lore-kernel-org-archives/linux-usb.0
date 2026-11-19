Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124939;
	b=KEVgJw9UoNBDM7OossysOscxlKAyYSA7riwVSQGLzNwk5wm3cF7LChF/h2Dh2mjWcEkT
	 m2aC7hDdaEwKiKoBK8vRoPOi5fA4RIrZcrHRRFI8KzSHesoYfGpqRb4dvzU9OKH/XoQmw
	 aIZ/v/5C1mKPOQlqfzfXQdURDAVGsSJuUazdKTtYFgFc2yu0nN2SA293+6x80UGkdC14L
	 6Vc4HnZ1hogEmax9Kio7lpLpWfyhyJcqzdGgV80HsWbJQyB43TtU0oc3ftJNOugWhsmUa
	 uHQbeR+odY0OQmvxMeIBIsNfdiZmkSsBakM+DelUKcPGY8P4ha2/Y8zUzy/zHhTdcng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124939;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dyUX0vlXAIn9zps1M4u52bTc0PcVvyDKnMOJR3ltE4o=;
	b=nDqezSgujhU6o6QmFmXeAokdbs4InsJUTF8UlPyipxGjEUZTZXMuBsCBCr19/Ei+1THy
	 KMO3MEN8iAI50NpYc7v5D6KgxnlwnaZAHaqlm6mZMsxUarpRUru7UQr8PFnGWuBNnjkNT
	 XuobA737rf2nMorq35EhyhfOYgvePw66HD1r478P3rLAKk9zGfUyV4s/639vMJk6lfHhW
	 VsI4QUJEUwyevW9ty0S73/IDq81URghza+c8KiGg8iaQAAEagbrBrNxzULNwShwDycheo
	 O33Mp+/6wTbBgJbwgjrGuarm3gI5pGWFzRqYAH+t1NVmk/XfXqzz3gGS9dfq+/aI8Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWT3BieV;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA360A2601
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 21:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AA360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWT3BieV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795124939; x=1826660939;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fdlxMSlfrG7deXqEZUiVNBWZQFjsrdFq4z0LNE0Wj9I=;
  b=KWT3BieV3uN9hA3SaIyVpTnjud6qBWbn7eVPu4eSg/Lx7Eu4ox1xWKlg
   mZgGgzCk/LpSIGLfaE5HeE3ijWp3CQmaluyHxX3saYtPH2Fuh3z+LLetQ
   GTbvHw3+D35Y7A0gjDp+GPpN+H9wjP3Ycyz7fUCaTULYzXceY4NUOrmvt
   qq/FVrfaNJNRlqaFQe7T1n2ta1bO6EdGnwiQAJvEfRYHj0e5Hrm/9f/OF
   vWKGVpXbRQ5MFEhENyPgeYd3tbntY/wkddDsqqhVC2/QLTU+9Vbyx6w99
   Cdaapb5s4sEcFpzaVOq6bLYlQdFHRIFxwN/K/JNxOMhc5Dl8DbucRPBhZ
   Q==;
X-CSE-ConnectionGUID: Vh4uRc70T7KwuxBFqfBrvQ==
X-CSE-MsgGUID: BiA99fuSTuaRs3lXmPLU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4001558"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4001558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:48:58 -0800
X-CSE-ConnectionGUID: o7u7DURHR+ClxIxpgSFf9w==
X-CSE-MsgGUID: /sjYfpRkSQOu4lkZXUorIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10889738"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.intel.com) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:48:57 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com,
	hulianqin@vivo.com,
	selvarasu.g@samsung.com
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [[RFT PATCH v2] 0/2] xhci: sideband: fix use-after-free of stale virt device pointer
Date: Thu, 19 Nov 2026 23:48:38 +0200
Message-ID: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi

Second attempt.
These two patches attempt to improve the disappearing vdev issue
while sideband stays active.

I don't have real harware to test this on so all review comments and
feedback from testing is welcome.

There are still some gaps in how xhci driver uses locks when
disabling slots and freeing vdev that is not part of this series

changes since v1:

- add missing sideband_to_vdev() check to xhci_sideband_create_interrupter()
- fix ENOMEM return case in sideband_stop_endpoint_sync()
- always clear sb->eps[ep_index] when removing an endpoint.
- other minor changes

Thanks
Mathias


Mathias Nyman (2):
  xhci: sideband: avoid use-after-free of stale virt device pointer
  xhci: sideband: check virt device under xhci lock when stopping
    endpoints

 drivers/usb/host/xhci-sideband.c  | 151 ++++++++++++++++++++++--------
 drivers/usb/host/xhci.c           |  55 -----------
 drivers/usb/host/xhci.h           |   2 -
 include/linux/usb/xhci-sideband.h |   4 +-
 4 files changed, 113 insertions(+), 99 deletions(-)

-- 
2.43.0

