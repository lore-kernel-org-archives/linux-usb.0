Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D33E5564
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089648; cv=none; b=ev1rbzdXRp5ro/MrUS6pMvLHokp9ODNrGerGn0sxMEMvjelKuQFNBDv/qAtJRPDrc+SORvcpSSdjC9NE9TWOY7q02BEssRmWqDBnM8cpSd24E6cAIQ+yjTTsk5a934lQPLsWZDFd7Ob2KHHdn5PSLREzo+mTPdFgbjEMUeAU71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089648; c=relaxed/simple;
	bh=gYYQoJwMyd6FSsY/FdGeLBewNBFYU0DVDXcyK/p1clA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lBZNjpLd7mtLimVSXD6JFlHxjDR8L27ZnmswTkPhL9chAS2ME77RmYcZK6xKAYbVt329orzaXHXWnklSnMJGPDWOhgxq84ibE9y/z74jsXrzRljuM4IpKh8K5R6k8K8qmp0PCmOcHGPWiQ4PjqYmzwLsp6PYA/W4xRr50vQxelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS3ckDDB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS3ckDDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783089646; x=1814625646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gYYQoJwMyd6FSsY/FdGeLBewNBFYU0DVDXcyK/p1clA=;
  b=WS3ckDDBD6sVzIAtlJ2aJ45PAG3XKajTrXBF3D9thtgtbRg2PkDucQRh
   s+ay1cu5/YIX30ZYxGet2SPpI9HAWNu8RBIBcZcHgnnsPb8vip39FmUCm
   3Mda1qp/pmuWUzcrIWfYRkaH8hJ8E3XOCB1MBUv4OaAJLsyl2I/ZYts85
   YcE94nj4lgFWN+VNN+6BP3l+FEQAW6EKfk5rIyhxr6Fe0IfkvGio6UVVM
   8fVlI1FMLDAboiU1Pffp7J4JImutsUUOn8PiKnLy8wynhBucZH6ynSHEO
   91OCNRgL+/aGSIuBleKKrsXf1b2XH5QnafNWz6+tkILlqYtwY7Tb6DfK5
   Q==;
X-CSE-ConnectionGUID: VFMsI3z5QTO+HrrPgQYq1Q==
X-CSE-MsgGUID: kA84CPECTPyZki2JSr6x+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101388356"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101388356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 07:40:45 -0700
X-CSE-ConnectionGUID: odFcZjUbSu+SlM9ylahqEg==
X-CSE-MsgGUID: G26w4as4STanaQJmdITuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252662609"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.154])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 07:40:43 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Fri,  3 Jul 2026 17:40:31 +0300
Message-ID: <20260703144033.483286-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

A couple small xhci fixes for usb-linus 7.2-rc.
Fix one memory leak, and one sleep in atomic during free.

Thanks
Mathias

Xu Rao (1):
  xhci: sideband: fix ring sg table pages leak

胡连勤 (1):
  usb: xhci: Fix sleep in atomic context in xhci_free_streams()

 drivers/usb/host/xhci-sideband.c |  2 ++
 drivers/usb/host/xhci.c          | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

